import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
import 'package:viraadmin/modules/domain/core/storage/persistent_storage/persistent_storage.dart';
import 'package:viraadmin/modules/domain/repository/auth/auth_repository.dart';
import 'package:viraadmin/presentation/core_widgets/app_bar/app_bar.dart';
import 'package:viraadmin/presentation/core_widgets/card/card.dart';
import 'package:viraadmin/presentation/core_widgets/custom_textstyle/CustomTextStyle.dart';
import 'package:viraadmin/presentation/core_widgets/image/custom_image.dart';
import 'package:viraadmin/presentation/core_widgets/pressables/flat_button.dart';
import 'package:viraadmin/presentation/core_widgets/scaffold/scaffold.dart';
import 'package:viraadmin/presentation/core_widgets/seprater/line.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:viraadmin/utils/helper/custom_extensions/state.dart';
import 'package:viraadmin/utils/helper/helper.dart';

class ProfileScreen extends ConsumerWidget {
  int? index;
  ProfileScreen({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(KAppX.theme.current);

    KTextStyles kTextStyles = KTextStyles();

    return SafeArea(
        child: KScaffold(
            extendedBehindAppbar: true,
            appBar: KAppBar(
              themeColor: currentTheme.themeBox.colors.white,
              backgroundColor: Colors.transparent,
              title: Text(
                'Profile',
                style: kTextStyles.s16WhiteBold,
              ),
              // actions: [
              //   InkWell(
              //     onTap: (){
              //       print('dhfjsvbahsjdvbjhsadfj');
              //     },
              //     child: Padding(
              //       padding:  EdgeInsets.only(right: 20.toAutoScaledWidth),
              //       child: Icon(Icons.edit,size: 20.toAutoScaledWidth,),
              //     ),
              //   ),
              // ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  KCard(
                    paddingRight: 0,
                    paddingBottom: 0,
                    paddingTop: 0,
                    paddingLeft: 0,
                    topRight: 0,
                    topLeft: 0,


                    bottomRight: 0.toAutoScaledWidth,
                    bottomLeft: 0.toAutoScaledWidth,
                    //imageUrl: 'assets/profile/img.png',
                    width: 360.toAutoScaledWidth,
                    height: 300.toAutoScaledHeight,
                    backgroundColor: currentTheme.themeBox.colors.primary,
                    child: Stack(
                      children: [
                        Positioned(
                            top: 60.toAutoScaledHeight,
                            left: 110.toAutoScaledWidth,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Stack(
                                //   children: [
                                //     CircleAvatar(
                                //       radius: 70.toAutoScaledWidth,
                                //       backgroundImage: const NetworkImage(
                                //           'https://picsum.photos/id/237/200/300'),
                                //     ),
                                //     Positioned(
                                //         top: 10.toAutoScaledHeight,
                                //         left: 60.toAutoScaledWidth,
                                //         child:
                                //         Container(
                                //           decoration: BoxDecoration(
                                //             shape: BoxShape.circle,
                                //
                                //
                                //             color: currentTheme
                                //                 .themeBox.colors.black,
                                //           ),
                                //         ))
                                //   ],
                                // ),
                                CircleAvatar(
                                  radius: 70.toAutoScaledWidth,
                                  backgroundImage: const NetworkImage(
                                      'https://picsum.photos/id/237/200/300'),
                                ),

                                10.toVerticalSizedBox,
                                Text(
                                  'Manjunath',
                                  style: kTextStyles.s16WhiteBold,
                                ),
                                10.toVerticalSizedBox,
                                Text(
                                  'Class 5th ',
                                  style: kTextStyles.s14onSecondaryRegular,
                                ),
                              ],
                            )),
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
                          child: Text('Roll No',style: kTextStyles.s16BlackBold,),
                        ),
                        SizedBox(
                          width: 160.toAutoScaledWidth,
                          child: Text('0175',style: kTextStyles.s16PrimaryBold,),
                        )
                      ],
                    ),
                  ),
                  KLine(),

                  Padding(
                    padding:  EdgeInsets.only(left: 20.toAutoScaledWidth,right:20.toAutoScaledWidth,top: 20.toAutoScaledHeight,bottom: 10.toAutoScaledHeight),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 160.toAutoScaledWidth,
                          child: Text('Section',style: kTextStyles.s16BlackBold,),
                        ),
                        SizedBox(
                          width: 160.toAutoScaledWidth,
                          child: Text('B',style: kTextStyles.s16PrimaryBold,),
                        )
                      ],
                    ),
                  ),
                  KLine(),
                  Padding(
                    padding:  EdgeInsets.only(left: 20.toAutoScaledWidth,right:20.toAutoScaledWidth,top: 20.toAutoScaledHeight,bottom: 10.toAutoScaledHeight),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 160.toAutoScaledWidth,
                          child: Text('Date of Birth',style: kTextStyles.s16BlackBold,),
                        ),
                        SizedBox(
                          width: 160.toAutoScaledWidth,
                          child: Text('18,Jul 1999',style: kTextStyles.s16PrimaryBold,),
                        )
                      ],
                    ),
                  ),
                  KLine(),
                  Padding(
                    padding:  EdgeInsets.only(left: 20.toAutoScaledWidth,right:20.toAutoScaledWidth,top: 20.toAutoScaledHeight,bottom: 10.toAutoScaledHeight),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 160.toAutoScaledWidth,
                          child: Text('Blood Group',style: kTextStyles.s16BlackBold,),
                        ),
                        SizedBox(
                          width: 160.toAutoScaledWidth,
                          child: Text('B+',style: kTextStyles.s16PrimaryBold,),
                        )
                      ],
                    ),
                  ),
                  KLine(),
                  Padding(
                    padding:  EdgeInsets.only(left: 20.toAutoScaledWidth,right:20.toAutoScaledWidth,top: 20.toAutoScaledHeight,bottom: 10.toAutoScaledHeight),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 160.toAutoScaledWidth,
                          child: Text('Emergency Contact',style: kTextStyles.s16BlackBold,),
                        ),
                        SizedBox(
                          width: 160.toAutoScaledWidth,
                          child: Text('+91 9901148011',style: kTextStyles.s16PrimaryBold,),
                        )
                      ],
                    ),
                  ),
                  KLine(),
                  Padding(
                    padding:  EdgeInsets.only(left: 20.toAutoScaledWidth,right:20.toAutoScaledWidth,top: 20.toAutoScaledHeight,bottom: 10.toAutoScaledHeight),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 160.toAutoScaledWidth,
                          child: Text('School Name',style: kTextStyles.s16BlackBold,),
                        ),
                        SizedBox(
                          width: 160.toAutoScaledWidth,
                          child: Text('Best Independent Pu college ',style: kTextStyles.s16PrimaryBold,),
                        )
                      ],
                    ),
                  ),
                  KLine(),
                  Padding(
                    padding:  EdgeInsets.only(left: 20.toAutoScaledWidth,right:20.toAutoScaledWidth,top: 20.toAutoScaledHeight,bottom: 10.toAutoScaledHeight),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 160.toAutoScaledWidth,
                          child: Text('Fathers name',style: kTextStyles.s16BlackBold,),
                        ),
                        SizedBox(
                          width: 160.toAutoScaledWidth,
                          child: Text('Amaregouda Patil',style: kTextStyles.s16PrimaryBold,),
                        )
                      ],
                    ),
                  ),
                  KLine(),
                  Padding(
                    padding:  EdgeInsets.only(left: 20.toAutoScaledWidth,right:20.toAutoScaledWidth,top: 20.toAutoScaledHeight,bottom: 10.toAutoScaledHeight),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 160.toAutoScaledWidth,
                          child: Text('Mothers Name',style: kTextStyles.s16BlackBold,),
                        ),
                        SizedBox(
                          width: 160.toAutoScaledWidth,
                          child: Text('Sunita',style: kTextStyles.s16PrimaryBold,),
                        )
                      ],
                    ),
                  ),



                ],
              ),
            )));
  }

}
