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
import 'package:viraadmin/presentation/core_widgets/app_bar/app_bar.dart';
import 'package:viraadmin/presentation/core_widgets/card/card.dart';
import 'package:viraadmin/presentation/core_widgets/custom_textstyle/CustomTextStyle.dart';
import 'package:viraadmin/presentation/core_widgets/pressables/flat_button.dart';
import 'package:viraadmin/presentation/core_widgets/scaffold/scaffold.dart';
import 'package:viraadmin/presentation/core_widgets/seprater/dotted_line.dart';
import 'package:viraadmin/presentation/core_widgets/seprater/line.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:viraadmin/utils/helper/custom_extensions/state.dart';
part 'controller.dart';

class SingleExamDetailsScreen extends ConsumerStatefulWidget {
  const SingleExamDetailsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SingleExamDetailsScreen> createState() =>
      _SingleExamDetailsScreenState();
}

class _SingleExamDetailsScreenState
    extends ConsumerState<SingleExamDetailsScreen> {
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

    return KScaffold(
      appBar: KAppBar(
        backgroundColor: currentTheme.themeBox.colors.darkBlue,
        title: Text(
          'Exam 1',
          style: kTextStyles.s16WhiteBold,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              KCard(

                paddingTop: 10,
                paddingBottom: 10.toAutoScaledHeight,
                backgroundColor: currentTheme.themeBox.colors.blueVarient,
                height: 250.toAutoScaledHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    KCard(
                      paddingBottom: 10.toAutoScaledHeight,
                      backgroundColor: Colors.transparent,
                      height: 150.toAutoScaledHeight,
                      child: SfRadialGauge(axes: <RadialAxis>[
                        RadialAxis(
                            radiusFactor: 1,
                            minimum: 0,
                            maximum: 100,
                            showLabels: false,
                            showTicks: false,
                            axisLineStyle: AxisLineStyle(
                              thickness: 0.2,
                              cornerStyle: CornerStyle.bothCurve,
                              color: currentTheme.themeBox.colors.whatsappColor
                                  .withOpacity(0.3),
                              thicknessUnit: GaugeSizeUnit.factor,
                            ),
                            pointers: <GaugePointer>[
                              RangePointer(
                                value: 75,
                                cornerStyle: CornerStyle.bothCurve,
                                color: currentTheme.themeBox.colors.whatsappColor,
                                width: 0.2,
                                sizeUnit: GaugeSizeUnit.factor,
                              )
                            ],
                            annotations: <GaugeAnnotation>[
                              GaugeAnnotation(
                                  positionFactor: 0.1,
                                  angle: 90,
                                  widget: Text(
                                    '75/100',
                                    style: kTextStyles.s25BlackBold,
                                  ))
                            ]),
                      ]),
                    ),
                    MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          5.toHorizontalSizedBox,
                          Text(
                            'Good',
                            style: kTextStyles.s20BlackBold,
                          ),
                          5.toHorizontalSizedBox,

                        ],
                      ),
                    ),
                  ],
                ),
              ),
              20.toVerticalSizedBox,
              Padding(
                padding:  EdgeInsets.only(left: 20.toAutoScaledWidth,right:20.toAutoScaledWidth,top: 20.toAutoScaledHeight,bottom: 10.toAutoScaledHeight),
                child: Row(
                  children: [
                    SizedBox(
                      width: 160.toAutoScaledWidth,
                      child: Text('Subject',style: kTextStyles.s16BlackBold,),
                    ),
                    SizedBox(
                      width: 160.toAutoScaledWidth,
                      child: Text('Maths',style: kTextStyles.s16DarkBlueBold,),
                    )
                  ],
                ),
              ),
              KLine(),


              20.toVerticalSizedBox,
              Padding(
                padding:  EdgeInsets.only(left: 20.toAutoScaledWidth,right:20.toAutoScaledWidth,top: 10.toAutoScaledHeight,bottom: 10.toAutoScaledHeight),
                child: Row(
                  children: [
                    SizedBox(
                      width: 160.toAutoScaledWidth,
                      child: Text('Conducted By',style: kTextStyles.s16BlackBold,),
                    ),
                    SizedBox(
                      width: 160.toAutoScaledWidth,
                      child: Text('Rudresh',style: kTextStyles.s16DarkBlueBold,),
                    )
                  ],
                ),
              ),
              KLine(),
              20.toVerticalSizedBox,
              Padding(
                padding:  EdgeInsets.only(left: 20.toAutoScaledWidth,right:20.toAutoScaledWidth,top: 10.toAutoScaledHeight,bottom: 10.toAutoScaledHeight),
                child: Row(
                  children: [
                    SizedBox(
                      width: 160.toAutoScaledWidth,
                      child: Text('Date',style: kTextStyles.s16BlackBold,),
                    ),
                    SizedBox(
                      width: 160.toAutoScaledWidth,
                      child: Text(' ${DateFormat('EEE ,MMM d ,yyyy').format(DateTime.now())}',style: kTextStyles.s16DarkBlueBold,),
                    )
                  ],
                ),
              ),
              KLine(),

              Padding(
                padding: EdgeInsets.only(
                    left: 20.toAutoScaledWidth,
                    top: 20.toAutoScaledHeight,
                   // bottom: 10.toAutoScaledHeight
                  ),
                child: Text(
                  'Review By Teacher :',
                  style: kTextStyles.s16BlackBold,
                ),
              ),
              KCard(
                paddingTop: 10.toAutoScaledHeight,
                backgroundColor: currentTheme.themeBox.colors.blueVarient,
                //height: 160.toAutoScaledHeight,
                child: Padding(
                  padding:  EdgeInsets.only(left: 8.toAutoScaledWidth,right:8.toAutoScaledWidth,top: 8.toAutoScaledHeight),
                  child: Text('''
I praised Manjunath's excellent problem-solving skills, noting their ability to approach complex tasks with a logical and analytical mindset. They described Manjunath as a critical thinker who consistently demonstrates creativity in finding innovative solutions to challenges.
                  ''',style: kTextStyles.s14BlackBold.copyWith(
                    height: currentTheme.themeBox.fontLineHeights.lh18 /
                        currentTheme.themeBox.fontSizes.s12,
                  ),),
                ),
              )
            ]),
      ),
    );
  }
}
