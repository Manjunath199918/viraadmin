part of 'view.dart';

class _VSControllerParams extends Equatable {
  final int? index;
  _VSControllerParams({
    this.index,
  });
  @override
  List<Object> get props => [];
}

final _paramsProvider = Provider<_VSControllerParams>((ref) {
  throw UnimplementedError();
});

// final _loginController =
//     StateNotifierProvider<_LoginController, _LoginState>((ref) {
//   final stateController = _LoginController()..init();
//   return stateController;
// });

final _loginController = StateNotifierProvider.autoDispose
    .family<_LoginController, _LoginState, _VSControllerParams>((ref, params) {
  final stateController = _LoginController(params: params);
  stateController.init();
  return stateController;
});

class _LoginState {
  const _LoginState(
      {required this.status,
      required this.phoneNumber,
      required this.otpVerified,
      required this.email,
      required this.index,
      required this.showOTPDialog,
      required this.validPhoneNUmber,
      required this.userName,
      required this.passWord});

  final Status status;
  final String phoneNumber;
  final String email;
  final bool otpVerified;
  final bool showOTPDialog;
  final int index;
  final bool validPhoneNUmber;
  final String userName, passWord;

  factory _LoginState.initial() {
    return _LoginState(
        status: Idle(),
        phoneNumber: '',
        email: '',
        otpVerified: false,
        index: 0,
        showOTPDialog: false,
        validPhoneNUmber: true,
        userName: '',
        passWord: '');
  }

  _LoginState copyWith({
    Status? status,
    String? phoneNumber,
    bool? otpVerified,
    int? index,
    bool? showOTPDialog,
    String? email,
    bool? validPhoneNUmber,
    String? userName,
    String? passWord,
  }) {
    return _LoginState(
        status: status ?? this.status,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        otpVerified: otpVerified ?? this.otpVerified,
        index: index ?? this.index,
        showOTPDialog: showOTPDialog ?? this.showOTPDialog,
        email: email ?? this.email,
        userName: userName ?? this.userName,
        passWord: passWord ?? this.passWord,
        validPhoneNUmber: validPhoneNUmber ?? this.validPhoneNUmber);
  }
}

class _LoginController extends StateNotifier<_LoginState> {
  final _VSControllerParams params;
  _LoginController({required this.params}) : super(_LoginState.initial());

  Status get status => state.status;

  final AuthRepository _repository = AuthRepository();
  final persistentStorage = KPersistentStorage();
  TextEditingController phoneNumberController = TextEditingController();

  void _error(String message) {
    state = state.copyWith(status: Error(message));
  }

  void _idle() {
    state = state.copyWith(status: Idle());
  }

  void init() async {
    setIndex();
    //requestTrackingPermission();
  }
  setIndex()async{
    final UserModel? userInfo = await persistentStorage.retrieve(
        key: 'user_details',
        decoder: (val) {
          return UserModel.fromJson(jsonDecode(val));
        });
    if(userInfo==null){
      state =state.copyWith(
        index: 0
      );
    }
    else{
      state =state.copyWith(
          index: 1
      );
    }
  }

  int? _resendToken;
  String? _verificationCode;

  OTPInteractor? _otpInteractor;
  OTPTextEditController? controller;
  checkValidPhoneNumber() {
    state = state.copyWith(validPhoneNUmber: false);
  }

  void _listenForOTP() {
    if (Platform.isIOS) {
      controller = OTPTextEditController(codeLength: 6);
      return;
    }

    try {
      _otpInteractor = OTPInteractor();
      controller = OTPTextEditController(
        codeLength: 6,
        otpInteractor: _otpInteractor,
      );

      controller?.startListenRetriever(
        (code) {
          final exp = RegExp(r'(\d{6})');
          return exp.stringMatch(code ?? '') ?? '';
        },
      );
    } catch (err) {
      controller = OTPTextEditController(codeLength: 6);
    }
  }

  setDate(BuildContext context, var currentTheme) async {
    String? date = await getDate(context, currentTheme);
    state = state.copyWith(passWord: date);
  }

  Future<String?> getDate(BuildContext context, var currentTheme) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(1999),
      firstDate: DateTime(1990),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget? child) {
        return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                primary: currentTheme.themeBox.colors.primary,
              ),
            ),
            child: child!);
      },
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
      return formattedDate;
    } else {
      return null;
    }
  }

  void verifyPhone(String phone) async {
    if (phone.length != 10) {
      _error('Enter correct phone number.');
      _idle();
      return;
    }

    // Set the state to be busy
    state = state.copyWith(status: Busy(), phoneNumber: phone);

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91$phone',
      verificationCompleted: (credential) {},
      // timeout: Duration.zero,
      verificationFailed: (exception) {
        _error(exception.message ?? 'Enter correct phone number.');
        _idle();
        return;
      },
      codeSent: (verificationId, forceResendingToken) {
        _verificationCode = verificationId;
        _resendToken = forceResendingToken;

        // open the OTP screen
        _listenForOTP();
        state = state.copyWith(status: Idle(), index: 1);
      },
      codeAutoRetrievalTimeout: (verificationId) {},
      forceResendingToken: _resendToken,
    );
  }

  void verifyOTP() async {
    if (_verificationCode == null) {
      _error('Something went wrong!');
      _idle();
      return;
    }

    state = state.copyWith(status: Busy());

    final response = await _repository.verifyOTP(
      request: VerifyOTPRequest(
        verificationId: _verificationCode!,
        code: controller!.text,
      ),
    );

    response.resolve(
      (s) {
        state = state.copyWith(status: Idle());
        state = state.copyWith(index: 2);
        // _fetchUserDetails();
        KAppX.router.pop();
      },
      (f) {
        _error(f.message ?? 'Enter the correct OTP.');
        _idle();
      },
    );
  }

  void _fetchUserDetails() async {
    state = state.copyWith(status: Busy());

    final response = await _repository.fetchUserDetailsByPhone(
      request: FetchUserDetailsByPhoneRequest(phone: state.phoneNumber),
    );

    response.resolve(
      (s) async {
        await persistentStorage.store<UserModel>(
          key: 'user_details',
          data: s.user,
          encoder: (val) {
            return jsonEncode(val.toJson());
          },
        );
        KAuth.instance.actions.onLogIn(s.authCred);
        KNotificationBox.instance.onLogin();

        state = state.copyWith(status: Idle());
        KAppX.router.replaceNamed('/bottomNavigator');
      },
      (f) {
        // user has not signed up
        if (f.statusCode == 404) {
          initialize();
          state = state.copyWith(status: Idle(), index: 2);
        }
      },
    );
  }

  void signInWithGoogle() async {
    state = state.copyWith(status: Busy());

    final response = await _repository.signInWithGoogle(
      request: SignInWithGoogleRequest(),
    );

    response.resolve(
      (s) {
        initialize();
        state = state.copyWith(
          status: Idle(),
          email: s.email,
          index: 2,
        );
      },
      (f) {
        _error('Something went wrong!');
        _idle();
      },
    );
  }

  // Profile Input
  TextEditingController? nameController, ageController, referCode;
  // Default profile picture
  final String profilePhotoUrl = 'https://firebasestorage.googleapis.com/v0/b'
      '/credwise-92aaa.appspot.com/o/default_profile.png?alt=media&'
      'token=fbce7894-a3ca-4b6e-8a64-e16516f102cd';

  void initialize() {
    nameController = TextEditingController();
    ageController = TextEditingController();
    referCode = TextEditingController();
  }

  void createUser(int index) async {
    CreateUserRequest request;

    String? tokenss = await KNotificationBox.instance.token;

    try {
      request = CreateUserRequest(
          birthYear:
              (DateTime.now().year - int.parse(ageController!.text.trim()))
                  .toString(),
          displayName: nameController!.text.trim(),
          emailId: 'user@credwise.co.in',
          gender: index == 0 ? 'Male' : 'Female',
          phoneNumber: state.phoneNumber,
          profilePhotoUrl: profilePhotoUrl,
          referredBy: referCode!.text.trim(),
          fcmToken: tokenss);
    } catch (e) {
      if (nameController!.text.trim() == '') {
        _error('Please enter your name');
        _idle();
        return;
      }
      if (ageController!.text.trim() == '') {
        _error('Please enter your age');
        _idle();
        return;
      }
      _error('Intialization Error...');
      _idle();
      return;
    }
    String? firebaseToken = await KAuth.instance.getters.token;
    final response = await _repository.createUser(
        request: request, firebaseToken: firebaseToken!);

    response.resolve(
      (s) async {
        await persistentStorage.store<UserModel>(
          key: 'user_details',
          data: s.user,
          encoder: (val) {
            return jsonEncode(val.toJson());
          },
        );

        KAppX.router.replaceNamed('/bottomNavigator');

        late FirebaseAnalytics firebaseAnalytics;
        firebaseAnalytics = GoogleAnalytics.init();
        if (Platform.isAndroid) {
          firebaseAnalytics.logEvent(
              name: 'android_new_user', parameters: {'user_details': s.user});
        } else {
          firebaseAnalytics.logEvent(
              name: 'ios_new_user', parameters: {'user_details': s.user});
        }
      },
      (f) {
        _error(f.message ?? 'Something went wrong!');
        _idle();
      },
    );
  }

  void signUp(String userName, String passWord) async {
    String schoolCode = userName.substring(7, 11);
    state =state.copyWith(
      status: Busy()
    );
    try{
    CollectionReference users =
        FirebaseFirestore.instance.collection('FACULTY$schoolCode');
    QuerySnapshot faculty =
        await users.where(Constants.teacherId, isEqualTo: userName).get();
    if (faculty.docs.isEmpty) {
      _error('Please check your credential Once');
      _idle();
    } else {
      Map<String, dynamic> data = faculty.docs.first.data() as Map<String, dynamic>;
      if (data[Constants.passWord] == passWord) {
       UserModel user = UserModel.fromJson(data);
       await persistentStorage.store<UserModel>(
          key: 'user_details',
          data: user,
          encoder: (val) {
            return jsonEncode(val.toJson());
          },
        );
       state =state.copyWith(
         index: 1,
           status: Idle()
       );


      }else{
        state =state.copyWith(

            status: Idle()
        );
        _error('Incorrect Password \n P.s:- The password is your date of birth');
        _idle();
      }
    }
   }catch(e){
     state =state.copyWith(

         status: Idle()
     );
     _error('Something Went Wrong \n Please try again later');
     _idle();
   }
    // log(data.docs.first.data().toString());

    // String classCode = userName.substring(4, 8);
    // Map classString ={
    //   '01':Constants.firstClass,
    //   '02':Constants.secondClass,
    //   '03':Constants.thirdClass,
    //   '04':Constants.fourthClass,
    //   '05':Constants.fifthClass,
    //   '06':Constants.sixthClass,
    //   '07':Constants.sevenClass,
    //   '08':Constants.eightClass,
    //   '09':Constants.nineClass,
    //   '10':Constants.tenClass,
    // };
  }
}
