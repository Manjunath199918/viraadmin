import 'package:carousel_slider/carousel_slider.dart';
import 'package:equatable/equatable.dart';
import 'package:expandable/expandable.dart';
import 'package:intl/intl.dart';
//import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:viraadmin/modules/data/core/router/intrinsic_router/intrinsic_router.gr.dart';
import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
import 'package:viraadmin/modules/domain/core/router/router.dart';
import 'package:viraadmin/modules/domain/core/storage/persistent_storage/persistent_storage.dart';
import 'package:viraadmin/modules/domain/repository/auth/auth_repository.dart';
import 'package:viraadmin/presentation/core_widgets/card/card.dart';
import 'package:viraadmin/presentation/core_widgets/custom_textstyle/CustomTextStyle.dart';
import 'package:viraadmin/presentation/core_widgets/pressables/flat_button.dart';
import 'package:viraadmin/presentation/core_widgets/seprater/dotted_line.dart';
import 'package:viraadmin/presentation/core_widgets/seprater/line.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:viraadmin/utils/helper/custom_extensions/state.dart';
part 'controller.dart';

class SchoolFee extends ConsumerStatefulWidget {
  const SchoolFee({Key? key}) : super(key: key);

  @override
  ConsumerState<SchoolFee> createState() => _SchoolFeeState();
}

class _SchoolFeeState extends ConsumerState<SchoolFee> {
  // late List<GDPData> _chartData;
  // late TooltipBehavior _tooltipBehavior;
  //
  // @override
  // void initState() {
  //   _chartData = getChartData();
  //   _tooltipBehavior = TooltipBehavior(enable: true);
  //   super.initState();
  // }
  @override
  Widget build(
    BuildContext context,
  ) {
    final currentTheme = ref.watch(KAppX.theme.current);

    KTextStyles kTextStyles = KTextStyles();
    late CarouselController _controller;
    final params = _VSControllerParams();
    final state = ref.watch(_vsProvider(params));
    final stateController = ref.read(_vsProvider(params).notifier);

    final Size size = MediaQuery.of(context).size;

    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //
          // Padding(
          //   padding: EdgeInsets.only(left: 20.toAutoScaledHeight),
          //   child: Text(
          //     'Total Fee',
          //     style: kTextStyles.s16PrimaryBold.copyWith(
          //         decoration: TextDecoration.underline
          //     ),
          //   ),
          // ),
      KCard(
        backgroundColor:currentTheme.themeBox.colors.primary.withOpacity(0.3) ,
        height: 100.toAutoScaledHeight,
        width: 340.toAutoScaledWidth,
         paddingLeft: 10,
         paddingRight: 10,
        paddingTop: 8.toAutoScaledHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.toAutoScaledHeight,left: 8.toAutoScaledHeight),
              child: Text(
                'Total Fee ',
                style: kTextStyles.s12BlackBold,
              ),

            ),
            Padding(
              padding: EdgeInsets.only(top: 8.toAutoScaledHeight,left: 8.toAutoScaledHeight),
              child: Text(
                '\u{20B9} 16,600',
                style: kTextStyles.s20BlackBold,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.toAutoScaledHeight,left: 8.toAutoScaledHeight),
              child: Text(
                'Announced Date: 6 jun 2023',
                style: kTextStyles.s12BlackBold,
              ),
            ),
          ],
        ),
      ),

      // Container(
      //   height: 200.toAutoScaledHeight,
      //
      //   child: SfRadialGauge(axes: <RadialAxis>[
      //     RadialAxis(
      //       radiusFactor: 1,
      //       minimum: 0,
      //       maximum: 100,
      //       showLabels: false,
      //       showTicks: false,
      //       axisLineStyle: AxisLineStyle(
      //         thickness: 0.2,
      //         cornerStyle: CornerStyle.bothCurve,
      //         color: currentTheme.themeBox.colors.primary.withOpacity(0.4),
      //         thicknessUnit: GaugeSizeUnit.factor,
      //       ),
      //       pointers: <GaugePointer>[
      //         RangePointer(
      //           value: 70,
      //           cornerStyle: CornerStyle.bothCurve,
      //           color: currentTheme.themeBox.colors.primary,
      //           width: 0.2,
      //           sizeUnit: GaugeSizeUnit.factor,
      //         )
      //       ],
      //         annotations: <GaugeAnnotation>[
      //           GaugeAnnotation(
      //               positionFactor: 0.1,
      //               angle: 80,
      //               widget: Text(
      //                 ' 70/100',
      //                 style: kTextStyles.s20BlackBold,
      //               ))
      //         ]
      //     ),
      //
      //   ]),
      // ),
      // Padding(
      //   padding: EdgeInsets.only(top: 8.toAutoScaledHeight,left: 20.toAutoScaledHeight),
      //   child: Text(
      //     'Total Pending',
      //     style: kTextStyles.s16PrimaryBold.copyWith(
      //       decoration: TextDecoration.underline
      //     ),
      //   ),
      // ),
      KCard(
        height: 100.toAutoScaledHeight,
        width: 340.toAutoScaledWidth,
        paddingLeft: 10,
        paddingRight: 10,
        paddingTop: 8.toAutoScaledHeight,
          backgroundColor: currentTheme.themeBox.colors.error,

          child: Padding(
            padding:  EdgeInsets.only(top: 8.toAutoScaledHeight,left: 8.toAutoScaledWidth),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.toAutoScaledHeight),
                  child: Text(
                    'Total Pending',
                    style: kTextStyles.s12BlackBold,
                  ),
                ),
                Padding(
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
                            'Last date : 6 Jun 2023',
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
              ],
            ),
          ),
          ),
      MySeparator(),
          Padding(
            padding: EdgeInsets.only(top: 8.toAutoScaledHeight,left: 20.toAutoScaledHeight),
            child: Text(
              'Installments Payment',
              style: kTextStyles.s16PrimaryBold.copyWith(
                  decoration: TextDecoration.underline
              ),
            ),
          ),
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
                  backgroundColor: currentTheme.themeBox.colors.primary.withOpacity(0.4),
                  collapsedBackgroundColor:
                      currentTheme.themeBox.colors.primary.withOpacity(0.4),
                  title: Padding(
                    padding: EdgeInsets.only(top: 8.toAutoScaledHeight),
                    child: Text(
                      'First Installment',
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
        itemCount: 2,
      )
    ]);
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('Oceania', 1600),
      GDPData('Africa', 2490),
      GDPData('S America', 2900),
    ];
    return chartData;
  }

  Widget buildIndicator(int idx) {
    return Container(
      height: 7.toAutoScaledHeight,
      width: 50.toAutoScaledWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12.toAutoScaledWidth)),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          0,
          1,
          2,
          3,
        ].map(
          (index) {
            return Padding(
              padding: EdgeInsets.only(left: 4.toAutoScaledWidth),
              child: idx == index
                  ? Container(
                      height: 7.toAutoScaledHeight,
                      width: 12.toAutoScaledHeight,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(12.toAutoScaledWidth)),
                          color: Colors.black),
                    )
                  : Container(
                      height: 7.toAutoScaledHeight,
                      width: 7.toAutoScaledHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(12.toAutoScaledWidth)),
                        color: Colors.grey,
                      ),
                    ),
            );
          },
        ).toList(),
      ),
    );
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}
