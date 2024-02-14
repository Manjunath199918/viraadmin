import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:viraadmin/modules/data/core/router/intrinsic_router/intrinsic_router.dart';
import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
import 'package:viraadmin/modules/domain/core/storage/persistent_storage/persistent_storage.dart';
import 'package:viraadmin/modules/domain/repository/auth/auth_repository.dart';
import 'package:viraadmin/presentation/core_widgets/app_bar/app_bar.dart';
import 'package:viraadmin/presentation/core_widgets/card/card.dart';
import 'package:viraadmin/presentation/core_widgets/custom_textstyle/CustomTextStyle.dart';
import 'package:viraadmin/presentation/core_widgets/image/custom_image.dart';
import 'package:viraadmin/presentation/core_widgets/pressables/flat_button.dart';
import 'package:viraadmin/presentation/core_widgets/scaffold/scaffold.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:viraadmin/utils/helper/custom_extensions/state.dart';
import 'package:viraadmin/utils/helper/helper.dart';
part 'controller.dart';

class MediaScreen extends ConsumerWidget {
  final int? index;
  const MediaScreen({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(KAppX.theme.current);

    KTextStyles kTextStyles = KTextStyles();

    final params = _VSControllerParams(index: index);
    final state = ref.watch(_vsProvider(params));
    final stateController = ref.read(_vsProvider(params).notifier);
    return SafeArea(
      child: Scaffold(
        appBar: KAppBar(
          elevation: 0,

          backgroundColor: currentTheme.themeBox.colors.primary,
          title: Text(
            'Media Screen',
            style: kTextStyles.s18WhiteBold,
          ),
        ),
        floatingActionButtonLocation:  FloatingActionButtonLocation.centerFloat,
        floatingActionButton: KFlatButton(
          height: 55.toAutoScaledHeight,
          width: 100.toAutoScaledWidth,
          onPressed:(){
            KAppX.router.navigate(CreateMedia());

          } ,child: Icon(Icons.add,color: currentTheme.themeBox.colors.white,),),

        body:
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                  physics: NeverScrollableScrollPhysics(),

                  itemBuilder: (context,i){ return Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.toAutoScaledWidth,vertical: 10.toAutoScaledHeight),
                    child: Card(
                      elevation: 100,
                      // height: 200.toAutoScaledHeight,
                      // width: 360.toAutoScaledWidth,

                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 10.toAutoScaledWidth,vertical: 20.toAutoScaledHeight),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Kannada notes (1st chapter)',style: kTextStyles.s16BlackBold,),
                                Icon(Icons.picture_as_pdf)
                              ],
                            ),
                            10.toVerticalSizedBox,

                            Text('Date : 15-12-2023',style: kTextStyles.s14greyVariantBold,),
                            10.toVerticalSizedBox,

                            Text('Published By : Manjunath',style: kTextStyles.s14greyVariantBold,),
                            15.toVerticalSizedBox,


                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                KFlatButton(onPressed: (){},color: currentTheme.themeBox.colors.primary,child: Text('Comments',style: kTextStyles.s16WhiteBold,),),
                                KFlatButton(onPressed: (){},color: currentTheme.themeBox.colors.primary, child: Text('Download',style: kTextStyles.s16WhiteBold,)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );})



            ],
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
