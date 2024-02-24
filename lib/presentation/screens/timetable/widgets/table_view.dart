part of '../view.dart';
class TableView extends ConsumerWidget {
  final int? index;
  const TableView({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(KAppX.theme.current);

    KTextStyles kTextStyles = KTextStyles();

    final params = _VSControllerParams(index: index);
    final state = ref.watch(_vsProvider(params));
    final stateController = ref.read(_vsProvider(params).notifier);

    return SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            if (state.index == 1 ){
              stateController.setIndex(0);

              return false;
            } else {
              return true;
            }
          },
          child: KScaffold(
              extendedBehindAppbar: true,
              appBar: KAppBar(
                title: Text(
                  'Time Table',
                  style: kTextStyles.s16WhiteBold,
                ),
              ),
              body:
              SingleChildScrollView(
                  child: Column(
                    children: [
                      50.toVerticalSizedBox,
                      TableCalendar(
                        focusedDay: DateTime.now(),
                        firstDay: DateTime(
                          2023,
                        ),
                        lastDay: DateTime(
                          2025,
                        ),
                        calendarFormat: CalendarFormat.week,
                        headerStyle:  HeaderStyle(
                            titleTextStyle: kTextStyles.s16BlackBold,
                            titleCentered: true,
                            formatButtonVisible: false
                        ),
                      ),
                      20.toVerticalSizedBox,
                      MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                            itemBuilder: (context,i){
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 20.toAutoScaledWidth),
                                  child: Text('10:30 - 12:30',style: kTextStyles.s16BlackBold,),
                                ),
                                KCard(
                                  paddingTop: 10.toAutoScaledHeight,
                          paddingBottom: 10.toAutoScaledHeight,
                          // height: 55.toAutoScaledHeight,
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 15.toAutoScaledWidth,vertical: 10.toAutoScaledWidth),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('English Grammer',style: kTextStyles.s16BlackBold,),
                                        5.toVerticalSizedBox,
                                        Text('Mr.John ',style: kTextStyles.s14greyVariantBold)
                                      ],
                                    ),
                                  ),
                        ),
                              ],
                            );}),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20.toAutoScaledWidth),
                        child: KFlatButton(onPressed: (){
                          stateController.setIndex(2);
                        },
                          height:50.toAutoScaledHeight,color: currentTheme.themeBox.colors.blackVariant,child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_circle_outline_sharp,size: 20.toAutoScaledWidth,color: currentTheme.themeBox.colors.white,),
    10.toHorizontalSizedBox,
                            Text('Create Special Events',style: kTextStyles.s16WhiteBold,),
                          ],
                        ),),
                      )
                    ],
                  ))),
        ));
  }
}