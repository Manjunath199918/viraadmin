//
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:intl/intl.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
// import 'package:viraadmin/presentation/core_widgets/app_bar/app_bar.dart';
// import 'package:viraadmin/presentation/core_widgets/card/card.dart';
// import 'package:viraadmin/presentation/core_widgets/custom_textstyle/CustomTextStyle.dart';
// import 'package:viraadmin/presentation/core_widgets/image/custom_image.dart';
// import 'package:viraadmin/presentation/core_widgets/pressables/flat_button.dart';
// import 'package:viraadmin/presentation/core_widgets/scaffold/scaffold.dart';
// import 'package:viraadmin/presentation/screens/attendence/constant.dart';
// import 'package:viraadmin/presentation/screens/HomeWork/constant.dart';
// import 'package:viraadmin/utils/app_extensions/app_extension.dart';
// import 'package:viraadmin/utils/helper/helper.dart';
//
// class HomeWork extends ConsumerWidget {
//   const HomeWork({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final currentTheme = ref.watch(KAppX.theme.current);
//
//     KTextStyles kTextStyles = KTextStyles();
//     return SafeArea(
//       child: KScaffold(
//         appBar: KAppBar(
//           title: Text('HomeWork'),
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.only(left: 10.toAutoScaledWidth),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//
//                 Padding(
//                     padding: EdgeInsets.only(
//
//                         left: 10.toAutoScaledWidth,
//                         bottom: 20.toAutoScaledHeight),
//                     child: TableCalendar(
//                       calendarStyle: CalendarStyle(
//                           //canEventMarkersOverflow: true,
//                         todayDecoration: BoxDecoration(
//                           color: currentTheme.themeBox.colors.darkBlue,
//                           shape: BoxShape.circle,
//                         ),
//
//                         defaultTextStyle:TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: currentTheme.themeBox.fontSizes.s14,
//                               color:currentTheme.themeBox.colors.black) ,
//                          holidayTextStyle: TextStyle(
//                              fontWeight: FontWeight.bold,
//                              fontSize: currentTheme.themeBox.fontSizes.s14,
//                              color:currentTheme.themeBox.colors.white
//                          ),
//
//                         holidayDecoration: BoxDecoration(
//                           color: currentTheme.themeBox.colors.onError,
//                           shape: BoxShape.circle,
//                         ),
//
//                         weekendTextStyle:TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: currentTheme.themeBox.fontSizes.s14,
//                             color:currentTheme.themeBox.colors.black) ,
//                           todayTextStyle: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: currentTheme.themeBox.fontSizes.s14,
//                               color:currentTheme.themeBox.colors.white),
//
//
//                       ),
//                         headerStyle: HeaderStyle(
//                           titleCentered: true,
//                           formatButtonVisible: false,
//
//
//
//                         ),
//                         startingDayOfWeek: StartingDayOfWeek.monday,
//                         onDaySelected: ( day, focusedday){
//
//                         },
//                         eventLoader: (day) {
//                           if (day.add(const Duration(days:1)) == DateTime.now().add(const Duration(days:1))) {
//                             return ['Hello','Hello','Hello','Hello','Hello','Hello','Hello','Hello','Hello','Hello','Hello','Hello','Hello','Hello','Hello','Hello'];
//                           }
//
//                           return [];
//                         },
//                         calendarBuilders: CalendarBuilders(
//                           dowBuilder: (context, day) {
//                             if (true) {
//                               final text = DateFormat.E().format(day);
//
//                               return Center(
//                                 child: Text(
//                                   text,
//                                   style: kTextStyles.s16BlackBold.copyWith(
//                                       height:0
//                                   ),
//                                 ),
//                               );
//                             }
//                           },
//                         ),
//                         holidayPredicate: (day) {
//                           // Weekends
//                           return holidays.contains(day.toUtc());
//                         },
//                         // rowHeight: 40.toAutoScaledHeight,
//                         focusedDay: DateTime.now(),
//                         firstDay: DateTime.utc(2023, 03, 01),
//                         lastDay: DateTime.utc(2024, 03, 01)),
//                        ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

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
import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:viraadmin/utils/helper/custom_extensions/state.dart';

part 'controller.dart';
part 'widgets/completed_work.dart';
part 'widgets/pending_work.dart';

class Homework extends ConsumerWidget {
  int? index;
  Homework({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

    final currentTheme = ref.watch(KAppX.theme.current);

    KTextStyles kTextStyles = KTextStyles();
    return KScaffold(
      extendedBehindAppbar: true,
      appBar: KAppBar(
        title: Text(
          'HomeWork',
          style: kTextStyles.s18WhiteBold,
        ),
        backgroundColor: Colors.transparent,
        themeColor: currentTheme.themeBox.colors.white,
      ),
      body:
      SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 360.toAutoScaledWidth,
                height: 150.toAutoScaledHeight,
                color: currentTheme.themeBox.colors.darkBlue,
                child: Padding(
                  padding: EdgeInsets.only(top: 100.toAutoScaledHeight),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      for (int i = 0; i < 2; i++)
                        if (i == state.index) ...[
                          InkWell(
                              onTap: () {
                                stateController.setIndex(i);
                              },
                              child: tabBar(true, ref, i))
                        ] else
                          InkWell( onTap: () {
                            stateController.setIndex(i);
                          },child: tabBar(false, ref, i)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MediaQuery.removePadding(
                    context: context, removeTop: true, child: type),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget tabBar(bool isActive, WidgetRef ref, int i) {
    final currentTheme = ref.watch(KAppX.theme.current);
    List<String> heading = [
      'Pending',
      'Completed',
    ];
    KTextStyles kTextStyles = KTextStyles();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // i!=0?80.toHorizontalSizedBox:0.toHorizontalSizedBox,
        Column(
          children: [
            Text(
              heading[i],
              style: kTextStyles.s16WhiteBold,
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
}
