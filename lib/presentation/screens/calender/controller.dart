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
  const _ViewState({
    required this.status,
    required this.index,
    required this.user,
    required this.selectedDate,
    required this.pickedFilePath,
    required this.pickedFile,
  });

  final Status status;
  final int index;
  final UserModel? user;
  final DateTime? selectedDate;
  final String? pickedFilePath;
  final File? pickedFile;

  factory _ViewState.initial() {
    return _ViewState(
        status: Idle(),
        index: 0,
        user: null,
        selectedDate: DateTime.now(),
        pickedFilePath: '',
        pickedFile: null);
  }

  _ViewState copyWith({
    Status? status,
    int? index,
    UserModel? user,
    DateTime? selectedDate,
    String? pickedFilePath,
    File? pickedFile,
  }) {
    return _ViewState(
        status: status ?? this.status,
        index: index ?? this.index,
        user: user ?? this.user,
        selectedDate: selectedDate ?? this.selectedDate,
        pickedFilePath: pickedFilePath ?? this.pickedFilePath,
        pickedFile: pickedFile ?? this.pickedFile);
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

  init() {
    state = state.copyWith(index: params.index);
    getUserInfo();
  }

  getUserInfo() async {
    final UserModel? userInfo = await persistentStorage.retrieve(
        key: 'user_details',
        decoder: (val) {
          return UserModel.fromJson(jsonDecode(val));
        });
    state = state.copyWith(user: userInfo);
  }

  void setDate(DateTime selectedday) {
    state = state.copyWith(selectedDate: selectedday);
  }

  void setIndex(int i) {
    state = state.copyWith(index: i);
  }

  pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'pdf', 'doc', 'jpeg', 'png'],
      );

      if (result != null) {
        File file = File(result.files.single.path!);
        state = state.copyWith(
            pickedFile: File(result.files.single.path!),
            pickedFilePath: result.files.single.path!.split('/').last);
      } else {
        _error("No file selected");
        _idle();
      }
    } catch (e) {
      _error("$e error detected");
      _idle();
    }
  }

  uploadEvent(
    String title,
    String des,
  ) async {
    if (state.pickedFilePath!.isEmpty) {
      _error('error in uploading... try again later');
      _idle();
      return;
    }
    try {
      state = state.copyWith(status: Busy());

      Reference storageReference = FirebaseStorage.instance.ref();
      Reference ref = storageReference.child(DateTime.now().millisecondsSinceEpoch.toString()+state.pickedFile!.path);
      UploadTask storageUploadTask = ref.putFile(state.pickedFile!);
      String imageUrl = await (await storageUploadTask).ref.getDownloadURL();

      DocumentReference timetable = FirebaseFirestore.instance
          .collection('${state.user!.schoolCode}${Constants.calenderEvents}')
          .doc();
      await timetable.set({
        'title': title,
        'description': des,
        'fileUrl': imageUrl,
        'date': state.selectedDate,
        'uploadedBy': '${state.user!.firstName} ${state.user!.lastName}',
        'uploadedId': state.user!.id
      });
      state = state.copyWith(status: Idle());
      KAppX.router.pop();
    } catch (e) {
      state = state.copyWith(status: Idle());
      _error('error in uploading... try again later');
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
