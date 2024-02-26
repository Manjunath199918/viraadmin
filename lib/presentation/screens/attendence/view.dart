import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:viraadmin/constants/assets.dart';
import 'package:viraadmin/constants/constants.dart';
import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
import 'package:viraadmin/modules/domain/core/storage/persistent_storage/persistent_storage.dart';
import 'package:viraadmin/modules/domain/repository/auth/auth_repository.dart';
import 'package:viraadmin/modules/domain/repository/auth/models/user.dart';
import 'package:viraadmin/modules/domain/repository/profile/my_profile_repository.dart';
import 'package:viraadmin/presentation/core_widgets/app_bar/app_bar.dart';
import 'package:viraadmin/presentation/core_widgets/card/card.dart';
import 'package:viraadmin/presentation/core_widgets/custom_textstyle/CustomTextStyle.dart';
import 'package:viraadmin/presentation/core_widgets/image/custom_image.dart';
import 'package:viraadmin/presentation/core_widgets/pressables/flat_button.dart';
import 'package:viraadmin/presentation/core_widgets/scaffold/scaffold.dart';
import 'package:viraadmin/presentation/screens/attendence/constant.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:viraadmin/utils/helper/custom_extensions/state.dart';
import 'package:viraadmin/utils/helper/helper.dart';
part 'controller.dart';
part 'widgets/class_select.dart';
part 'widgets/attendance_view.dart';
part 'sqlitedb.dart';



class Attendance extends ConsumerWidget {
  final int? index;
  Attendance({Key? key, this.index}) : super(key: key);

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
        type =   SelectClass();
        break;
      case 1:
        type =  AttendanceView();
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
    return
      SafeArea(
        child: type,
      );
  }


}
// class Attendance extends ConsumerWidget {
//   const Attendance({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final currentTheme = ref.watch(KAppX.theme.current);
//
//     KTextStyles kTextStyles = KTextStyles();
//     return SafeArea(
//       child: KScaffold(
//         appBar: KAppBar(
//           title: Text(
//             'Attendence',
//             style: kTextStyles.s20WhiteBold,
//           ),
//         ),
//
//
//         body: SingleChildScrollView(
//           child: Padding(
//             padding:  EdgeInsets.only(left: 10.toAutoScaledWidth),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                Padding(
//                  padding:  EdgeInsets.only(top:20.toAutoScaledHeight,left: 10.toAutoScaledWidth,bottom:20.toAutoScaledHeight),
//                  child: Text('Year 2023',style: kTextStyles.s16PrimaryBold,),
//                ),
//                 for (int i = 0; i < 5; i++)
//                   Padding(
//                     padding:  EdgeInsets.only(top:8.toAutoScaledHeight,),
//                     child: Row(
//                       children: [
//                         Container(
//                           height: 60.toAutoScaledHeight,
//                           width: 60.toAutoScaledWidth,
//
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: currentTheme.themeBox.colors.primary,
//                           ),
//                           child: Center(child: Text(month[i],style: kTextStyles.s16WhiteBold,)),
//
//                         ),
//                         8.toHorizontalSizedBox,
//                         KCard(
//                           paddingLeft: 0,
//                           paddingRight: 0,
//                           paddingTop: 0,
//                           paddingBottom: 0,
//                           height: 60.toAutoScaledHeight,
//                           width: 80.toAutoScaledWidth,
//                          // backgroundColor: currentTheme.themeBox.colors.primary.withOpacity(0.4),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text('23',style: kTextStyles.s16greenvariantBold.copyWith(
//                                 color: currentTheme.themeBox.colors.primary
//                               ),),
//                               Text('Present',style: kTextStyles.s16greenvariantBold.copyWith(
//                                   color: currentTheme.themeBox.colors.primary
//                               ),)
//                             ],
//                           ),
//                         ),
//                         8.toHorizontalSizedBox,
//                         KCard(
//                           paddingLeft: 0,
//                           paddingRight: 0,
//                           paddingTop: 0,
//                           paddingBottom: 0,
//                           height: 60.toAutoScaledHeight,
//                           width: 80.toAutoScaledWidth,
//                          // backgroundColor: currentTheme.themeBox.colors.onError.withOpacity(0.2),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text('3',style: kTextStyles.s16pinkVarinetBold.copyWith(
//                                   color: currentTheme.themeBox.colors.onError
//                               ),),
//                               Text('Absent',style: kTextStyles.s16pinkVarinetBold.copyWith(
//                                   color: currentTheme.themeBox.colors.onError
//                               ),)
//                             ],
//                           ),
//                         ),
//                         8.toHorizontalSizedBox,
//                         KCard(
//                           paddingLeft: 0,
//                           paddingRight: 0,
//                           paddingTop: 0,
//                           paddingBottom: 0,
//                           height: 60.toAutoScaledHeight,
//                           width: 80.toAutoScaledWidth,
//                          // backgroundColor: currentTheme.themeBox.colors.blueVarient,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text('0',style: kTextStyles.s16blueVarientBold.copyWith(
//                                   color: currentTheme.themeBox.colors.blueVarient.withOpacity(0.8)
//                               ),),
//                               Text('Leave',style: kTextStyles.s16blueVarientBold.copyWith(
//                                   color: currentTheme.themeBox.colors.blueVarient.withOpacity(0.8)
//                               ),)
//                             ],
//                           ),
//                         ),
//
//
//                       ],
//                     ),
//                   )
//
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
// }
