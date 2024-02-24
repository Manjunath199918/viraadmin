part of 'view.dart';

class _VSControllerParams extends Equatable {
  final int? index;
  final String? collectionName;
  _VSControllerParams({
    this.index,
    this.collectionName,
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
    required this.collectionName,
    required this.pickedFile,

  });

  final Status status;
  final int index;
  final String collectionName;
  final String? pickedFile;



  factory _ViewState.initial() {
    return _ViewState(
        status: Idle(),
        index:0,
        collectionName:'',
      pickedFile: ''




    );
  }

  _ViewState copyWith({
    Status? status,
    int? index,
    String? collectionName,
    String? pickedFile


  }) {
    return _ViewState(
        status: status ?? this.status,
        index: index??this.index,
        collectionName:collectionName??this.collectionName,
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

  init(){
    state =state.copyWith(index:params.index,collectionName: params.collectionName);
  }
  void setIndex(int i){
    state =state.copyWith(index:i);
  }
  pickFile()async{

try{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc','jpeg','png'],
    );
    log('eralivbkjhvbahjkvshjsdvba');

    log(result.toString());
    log('eralivbkjhvbahjkvshjsdvba');

    if (result != null) {
      File file = File(result.files.single.path!);
      state =state.copyWith(
        pickedFile: result.files.single.path!.split('/').last
      );
    } else {
      _error("No file selected");
      _idle();
    }}catch(e){
  _error("$e error detected");
  _idle();
}
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
