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

  });

  final Status status;
  final int index;



  factory _ViewState.initial() {
    return _ViewState(
        status: Idle(),
        index:0




    );
  }

  _ViewState copyWith({
    Status? status,
    int? index


  }) {
    return _ViewState(
        status: status ?? this.status,
        index: index??this.index

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
    state =state.copyWith(index:params.index);
  }
  onDashBoardPressed(){
    KAppX.router.navigate(DashBoardRoute());
  }
  onHomeWorkPressed(){
    KAppX.router.navigate(Homework());
  }
  onTimeTablePressed()async{

      // DocumentReference users =
      // FirebaseFirestore.instance.collection('PBALteachers').doc();
      //
      // await users.set({
      //   Constants.firstName:'Manjunath',
      //   Constants.lastName:'Patil',
      //   Constants.dateOfBirth:DateTime.now(),
      //   Constants.createdAt:DateTime.now(),
      //   Constants.updatedAt:DateTime.now(),
      //   Constants.bloodGroup:'AB+',
      //   Constants.schoolName:'Pba Central Cbse Sch Lingasugur',
      //   Constants.emergencyContact:'+919901148011',
      //   Constants.schoolCode:'PBAL',
      //   Constants.schoolId:'feqbvfebukhvwef',
      //   Constants.teacherId:'PBALFA001',
      //   Constants.id:users.id,
      //
      // });


    KAppX.router.navigate(TimeTableRoute());
  }
  onAttendancePressed(){
    KAppX.router.navigate(Attendance(index: 0));
  }
  onFeeDetailsPressed(){
    KAppX.router.navigate(FeeHomeRoute());

  }
  onExaminationPressed(){
    KAppX.router.navigate(ExamniationRoute());

  }
  onReportCardPressed(){
    KAppX.router.navigate(ReportCard());

  }
  onCalenederPressed(){
    KAppX.router.navigate(CalenderRoute());

  }
  onNoticeBoardPressed(){
    KAppX.router.navigate(NoticeBoardRoute());

  }
  onMultiMediaPressed(){
    KAppX.router.navigate(MultiMedia());

  }
  onSubjectPressed(){
    KAppX.router.navigate(SubjectRoute());

  }
  onProfilePressed(){
    KAppX.router.navigate(ProfileRoute());

  }


  void setIndex(int i){
    state =state.copyWith(index:i);
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