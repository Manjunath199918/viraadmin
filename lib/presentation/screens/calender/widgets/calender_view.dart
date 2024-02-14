part of '../view.dart';
class CalenderView extends ConsumerWidget {
  final int? index;
  const CalenderView({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(KAppX.theme.current);

    KTextStyles kTextStyles = KTextStyles();

    final params = _VSControllerParams();
    final state = ref.watch(_vsProvider(params));
    final stateController = ref.read(_vsProvider(params).notifier);
    return SafeArea(
      child: KScaffold(
        appBar: KAppBar(
          title: Text(
            'Calender',
            style: kTextStyles.s20WhiteBold,
          ),
        ),
        floatingActionButton: Padding(
          padding:  EdgeInsets.only(left: 20.toAutoScaledWidth),
          child: KFlatButton(child: Text('Upload Event for this day',style: kTextStyles.s16WhiteBold,), onPressed: (){
            // stateController.setIndex(1);
          },height: 55.toAutoScaledHeight,),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              KCard(
                backgroundColor: currentTheme.themeBox.colors.blueVarient,

                child: TableCalendar(
                  focusedDay: DateTime.now(),
                  firstDay: DateTime.utc(2023, 6, 1),
                  lastDay: DateTime.utc(2024, 6, 1),
                  headerStyle:  HeaderStyle(
                    titleTextStyle: kTextStyles.s16PrimaryBold,
                    titleCentered: true,
                    formatButtonVisible: false,
                  ),
                  calendarBuilders: CalendarBuilders(
                    dowBuilder: (context, day) {
                      if (true) {
                        final text = DateFormat.E().format(day);

                        return Center(
                          child: Text(
                            text,
                            style: kTextStyles.s16DarkBlueBold,
                          ),
                        );
                      }
                    },
                  ),
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  calendarStyle: CalendarStyle(
                    weekendTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: currentTheme.themeBox.fontSizes.s14,
                        color: currentTheme.themeBox.colors.black),
                    todayDecoration: BoxDecoration(
                      color: currentTheme.themeBox.colors.darkBlue,
                      shape: BoxShape.circle,
                    ),

                    // Use `CalendarStyle` to customize the UI
                    outsideDaysVisible: false,
                    defaultTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: currentTheme.themeBox.fontSizes.s14,
                        color: currentTheme.themeBox.colors.black),
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,i){return KCard(
                boxShadow: [BoxShadow(
                  color: currentTheme.themeBox.colors.paleGrey,
                  blurRadius: 5.toAutoScaledWidth,
                ),],
                paddingTop: 7.toAutoScaledHeight,
                paddingBottom: 8.toAutoScaledHeight,
                width: 320.toAutoScaledWidth,
                height: 120.toAutoScaledHeight,
                backgroundColor: currentTheme.themeBox.colors.white,
                child: InkWell(
                  onTap: (){
                    // stateController.setIndex(1);
                  },
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.toAutoScaledWidth,vertical: 10.toAutoScaledHeight),
                    child: Column(
                      children:  [
                        Text("Attention all sports enthusiasts! We've got a small but exciting sports notice to share.We've got a small but exciting sports notice to share",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: kTextStyles.s16BlackBold,),
                        10.toVerticalSizedBox,
                        Row(
                          children: [
                            Row(
                              children:  [
                                Icon(Icons.person,size: 20,color: currentTheme.themeBox.colors.onBackgroundVariant,),
                                5.toHorizontalSizedBox,
                                Text('Manjunath' ,style:kTextStyles.s14onBackgroundVariantRegular,)


                              ],
                            ),
                            25.toHorizontalSizedBox,
                            Row(
                              children:  [
                                Icon(Icons.calendar_month_rounded,size: 20,color: currentTheme.themeBox.colors.onBackgroundVariant,),
                                5.toHorizontalSizedBox,
                                Text('4 Mar,2021' ,style:kTextStyles.s14onBackgroundVariantRegular,)


                              ],
                            )

                          ],
                        ),
                        10.toVerticalSizedBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Sport',style:kTextStyles.s14BlackBold.copyWith(
                                color: getColour(i,currentTheme)
                            ),),
                            Icon(Icons.keyboard_arrow_right,size: 20,color: getColour(i,currentTheme)),


                          ],
                        )

                      ],
                    ),
                  ),
                ),
              );},itemCount: 5,),

            ],
          ),
        ),
      ),
    );
  }
  Color? getColour(int i,KThemeState currentTheme){
    if(i==0){
      return currentTheme.themeBox.colors.green;
    }
    if(i==1){
      return currentTheme.themeBox.colors.darkBlue;
    }
    if(i==2){
      return currentTheme.themeBox.colors.green;
    }
    if(i%3==0){
      return currentTheme.themeBox.colors.darkBlue;
    }
    if(i%3==1){
      return currentTheme.themeBox.colors.onError;
    }

    if(i%3==2){
      return currentTheme.themeBox.colors.darkBlue;
    }

  }
}