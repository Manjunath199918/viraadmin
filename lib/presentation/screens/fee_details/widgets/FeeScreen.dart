part of '../view.dart';
class FeeDetailsScreen extends ConsumerWidget {
  final int? index;
  const FeeDetailsScreen({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(KAppX.theme.current);

    KTextStyles kTextStyles = KTextStyles();
    late CarouselController _controller;
    final params = _VSControllerParams(index: index);
    final state = ref.watch(_vsProvider(params));
    final stateController = ref.read(_vsProvider(params).notifier);
    Widget type;
    switch (state.tabIndex) {
      case 0:
        type = const SchoolFee();
        break;
      case 1:
        type = ExamFee();
        break;
      case 2:
        type = ActivityFee();
        break;
      case 3:
        type = ActivityFee();
        break;

      default:
        type = const KScaffold(
          body: Center(
            child: Text(
              'Unimplemented Screen',
            ),
          ),
        );
    }

    return SafeArea(
        child: KScaffold(
            appBar: KAppBar(

              title: Text(
                'Fee Details',
                style: kTextStyles.s18WhiteBold,
              ),
            ),
            floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add_moderator),backgroundColor: currentTheme.themeBox.colors.primary,) ,

            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.toVerticalSizedBox,

                  Container(
                    width: 360.toAutoScaledWidth,
                    height: 40.toAutoScaledHeight,
                    // color: currentTheme.themeBox.colors.darkBlue,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[

                        for (int i = 0; i < 3; i++)
                          if (i == state.tabIndex) ...[
                            InkWell(
                                onTap: () {
                                  stateController.setTabIndex(i);
                                },
                                child: tabBar(true, ref, i))
                          ] else
                            InkWell( onTap: () {
                              stateController.setTabIndex(i);
                            },child: tabBar(false, ref, i)),
                      ],
                    ),
                  ),
                  type
                  // 50.toVerticalSizedBox,

                ],
              ),
            ))
    );
  }

  Widget tabBar(bool isActive, WidgetRef ref, int i) {
    final currentTheme = ref.watch(KAppX.theme.current);
    List<String> heading = [
      'School Fee',
      'Exam Fee',
      'Activity Fee',
      'Others',
    ];
    KTextStyles kTextStyles = KTextStyles();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        i!=0?30.toHorizontalSizedBox:20.toHorizontalSizedBox,
        Column(
          children: [
            Text(
              heading[i],
              style: isActive?kTextStyles.s16onErrorBold:kTextStyles.s16PrimaryBold,
            ),
            10.toVerticalSizedBox,
            isActive
                ? AnimatedContainer(
              duration: Duration(milliseconds: 150),
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: 2.toAutoScaledHeight,
              width: 80.toAutoScaledWidth,
              decoration: BoxDecoration(
                  color: currentTheme.themeBox.colors.onError,
                  borderRadius: BorderRadius.all(
                      Radius.circular(12.toAutoScaledWidth))),
            )
                : const SizedBox(),
          ],
        ),
        i==3?30.toHorizontalSizedBox:0.toHorizontalSizedBox,
      ],
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