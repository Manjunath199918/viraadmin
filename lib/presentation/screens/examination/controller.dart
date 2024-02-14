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
  openExamSelectionDialog(){
    KTextStyles kTextStyles =KTextStyles();
    KAppX.extendedRouter.dialogs.openDialog(body: (c){
      return Container(
          height:200.toAutoScaledHeight,
          width:320.toAutoScaledWidth,child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.toAutoScaledWidth,vertical: 20.toAutoScaledHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Select Your Exam Pattern',style: kTextStyles.s14PrimaryBold.copyWith(
                  decoration: TextDecoration.underline
                ),),
                20.toVerticalSizedBox,
                KFlatButton(child: Text('Series Exam',style: kTextStyles.s14WhiteBold,),height: 55.toAutoScaledHeight, onPressed: (){
                  KAppX.router.navigate(AddSeriesExam());
                }),
                10.toVerticalSizedBox,
                KFlatButton(child: Text('Single Exam',style: kTextStyles.s14WhiteBold,),height: 55.toAutoScaledHeight, onPressed: (){
                  KAppX.router.navigate(AddSingleExam());

                }),
              ],
            ),
          ));
    });
  }


}
