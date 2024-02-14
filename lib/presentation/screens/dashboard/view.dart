import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
import 'package:viraadmin/modules/domain/core/storage/persistent_storage/persistent_storage.dart';
import 'package:viraadmin/modules/domain/repository/auth/auth_repository.dart';
import 'package:viraadmin/presentation/core_widgets/app_bar/app_bar.dart';
import 'package:viraadmin/presentation/core_widgets/card/card.dart';
import 'package:viraadmin/presentation/core_widgets/custom_textstyle/CustomTextStyle.dart';
import 'package:viraadmin/presentation/core_widgets/image/custom_image.dart';
import 'package:viraadmin/presentation/core_widgets/scaffold/scaffold.dart';
import 'package:viraadmin/presentation/core_widgets/seprater/line.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:viraadmin/utils/helper/custom_extensions/state.dart';

part 'controller.dart';
part 'widgets/completed_work.dart';
part 'widgets/pending_work.dart';

class DashBoardScreen extends ConsumerWidget {
  int? index;
  DashBoardScreen({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(KAppX.theme.current);

    KTextStyles kTextStyles = KTextStyles();
    final params = _VSControllerParams(index: index);
    final state = ref.watch(_vsProvider(params));
    final stateController = ref.read(_vsProvider(params).notifier);

    Widget type;
    switch (state.index) {
      case 0:
        type = PendingHomeWork();
        break;
      case 1:
        type = CompletedWork();
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
              backgroundColor: currentTheme.themeBox.colors.darkBlue,
              title: Text(
                'DashBoard',
                style: kTextStyles.s16WhiteBold,
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.toAutoScaledWidth,
                        top: 20.toAutoScaledHeight,
                        bottom: 10.toAutoScaledHeight),
                    child: Text(
                      'Notice Board',
                      style: kTextStyles.s18DarkBlueBold,
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left:10.toAutoScaledWidth),
                    child: Container(
                      height: 160.toAutoScaledHeight,
                      child: ListView.separated(
                        separatorBuilder: (context, i) {
                          return 15.toHorizontalSizedBox;
                        },
                        itemCount: 5,
                        itemBuilder: (context, i) {
                          return KCard(
                            paddingBottom: 0,
                            paddingTop: 0,
                            paddingRight: 0,
                            paddingLeft: 0,
                            width: 150.toAutoScaledWidth,
                            backgroundColor: getColour(i, currentTheme),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 20.toAutoScaledHeight,
                                  left: 8.toAutoScaledWidth),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  KImage(
                                      imageUrl: 'assets/onboarding/img_3.png',
                                      width: 40.toAutoScaledWidth,
                                      height: 40.toAutoScaledHeight),
                                  10.toVerticalSizedBox,
                                  Text(
                                    'Title of notice that you have Title of notice that you have  ',
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: kTextStyles.s14BlackBold,
                                  ),
                                  15.toVerticalSizedBox,
                                  Text(
                                    DateFormat('EEE ,MMM d ,yyyy')
                                        .format(DateTime.now()),
                                    style: kTextStyles
                                        .s14onSecondaryVariantRegular,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                  20.toVerticalSizedBox,
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10.toAutoScaledWidth,
                        top: 10.toAutoScaledHeight,
                        bottom: 20.toAutoScaledHeight),
                    child: Text(
                      'Home Work',
                      style: kTextStyles.s18DarkBlueBold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10.toAutoScaledWidth,
                        right: 10.toAutoScaledWidth,
                        top: 0.toAutoScaledHeight),
                    child: Container(
                      width: 340.toAutoScaledWidth,
                      height: 44.toAutoScaledWidth,
                      decoration: BoxDecoration(
                          // color: currentTheme.themeBox.colors.blankButton.withOpacity(0.04),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.toAutoScaledWidth),
                            topRight: Radius.circular(12.toAutoScaledWidth),
                            bottomLeft:
                                Radius.circular(12.toAutoScaledWidth),
                            bottomRight:
                                Radius.circular(12.toAutoScaledWidth),
                          ),
                          color: currentTheme.themeBox.colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: currentTheme
                                  .themeBox.colors.onSecondary
                                  .withOpacity(0.5),
                              blurRadius: 2.toAutoScaledWidth,
                            ),
                          ]),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.toAutoScaledWidth),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            for (int i = 0; i < 2; i++)
                              if (i == state.index) ...[
                                InkWell(
                                    onTap: () {
                                      stateController.setIndex(i);
                                    },
                                    child: tabBar(true, ref, i))
                              ] else
                                InkWell(
                                    onTap: () {
                                      stateController.setIndex(i);
                                    },
                                    child: tabBar(false, ref, i)),
                          ],
                        ),
                      ),
                    ),
                  ),
                   type

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
              ? currentTheme.themeBox.colors.darkBlue
              : currentTheme.themeBox.colors.white),
      height: 30.toAutoScaledHeight,
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
