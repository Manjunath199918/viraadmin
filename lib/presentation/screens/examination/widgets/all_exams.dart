part of '../view.dart';

class AllExams extends ConsumerWidget {
  int? index;
  AllExams({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(KAppX.theme.current);

    KTextStyles kTextStyles = KTextStyles();
    final params = _VSControllerParams(index: index);
    final state = ref.watch(_vsProvider(params));
    final stateController = ref.read(_vsProvider(params).notifier);

    return SafeArea(
        child: KScaffold(
            appBar: KAppBar(
              title: Text(
                'Examination',
                style: kTextStyles.s18WhiteBold,
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.all(20.toAutoScaledWidth),
                    child: Container(
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.all(Radius.circular(15.toAutoScaledWidth)),
                      //   color: currentTheme.themeBox.colors.greyVariant,
                      // ),

                      width: 360.toAutoScaledWidth,
                      height: 40.toAutoScaledHeight,
                      // color: currentTheme.themeBox.colors.darkBlue,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[

                          for (int i = 0; i < 2; i++)
                            if (i == state.index) ...[
                              Row(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        stateController.setIndex(i);
                                      },
                                      child: tabBar(true, ref, i)),
                                  10.toHorizontalSizedBox
                                ],
                              )
                            ] else
                              Row(
                                children: [

                                  InkWell( onTap: () {
                                    stateController.setIndex(i);
                                  },child: tabBar(false, ref, i)),
                                  10.toHorizontalSizedBox,
                                ],
                              ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10.toAutoScaledWidth,
                        top: 20.toAutoScaledHeight,
                        bottom: 10.toAutoScaledHeight),
                    child: Text(
                      'Single Examination List',
                      style: kTextStyles.s16PrimaryBold,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      return KCard(
                        paddingTop: i == 0
                            ? 10.toAutoScaledHeight
                            : 20.toAutoScaledHeight,
                        paddingBottom: 0,
                        paddingLeft: 10.toAutoScaledWidth,
                        paddingRight: 10.toAutoScaledWidth,
                        height: 120.toAutoScaledHeight,
                        backgroundColor: getColour(i, currentTheme),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 10.toAutoScaledHeight,
                              left: 15.toAutoScaledWidth),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Exam 1',
                                    style: kTextStyles.s12BlackBold,
                                  ),
                                  10.toVerticalSizedBox,
                                  Text(
                                    'Mathematics',
                                    style: kTextStyles.s20BlackBold,
                                  ),
                                  10.toVerticalSizedBox,
                                  Row(
                                    children: [
                                      KImage(
                                          imageUrl: 'assets/exams/img.png',
                                          width: 15.toAutoScaledWidth,
                                          height: 15.toAutoScaledHeight),
                                      5.toHorizontalSizedBox,
                                      Text(
                                          'Date:  ${DateFormat('EEE ,MMM d ,yyyy').format(DateTime.now())}')
                                    ],
                                  ),
                                  10.toVerticalSizedBox,
                                  KCard(
                                    paddingRight: 0,
                                    paddingLeft: 0,
                                    paddingTop: 0,
                                    paddingBottom: 0,
                                    height: 20.toAutoScaledHeight,
                                    width: 70.toAutoScaledWidth,
                                    backgroundColor: i != 0
                                        ? currentTheme.themeBox.colors.onError
                                        : currentTheme
                                        .themeBox.colors.whatsappColor,
                                    child: Center(
                                      child: Text(
                                        i != 0?'Pending': 'Completed',
                                        style: kTextStyles.s12WhiteBold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 15.toAutoScaledWidth,
                                    color: currentTheme.themeBox.colors.black.withOpacity(0.5),
                                  )),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10.toAutoScaledWidth,
                        top: 20.toAutoScaledHeight,
                        bottom: 10.toAutoScaledHeight),
                    child: Text(
                      'Series Examination List',
                      style: kTextStyles.s18DarkBlueBold,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      return KCard(
                        paddingTop: i == 0
                            ? 10.toAutoScaledHeight
                            : 20.toAutoScaledHeight,
                        paddingBottom: 0,
                        paddingLeft: 10.toAutoScaledWidth,
                        paddingRight: 10.toAutoScaledWidth,
                        height: 100.toAutoScaledHeight,
                        backgroundColor: getColour(i, currentTheme),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 10.toAutoScaledHeight,
                              left: 15.toAutoScaledWidth,
                              bottom: 10.toAutoScaledHeight),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text(
                                    'Sem 1 Series',
                                    style: kTextStyles.s20BlackBold,
                                  ),
                                  10.toVerticalSizedBox,
                                  Row(
                                    children: [
                                      KImage(
                                          imageUrl: 'assets/exams/img.png',
                                          width: 15.toAutoScaledWidth,
                                          height: 15.toAutoScaledHeight),
                                      5.toHorizontalSizedBox,
                                      Text(
                                          'Date:  ${DateFormat('EEE ,MMM d ,yyyy').format(DateTime.now())}')
                                    ],
                                  ),
                                  10.toVerticalSizedBox,
                                  KCard(
                                    paddingRight: 0,
                                    paddingLeft: 0,
                                    paddingTop: 0,
                                    paddingBottom: 0,
                                    height: 20.toAutoScaledHeight,
                                    width: 70.toAutoScaledWidth,
                                    backgroundColor: i != 0
                                        ? currentTheme.themeBox.colors.onError
                                        : currentTheme
                                        .themeBox.colors.whatsappColor,
                                    child: Center(
                                      child: Text(
                                        i != 0?'Pending': 'Completed',
                                        style: kTextStyles.s12WhiteBold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 15.toAutoScaledWidth,
                                    color: currentTheme.themeBox.colors.black.withOpacity(0.5),
                                  )),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: 2,
                  ),

                  // 50.toVerticalSizedBox,
                ],
              ),
            )));
  }

  Widget tabBar(bool isActive, WidgetRef ref, int i) {
    final currentTheme = ref.watch(KAppX.theme.current);
    List<String> heading = ['Pending', 'Completed'];
    KTextStyles kTextStyles = KTextStyles();
    return Container(
      decoration: BoxDecoration(
        // color: currentTheme.themeBox.colors.blankButton.withOpacity(0.04),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.toAutoScaledWidth),
            topRight: Radius.circular(12.toAutoScaledWidth),
            bottomLeft: Radius.circular(12.toAutoScaledWidth),
            bottomRight: Radius.circular(12.toAutoScaledWidth),
          ),
          color: isActive
              ? currentTheme.themeBox.colors.primary
              : currentTheme.themeBox.colors.primary.withOpacity(0.3)),
      height: 50.toAutoScaledHeight,
      width: 150.toAutoScaledWidth,
      child: Center(
        child: Text(
          heading[i],
          style:
          isActive ? kTextStyles.s12WhiteRegular : kTextStyles.s12BlackBold,
        ),
      ),
    );
  }

  Color? getColour(int i, var currentTheme) {
    if (i == 0) {
      return currentTheme.themeBox.colors.greenvariant;
    }
    if (i == 1) {
      return currentTheme.themeBox.colors.pinkVarinet;
    }
    if (i == 2) {
      return currentTheme.themeBox.colors.blueVarient;
    }
    if (i % 3 == 0) {
      return currentTheme.themeBox.colors.greenvariant;
    }
    if (i % 3 == 1) {
      return currentTheme.themeBox.colors.pinkVarinet;
    }

    if (i % 3 == 2) {
      return currentTheme.themeBox.colors.blueVarient;
    }
  }
}