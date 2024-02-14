import 'package:carousel_slider/carousel_slider.dart';
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
import 'package:viraadmin/presentation/core_widgets/pressables/flat_button.dart';
import 'package:viraadmin/presentation/core_widgets/scaffold/scaffold.dart';
import 'package:viraadmin/presentation/core_widgets/seprater/dotted_line.dart';
import 'package:viraadmin/presentation/core_widgets/seprater/line.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:viraadmin/utils/helper/custom_extensions/state.dart';

part 'controller.dart';


class ExamFee extends ConsumerWidget {
  int? index;
  ExamFee({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(KAppX.theme.current);

    KTextStyles kTextStyles = KTextStyles();
    late CarouselController _controller;
    final params = _VSControllerParams(index: index);
    final state = ref.watch(_vsProvider(params));
    final stateController = ref.read(_vsProvider(params).notifier);


    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 13.toAutoScaledWidth, vertical: 13.toAutoScaledHeight),
            child: Card(
              elevation: 2.toAutoScaledWidth,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.toAutoScaledWidth),
              ),
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.zero,
              child: ExpansionTile(
                  backgroundColor: currentTheme.themeBox.colors.error,
                  collapsedBackgroundColor:
                  currentTheme.themeBox.colors.error,
                  title: Padding(
                    padding: EdgeInsets.only(top: 8.toAutoScaledHeight),
                    child: Text(
                      'Exam 1 ',
                      style: kTextStyles.s12BlackBold,
                    ),
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.only(
                        top: 8.toAutoScaledHeight, bottom: 8.toAutoScaledHeight),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\u{20B9} 16,600',
                          style: kTextStyles.s20BlackBold,
                        ),
                        8.toVerticalSizedBox,
                        Row(
                          children: [
                            Text(
                              'Last Date : 6 Jun 2023',
                              style: kTextStyles.s12onBackgroundRegular,
                            ),
                            15.toHorizontalSizedBox,
                            KCard(
                              paddingRight: 0,
                              paddingLeft: 0,
                              paddingTop: 0,
                              paddingBottom: 0,
                              height: 20.toAutoScaledHeight,
                              width: 70.toAutoScaledWidth,
                              backgroundColor:
                              currentTheme.themeBox.colors.onError,
                              child: Center(
                                child: Text(
                                  'Pending',
                                  style: kTextStyles.s12WhiteBold,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  children: [
                    KLine(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.toAutoScaledWidth,
                          vertical: 15.toAutoScaledHeight),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Total Fee',
                                style: kTextStyles.s14onBackgroundRegular,
                              ),
                              Spacer(),
                              Text('\u{20B9} 50,000',
                                  style: kTextStyles.s14onBackgroundRegular)
                            ],
                          ),
                          15.toVerticalSizedBox,
                          Row(
                            children: [
                              Text(
                                'Extra Fee',
                                style: kTextStyles.s14onBackgroundRegular,
                              ),
                              Spacer(),
                              Text('\u{20B9} 10,000',
                                  style: kTextStyles.s14onBackgroundRegular)
                            ],
                          ),
                          15.toVerticalSizedBox,
                          Row(
                            children: [
                              Text(
                                'Late Charges',
                                style: kTextStyles.s14onBackgroundRegular,
                              ),
                              Spacer(),
                              Text('\u{20B9} 500',
                                  style: kTextStyles.s14onBackgroundRegular)
                            ],
                          ),
                          15.toVerticalSizedBox,
                          Row(
                            children: [
                              Text(
                                'Discount',
                                style: kTextStyles.s14onBackgroundRegular,
                              ),
                              Spacer(),
                              Text('\u{20B9} 10,000',
                                  style: kTextStyles.s14onBackgroundRegular)
                            ],
                          ),
                          15.toVerticalSizedBox,
                          Row(
                            children: [
                              Text(
                                'Pending Fee',
                                style: kTextStyles.s16BlackBold,
                              ),
                              Spacer(),
                              Text('\u{20B9} 50,500',
                                  style: kTextStyles.s16BlackBold)
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
            ),
          ),
          const MySeparator(),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 13.toAutoScaledWidth,
                    vertical: 13.toAutoScaledHeight),
                child: Card(
                  elevation: 2.toAutoScaledWidth,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.toAutoScaledWidth),
                  ),
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsets.zero,
                  child: ExpansionTile(
                      backgroundColor: currentTheme.themeBox.colors.blueVarient,
                      collapsedBackgroundColor:
                      currentTheme.themeBox.colors.blueVarient,
                      title: Padding(
                        padding: EdgeInsets.only(top: 8.toAutoScaledHeight),
                        child: Text(
                          'Exam 2 ',
                          style: kTextStyles.s12BlackBold,
                        ),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(
                            top: 8.toAutoScaledHeight,
                            bottom: 8.toAutoScaledHeight),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '\u{20B9} 16,600',
                              style: kTextStyles.s20BlackBold,
                            ),
                            8.toVerticalSizedBox,
                            Row(
                              children: [
                                Text(
                                  '6 Jun 2023',
                                  style: kTextStyles.s12onBackgroundRegular,
                                ),
                                15.toHorizontalSizedBox,
                                KCard(
                                  paddingRight: 0,
                                  paddingLeft: 0,
                                  paddingTop: 0,
                                  paddingBottom: 0,
                                  height: 20.toAutoScaledHeight,
                                  width: 70.toAutoScaledWidth,
                                  backgroundColor:
                                  currentTheme.themeBox.colors.whatsappColor,
                                  child: Center(
                                    child: Text(
                                      'Paid',
                                      style: kTextStyles.s12WhiteBold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            8.toVerticalSizedBox,
                            Row(
                              children: [
                                KCard(
                                  paddingRight: 0,
                                  paddingLeft: 0,
                                  paddingTop: 0,
                                  paddingBottom: 0,
                                  height: 20.toAutoScaledHeight,
                                  width: 70.toAutoScaledWidth,
                                  backgroundColor:
                                  currentTheme.themeBox.colors.whatsappColor,
                                  child: Center(
                                    child: Text(
                                      'Edit',
                                      style: kTextStyles.s12WhiteBold,
                                    ),
                                  ),
                                ),
                                15.toHorizontalSizedBox,
                                KCard(
                                  paddingRight: 0,
                                  paddingLeft: 0,
                                  paddingTop: 0,
                                  paddingBottom: 0,
                                  topLeft: 0,
                                  bottomRight: 0,
                                  height: 30.toAutoScaledHeight,
                                  width: 70.toAutoScaledWidth,
                                  backgroundColor:
                                  currentTheme.themeBox.colors.whatsappColor,
                                  child: Center(
                                    child: Text(
                                      'Paid List',
                                      style: kTextStyles.s12WhiteBold,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      children: [
                        KLine(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.toAutoScaledWidth,
                              vertical: 15.toAutoScaledHeight),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Total Fee',
                                    style: kTextStyles.s14onBackgroundRegular,
                                  ),
                                  Spacer(),
                                  Text('\u{20B9} 50,000',
                                      style: kTextStyles.s14onBackgroundRegular)
                                ],
                              ),
                              15.toVerticalSizedBox,
                              Row(
                                children: [
                                  Text(
                                    'Extra Fee',
                                    style: kTextStyles.s14onBackgroundRegular,
                                  ),
                                  Spacer(),
                                  Text('\u{20B9} 10,000',
                                      style: kTextStyles.s14onBackgroundRegular)
                                ],
                              ),
                              15.toVerticalSizedBox,
                              Row(
                                children: [
                                  Text(
                                    'Late Charges',
                                    style: kTextStyles.s14onBackgroundRegular,
                                  ),
                                  Spacer(),
                                  Text('\u{20B9} 500',
                                      style: kTextStyles.s14onBackgroundRegular)
                                ],
                              ),
                              15.toVerticalSizedBox,
                              Row(
                                children: [
                                  Text(
                                    'Discount',
                                    style: kTextStyles.s14onBackgroundRegular,
                                  ),
                                  Spacer(),
                                  Text('\u{20B9} 10,000',
                                      style: kTextStyles.s14onBackgroundRegular)
                                ],
                              ),
                              15.toVerticalSizedBox,
                              Row(
                                children: [
                                  Text(
                                    'Paid Fee',
                                    style: kTextStyles.s16BlackBold,
                                  ),
                                  Spacer(),
                                  Text('\u{20B9} 50,500',
                                      style: kTextStyles.s16BlackBold)
                                ],
                              )
                            ],
                          ),
                        )
                      ]),
                ),
              );
            },
            itemCount: 6,
          ),

        ],
      ),
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
              style: isActive?kTextStyles.s16onErrorBold:kTextStyles.s16DarkBlueBold,
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
