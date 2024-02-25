part of '../view.dart';
TextEditingController startTime =TextEditingController();
TextEditingController endTime =TextEditingController();
TextEditingController eventname =TextEditingController();
TextEditingController assignee = TextEditingController();
class CreateTimeTableEvent extends ConsumerWidget {
  final int? index;
  const CreateTimeTableEvent({Key? key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(KAppX.theme.current);

    KTextStyles kTextStyles = KTextStyles();

    final params = _VSControllerParams(index: index);
    final state = ref.watch(_vsProvider(params));
    final stateController = ref.read(_vsProvider(params).notifier);




    return  SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            if (state.index == 2 ){
              stateController.setIndex(1);

              return false;
            } else {
              return true;
            }
          },
          child: KScaffold(
              appBar:  KAppBar(

                title: Text('Upload Event',style: kTextStyles.s20WhiteBold,),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.toAutoScaledWidth),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.toVerticalSizedBox,
                      SizedBox(
                        width: 340.toAutoScaledWidth,
                        child: Row(
                          children: [
                            SizedBox(
                                width: 150.toAutoScaledWidth,child: TextField1(textEditingController: startTime..text=state.startTime!,label: 'Starting Time',
                              onTap: () async{
                                FocusScope.of(context).requestFocus( FocusNode());
                                stateController.getStartTime(context);
                              },),
                            ),
                            10.toHorizontalSizedBox,
                            SizedBox(
                                width: 150.toAutoScaledWidth,child: TextField1(textEditingController: endTime..text=state.endTime!,label: 'Ending Time',
                              onTap: () async{
                                FocusScope.of(context).requestFocus( FocusNode());
                                stateController.getEndTime(context);
                              },)),
                          ],
                        ),
                      ),



                      10.toVerticalSizedBox,
                      TextField1(textEditingController: eventname,label: 'Title'),
                      10.toVerticalSizedBox,
                      TextField1(textEditingController: assignee,label: 'Assignee'),
                      300.toVerticalSizedBox,
                      Align(
                          alignment:Alignment.bottomCenter,child: KFlatButton(
                        loadingWidget:CircularProgressIndicator(
                          color: currentTheme.themeBox.colors.white,
                        ) ,
                        loading: state.status is Busy,onPressed: (){},height: 55.toAutoScaledHeight,child: Text('Upload',style: kTextStyles.s16WhiteBold,),))




                    ],
                  ),
                ),
              )),
        ));
  }
}