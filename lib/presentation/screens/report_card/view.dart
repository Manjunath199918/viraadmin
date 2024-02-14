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
import 'package:viraadmin/presentation/core_widgets/seprater/line.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:viraadmin/utils/helper/custom_extensions/state.dart';
import 'package:viraadmin/utils/helper/helper.dart';
part 'controller.dart';

class ReportCard extends ConsumerWidget {
  int? index;
  ReportCard({Key? key, this.index}) : super(key: key);

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
          title: Text('Class 12',style: kTextStyles.s16WhiteBold,),
        ),
        //backgroundColor: currentTheme.themeBox.colors.primary,

        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.toAutoScaledWidth),
            child: Column(

              children: [
                20.toVerticalSizedBox,
                Row(
                  children: [
                    KImage(imageUrl: 'assets/reportcard/img.png', width: 80.toAutoScaledWidth, height: 80.toAutoScaledHeight),
                    10.toHorizontalSizedBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width:220.toAutoScaledWidth,
                            child: Text('PBA primary and secondary school  ',style: kTextStyles.s16PrimaryBold,maxLines: 2,overflow: TextOverflow.ellipsis,)),
                        SizedBox(
                            width:220.toAutoScaledWidth,
                            child: Text('Near Lingasgur bus depo- tq||lingasgur,di||raichur 560054',style: kTextStyles.s12onBackgroundRegular,maxLines: 2,overflow: TextOverflow.ellipsis))
                      ],
                    )

                  ],
                ),
                20.toVerticalSizedBox,
                Divider(
                  color: currentTheme.themeBox.colors.primary,
                ),
                Text('PERFORMANCE REVIEW',style: kTextStyles.s20PrimaryBold,),
                Divider(
                  color: currentTheme.themeBox.colors.primary,
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 20.toAutoScaledHeight,bottom: 10.toAutoScaledHeight),
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
                  padding:  EdgeInsets.only(top: 20.toAutoScaledHeight,bottom: 10.toAutoScaledHeight),
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
                  padding:  EdgeInsets.only(top: 20.toAutoScaledHeight,bottom: 10.toAutoScaledHeight),
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
                  padding:  EdgeInsets.only(top: 20.toAutoScaledHeight,bottom: 10.toAutoScaledHeight),
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
                  padding:  EdgeInsets.only(top: 20.toAutoScaledHeight,bottom: 10.toAutoScaledHeight),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 160.toAutoScaledWidth,
                        child: Text('Position in Class',style: kTextStyles.s16BlackBold,),
                      ),
                      SizedBox(
                        width: 160.toAutoScaledWidth,
                        child: Text('5th',style: kTextStyles.s16PrimaryBold,),
                      )
                    ],
                  ),
                ),
                KLine(),
                Padding(
                  padding:  EdgeInsets.only(top: 20.toAutoScaledHeight,bottom: 10.toAutoScaledHeight),
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
                  padding:  EdgeInsets.only(top: 20.toAutoScaledHeight,bottom: 10.toAutoScaledHeight),
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
          ),
        ),
      ),
    );
  }

  Widget contentBar(KThemeState currentTheme, String url, String name,
      VoidCallback? onPressed) {
    KTextStyles kTextStyles = KTextStyles();

    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            height: 70.toAutoScaledHeight,
            width: 70.toAutoScaledWidth,
            decoration: BoxDecoration(
              color: currentTheme.themeBox.colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: currentTheme.themeBox.colors.greyVariant,
                  blurRadius: 2.toAutoScaledWidth,
                ),
              ], //This will make container round
            ),
            child: Center(
              child: KImage(
                imageUrl: url,
                height: 40.toAutoScaledHeight,
                width: 40.toAutoScaledWidth,
              ),
            ),
          ),
          10.toVerticalSizedBox,
          Text(
            name,
            style: kTextStyles.s14PrimaryBold,
          )
        ],
      ),
    );
  }
}
