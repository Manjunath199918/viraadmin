part of '../view.dart';
TextEditingController startTime =TextEditingController();
TextEditingController endTime =TextEditingController();
TextEditingController eventname =TextEditingController();
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
                              width: 150.toAutoScaledWidth,child: TextField1(textEditingController: eventname,label: 'Starting Time')),
                          10.toHorizontalSizedBox,
                          SizedBox(
                              width: 150.toAutoScaledWidth,child: TextField1(textEditingController: eventname,label: 'Ending Time')),
                        ],
                      ),
                    ),



                    10.toVerticalSizedBox,
                    TextField1(textEditingController: eventname,label: 'Title'),
                    50.toVerticalSizedBox,
                    KFlatButton(onPressed: (){},height: 55.toAutoScaledHeight,child: Text('Upload',style: kTextStyles.s16WhiteBold,),)




                  ],
                ),
              ),
            )));
  }
}