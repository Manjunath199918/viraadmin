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
    required this.standard,
    required this.standardList,
    required this.pickedFilePath,
    required this.pickedFile,


  });

  final Status status;
  final int index;
  final UserModel? user;
  final int standard;
  final List<int> standardList;
  final String? pickedFilePath;
  final File? pickedFile;



  factory _ViewState.initial() {
    return _ViewState(
        status: Idle(),
        index:0,
        user:null,
        standard:0,
        standardList:[],
        pickedFilePath:'',
        pickedFile:null,




    );
  }

  _ViewState copyWith({
    Status? status,
    int? index,
    int? standard,
    UserModel? user,
    List<int>? standardList,
    String? pickedFilePath,
    File? pickedFile,



  }) {
    return _ViewState(
        status: status ?? this.status,
        index: index??this.index,
        user:user??this.user,
        standard:standard??this.standard,
        standardList:standardList??this.standardList,
        pickedFilePath:pickedFilePath??this.pickedFilePath,
        pickedFile:pickedFile??this.pickedFile

    );
  }
}

class _ViewController extends StateNotifier<_ViewState> {
  final _VSControllerParams params;
  _ViewController({required this.params}) : super(_ViewState.initial());

  Status get status => state.status;

  final AuthRepository _repository = AuthRepository();
  final persistentStorage = KPersistentStorage();
  TextEditingController phoneNumberController =TextEditingController();


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
  void addStandardList(int i)
  {
    if(state.standardList!.contains(i)){
      state.standardList.remove(i);
      state =state.copyWith(standardList: state.standardList);

    }else{
    state.standardList.add(i);
    state =state.copyWith(standardList: state.standardList);}


  }
  void onAllPressed()
  {
    if(state.standardList.isEmpty){
    List<int> standards=[0,1,2,3,4,5,6,7,8,9];
    state =state.copyWith(standardList: standards);}
    else{
      List<int> standards=[];
      state =state.copyWith(standardList: standards);
    }

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

  uploadFile(
      String title,
      String des,
      ) async {

    if (state.pickedFilePath!.isEmpty) {
      _error('error in uploading... try again later');
      _idle();
      return;
    }
    try {
      state =state.copyWith(
          status: Busy()
      );
      List classNames =[];
      for (var element in state.standardList) {
        classNames.add(Constants.classString[element]);
      }

      Reference storageReference = FirebaseStorage.instance.ref();
      Reference ref = storageReference.child(DateTime.now().millisecondsSinceEpoch.toString()+state.pickedFile!.path);
      UploadTask storageUploadTask = ref.putFile(state.pickedFile!);
      String imageUrl = await (await storageUploadTask).ref.getDownloadURL();

      DocumentReference timetable =
      FirebaseFirestore.instance.collection('${state.user!.schoolCode}Notice').doc();
      await timetable.set({
        'title': title,
        'description': des,
        'fileUrl': imageUrl,
        'date': DateTime.now(),
        'uploadedBy': '${state.user!.firstName} ${state.user!.lastName}',
        'uploadedId': state.user!.id,
        'appliedClasses':classNames,
      });
      state =state.copyWith(
          status: Idle()
      );
      KAppX.router.pop();
    } catch (e) {

      state =state.copyWith(
          status: Idle()
      );
      _error('error in uploading... try again later');
      _idle();
    }
  }


  moveToSubjectSelect(int i, int standard) {
    state = state.copyWith(index: i, standard: standard);
  }
  Future<String?> getDate(BuildContext context,var currentTheme )async{
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
            child:child!
        );
      },
    );

    if (pickedDate != null) {
      String formattedDate =
      DateFormat('yyyy-MM-dd').format(pickedDate);
      return formattedDate;
    } else {
      return null;
    }
  }


}
