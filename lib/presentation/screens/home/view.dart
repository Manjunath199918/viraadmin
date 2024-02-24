
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:viraadmin/constants/constants.dart';
import 'package:viraadmin/modules/data/core/router/intrinsic_router/intrinsic_router.dart';
import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
import 'package:viraadmin/modules/domain/core/storage/persistent_storage/persistent_storage.dart';
import 'package:viraadmin/modules/domain/repository/auth/auth_repository.dart';
import 'package:viraadmin/modules/domain/repository/auth/models/user.dart';
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

class HomeScreen extends ConsumerWidget {
  int? index;
  HomeScreen({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(KAppX.theme.current);

    KTextStyles kTextStyles = KTextStyles();

    final params = _VSControllerParams(index: index);
    final state = ref.watch(_vsProvider(params));
    final stateController = ref.read(_vsProvider(params).notifier);
    return SafeArea(
      child: KScaffold(
        //backgroundColor: currentTheme.themeBox.colors.primary,

        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 20.toAutoScaledHeight, left: 20.toAutoScaledHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${state.user?.firstName} ${state.user?.lastName}' ,
                      style: kTextStyles.s16PrimaryBold,
                    ),
                    Text('${state.user?.schoolName}', style: kTextStyles.s14greyVariantBold)
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.toAutoScaledWidth,
                        vertical: 30.toAutoScaledHeight),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        contentBar(currentTheme, 'assets/home/img_12.png',
                            'Time table', (){
                          stateController.onTimeTablePressed();
                            }),

                        contentBar(currentTheme, 'assets/home/img_3.png',
                            'Attendance', stateController.onAttendancePressed),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.toAutoScaledWidth,
                        vertical: 30.toAutoScaledHeight),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        contentBar(currentTheme, 'assets/home/img_4.png',
                            'Fee Details', stateController.onFeeDetailsPressed),
                        contentBar(currentTheme, 'assets/home/img_10.png',
                            'Subjects', stateController.onSubjectPressed),
                        contentBar(
                            currentTheme,
                            'assets/home/img_5.png',
                            'Examination',
                            stateController.onExaminationPressed),

                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.toAutoScaledWidth,
                        vertical: 30.toAutoScaledHeight),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        contentBar(
                            currentTheme,
                            'assets/home/img_8.png',
                            'Notice Board',
                            stateController.onNoticeBoardPressed),
                        contentBar(currentTheme, 'assets/home/img_9.png',
                            'MultiMedia', stateController.onMultiMediaPressed),
                        contentBar(currentTheme, 'assets/home/img_7.png',
                            'Calender', stateController.onCalenederPressed),

                      ],
                    ),
                  ),
                  30.toVerticalSizedBox,
                  contentBar(currentTheme, 'assets/home/img_11.png',
                      'Profile', stateController.onProfilePressed),
                ],
              )
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
