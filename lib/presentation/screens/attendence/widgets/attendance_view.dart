part of '../view.dart';
class AttendanceView extends ConsumerWidget {
  final int? index;
  const AttendanceView({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(KAppX.theme.current);

    KTextStyles kTextStyles = KTextStyles();

    final params = _VSControllerParams(index: index);
    final state = ref.watch(_vsProvider(params));
    final stateController = ref.read(_vsProvider(params).notifier);

    return SafeArea(
        child: KScaffold(
            extendedBehindAppbar: true,
            appBar: KAppBar(
              title: Text(
                'Attendance',
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
                     Text('9th,Feb 2024 ',style: kTextStyles.s16PrimaryBold.copyWith(
                       decoration: TextDecoration.underline,
                     ),),
                    20.toVerticalSizedBox,

                    SizedBox(width:320.toAutoScaledWidth,child: Text('Today\'s Absent',style: kTextStyles.s14PrimaryBold,)),
                    MediaQuery.removePadding(

                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 15,
                          itemBuilder: (context,i){
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                KCard(
                                  paddingTop: 5.toAutoScaledHeight,
                                  paddingBottom: 5.toAutoScaledHeight,
                                  // height: 55.toAutoScaledHeight,
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 15.toAutoScaledWidth,vertical: 10.toAutoScaledWidth),
                                    child: Row(
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Manjunath',style: kTextStyles.s14PrimaryBold,),
                                            5.toVerticalSizedBox,
                                            Text('S/O Amaregouda Patil ',style: kTextStyles.s12GreyVariantRegular),

                                          ],
                                        ),
                                        Spacer(),
                                        Checkbox(
                                          checkColor: Colors.white,
                                          side: BorderSide(
                                              color: currentTheme.themeBox.colors.black
                                          ),
                                          fillColor: MaterialStateProperty.all<Color>(currentTheme.themeBox.colors.primary),

                                          value: !false,
                                          shape: CircleBorder(),
                                          onChanged: (bool? value) {

                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );}),
                    ),

                  ],
                ))));
  }
}