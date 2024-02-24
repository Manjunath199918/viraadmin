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

final _vsProvider = StateNotifierProvider.autoDispose
    .family<_ViewController, _ViewState, _VSControllerParams>((ref, params) {
  final stateController = _ViewController(params: params);
  stateController.init();
  return stateController;
});

class _ViewState {
  const _ViewState(
      {required this.status,
      required this.index,
      required this.standard,
      required this.subject,
      required this.user});

  final Status status;
  final int index;
  final int standard;
  final int subject;
  final UserModel? user;

  factory _ViewState.initial() {
    return _ViewState(
      status: Idle(),
      index: 0,
      standard: 0,
      subject: 0,
      user: null,
    );
  }

  _ViewState copyWith({
    Status? status,
    int? index,
    int? standard,
    int? subject,
    UserModel? user,
  }) {
    return _ViewState(
        status: status ?? this.status,
        index: index ?? this.index,
        standard: standard ?? this.standard,
        subject: subject ?? this.subject,
        user: user ?? this.user);
  }
}

class _ViewController extends StateNotifier<_ViewState> {
  final _VSControllerParams params;
  _ViewController({required this.params}) : super(_ViewState.initial());

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

  init() async {
    state = state.copyWith(index: params.index);
    await getUserInfo();
  }

  getUserInfo() async {
    final UserModel? userInfo = await persistentStorage.retrieve(
        key: 'user_details',
        decoder: (val) {
          return UserModel.fromJson(jsonDecode(val));
        });
    state = state.copyWith(user: userInfo);
  }

  void setIndex(int i) {
    state = state.copyWith(index: i);
  }

  moveToSubjectSelect(int i, int standard) {
    state = state.copyWith(index: i, standard: standard);
  }

  moveToMediaRoute(int subject) {
    state = state.copyWith(subject: subject);
    setIndex(2);



  }
 createMediaPressed(){
   String collectionName = state.user!.schoolCode +
       Constants.classString[state.standard] +
       Constants.subjectString[state.subject];
   KAppX.router.navigate(CreateMedia(collectionName: collectionName));
 }
  getNotes() async {
    String collectionName = state.user!.schoolCode +
        Constants.classString[state.standard] +
        Constants.subjectString[state.subject];

    state = state.copyWith(status: Busy());
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection(collectionName);
      QuerySnapshot faculty = await users.limit(10).get();
      if (faculty.docs.isEmpty) {
        state = state.copyWith(status: Idle());
        _error('No Media available at the moment');
        _idle();
      } else {
        for (var element in faculty.docs) {

        }
        Map<String, dynamic> data =
            faculty.docs.first.data() as Map<String, dynamic>;
      }
    } catch (e) {
      state = state.copyWith(status: Idle());
      _error('Something Went Wrong \n Please try again later');
      _idle();
    }
  }

  Future<String?> getDate(BuildContext context, var currentTheme) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2024),
      builder: (BuildContext context, Widget? child) {
        return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                primary: currentTheme.themeBox.colors.darkBlue,
              ),
            ),
            child: child!);
      },
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      return formattedDate;
    } else {
      return null;
    }
  }
}
