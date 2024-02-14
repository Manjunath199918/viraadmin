import 'package:carousel_slider/carousel_slider.dart';
import 'package:viraadmin/modules/data/core/router/intrinsic_router/intrinsic_router.gr.dart';
import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
import 'package:viraadmin/modules/domain/core/router/router.dart';
import 'package:viraadmin/presentation/core_widgets/card/card.dart';
import 'package:viraadmin/presentation/core_widgets/custom_textstyle/CustomTextStyle.dart';
import 'package:viraadmin/presentation/core_widgets/pressables/flat_button.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen>{
  // contents
  final List<String> heading = [
    'Rectify Your attendance \ninstantly',
    'Mark HomeWork as Completed',

    'Contacting  your Teachers is \neasy now',
    'Get your report card at any \nmoment'
  ];

  final List<String> contents = [
    '',
    '',
    '',
    '',
  ];

  final ValueNotifier<int> _index = ValueNotifier(0);
  late CarouselController _controller;


  @override
  void initState() {
    super.initState();
    _controller = CarouselController();

  }
  @override
  Widget build(BuildContext context,) {
    final currentTheme = ref.watch(KAppX.theme.current);
    final Size size = MediaQuery.of(context).size;
    KTextStyles kTextStyles = KTextStyles();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: 4,
            itemBuilder: (context, index, realIndex) {
              Future.delayed(
                const Duration(),
                    () => _index.value = index,
              );

              return Container(
                height: 800.toAutoScaledHeight,
                width: 360.toAutoScaledWidth,
                decoration: BoxDecoration(color: Colors.white),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 50.toAutoScaledHeight,
                      child: Padding(
                        padding:  EdgeInsets.only(left:20.toAutoScaledWidth),
                        child: Container(
                          width: 320.toAutoScaledWidth,
                          height: 25.toAutoScaledHeight,

                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              KCard(

                                imageUrl: 'assets/onboarding/img.png',
                                height: 50.toAutoScaledHeight,
                                width: 50.toAutoScaledWidth,
                                paddingLeft: 0,
                                paddingTop: 0,
                                topLeft: 0,
                                topRight: 0,
                                bottomLeft: 0,
                                bottomRight: 0,
                                paddingBottom: 0,
                                backgroundColor:
                                currentTheme.themeBox.colors.black,
                              ),
                              Spacer(),
                              InkWell(
                                onTap: (){
                                  KAppX.router.replace(LoginRoute());

                                },
                                child: Text(
                                  'Skip',
                                  style: kTextStyles.s16BlackBold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 120.toAutoScaledHeight,
                      child: KCard(
                        paddingTop: 0,
                        paddingBottom: 0,


                        imageUrl: 'assets/onboarding/img_${index + 1}.png',

                        height: 335.toAutoScaledHeight,
                        backgroundColor: currentTheme.themeBox.colors.white,
                      ),
                    ),
                    Positioned(
                        top: 515.toAutoScaledHeight,
                        left: 20.toAutoScaledWidth,
                        child: Text(
                          heading[index].toUpperCase(),
                          style: kTextStyles.s20BlackBold,
                        )),
                    Positioned(
                        top: 550.toAutoScaledHeight,
                        left: 20.toAutoScaledWidth,
                        child: Text(
                          contents[index],
                          style: kTextStyles.s12onBackgroundRegular,
                        )),
                    Positioned(
                        top: 632.toAutoScaledHeight,
                        left: 20.toAutoScaledWidth,
                        child: KFlatButton(

                          onPressed: () {
                            if(index == 3){
                              KAppX.router.replace(LoginRoute());
                            }
                            else{
                              _controller.nextPage();
                            }

                          },
                          width: 320.toAutoScaledWidth,
                          color: currentTheme.themeBox.colors.darkBlue,
                          child: Text(
                            index == 3 ? 'Continue' : 'Next',
                            style: kTextStyles.s14WhiteRegular,
                          ),
                        ))
                  ],
                ),
              );
            },
            carouselController: _controller,
            options: CarouselOptions(

              height: size.height,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              enableInfiniteScroll: false,
            ),
          ),

          Positioned(
            top: 717.toAutoScaledHeight,

            left: 20.toAutoScaledWidth,

            child: Container(

              height: 5.toAutoScaledHeight,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ValueListenableBuilder<int>(
                      valueListenable: _index,
                      builder: (context, idx, _) {
                        return buildIndicator(idx);
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
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

