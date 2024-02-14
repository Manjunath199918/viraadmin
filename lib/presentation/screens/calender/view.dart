import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
import 'package:viraadmin/modules/domain/core/storage/persistent_storage/persistent_storage.dart';
import 'package:viraadmin/modules/domain/repository/auth/auth_repository.dart';
import 'package:viraadmin/presentation/core_widgets/app_bar/app_bar.dart';
import 'package:viraadmin/presentation/core_widgets/card/card.dart';
import 'package:viraadmin/presentation/core_widgets/custom_textstyle/CustomTextStyle.dart';
import 'package:viraadmin/presentation/core_widgets/image/custom_image.dart';
import 'package:viraadmin/presentation/core_widgets/pressables/flat_button.dart';
import 'package:viraadmin/presentation/core_widgets/scaffold/scaffold.dart';
import 'package:viraadmin/presentation/core_widgets/textfields/textfields1.dart';
import 'package:viraadmin/presentation/screens/attendence/constant.dart';
import 'package:viraadmin/presentation/screens/calender/constant.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:viraadmin/utils/helper/custom_extensions/state.dart';
import 'package:viraadmin/utils/helper/helper.dart';
part 'widgets/calender_view.dart';
part 'widgets/create_calendertableevent.dart';
part 'controller.dart';

class CalenderScreen extends ConsumerWidget {
  const CalenderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(KAppX.theme.current);

    KTextStyles kTextStyles = KTextStyles();

    final params = _VSControllerParams();
    final state = ref.watch(_vsProvider(params));
    final stateController = ref.read(_vsProvider(params).notifier);
    Widget type;
    switch (state.index) {

      case 0:
        type =  CalenderView();
        break;
      case 1:
        type =  CreateCalenderEvent();
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
// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

// import 'dart:collection';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:intl/intl.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
// import 'package:viraadmin/presentation/core_widgets/app_bar/app_bar.dart';
// import 'package:viraadmin/presentation/core_widgets/card/card.dart';
// import 'package:viraadmin/presentation/core_widgets/custom_textstyle/CustomTextStyle.dart';
// import 'package:viraadmin/presentation/core_widgets/scaffold/scaffold.dart';
// import 'package:viraadmin/presentation/core_widgets/seprater/line.dart';
// import 'package:viraadmin/utils/app_extensions/app_extension.dart';
//
// class Calender extends ConsumerStatefulWidget {
//   const Calender({super.key});
//
//   @override
//   ConsumerState<Calender> createState() => _CalenderState();
// }
//
// class _CalenderState extends ConsumerState<Calender> {
//   late final ValueNotifier<List<Event>> _selectedEvents;
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
//       .toggledOff; // Can be toggled on/off by longpressing a date
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;
//   DateTime? _rangeStart;
//   DateTime? _rangeEnd;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _selectedDay = _focusedDay;
//     _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
//   }
//
//   @override
//   void dispose() {
//     _selectedEvents.dispose();
//     super.dispose();
//   }
//
//   List<Event> _getEventsForDay(DateTime day) {
//
//     return kEvents[day] ?? [];
//   }
//
//
//   void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
//     if (!isSameDay(_selectedDay, selectedDay)) {
//       setState(() {
//         _selectedDay = selectedDay;
//         _focusedDay = focusedDay;
//         _rangeStart = null; // Important to clean those
//         _rangeEnd = null;
//         _rangeSelectionMode = RangeSelectionMode.toggledOff;
//       });
//
//       _selectedEvents.value = _getEventsForDay(selectedDay);
//     }
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     final currentTheme = ref.watch(KAppX.theme.current);
//
//     KTextStyles kTextStyles = KTextStyles();
//     return KScaffold(
//       appBar: const KAppBar(
//         title: Text('Calendar'),
//       ),
//       body: Column(
//         children: [
//           KCard(
//             backgroundColor: currentTheme.themeBox.colors.blueVarient,
//            paddingRight: 0,
//             paddingLeft: 0,
//
//             child: TableCalendar(
//
//               firstDay: DateTime(2023, 03, 01),
//               lastDay: DateTime(2024, 03, 01),
//               focusedDay: DateTime.now(),
//               selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//               rangeSelectionMode: _rangeSelectionMode,
//                eventLoader: _getEventsForDay,
//
//               headerStyle: const HeaderStyle(
//                 titleCentered: true,
//                 formatButtonVisible: false,
//
//               ),
//               calendarBuilders: CalendarBuilders(
//                 dowBuilder: (context, day) {
//                   if (true) {
//                     final text = DateFormat.E().format(day);
//
//                     return Center(
//                       child: Text(
//                         text,
//                         style: kTextStyles.s16DarkBlueBold,
//                       ),
//                     );
//                   }
//                 },
//               ),
//               startingDayOfWeek: StartingDayOfWeek.monday,
//               calendarStyle: CalendarStyle(
//                 weekendTextStyle: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: currentTheme.themeBox.fontSizes.s14,
//                     color: currentTheme.themeBox.colors.black),
//                 todayDecoration: BoxDecoration(
//                   color: currentTheme.themeBox.colors.darkBlue,
//                   shape: BoxShape.circle,
//                 ),
//
//                 // Use `CalendarStyle` to customize the UI
//                 outsideDaysVisible: false,
//                 defaultTextStyle: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: currentTheme.themeBox.fontSizes.s14,
//                     color: currentTheme.themeBox.colors.black),
//
//               ),
//               onDaySelected: _onDaySelected,
//             ),
//           ),
//
//           KLine(),
//           20.toVerticalSizedBox,
//
//           Expanded(
//             child: ValueListenableBuilder<List<Event>>(
//               valueListenable: _selectedEvents,
//               builder: (context, value, _) {
//                 return ListView.builder(
//                   physics: NeverScrollableScrollPhysics(),
//                   itemCount: value.length,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       margin: const EdgeInsets.symmetric(
//                         horizontal: 12.0,
//                         vertical: 4.0,
//                       ),
//
//                       child: Row(
//                         children: [
//                           Container(
//                             height: 60.toAutoScaledHeight,
//                             width: 60.toAutoScaledWidth,
//
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: currentTheme.themeBox.colors.onError,
//                             ),
//                             child: Center(child: Column(
//                               children: [
//                                 Text(_selectedDay!.day.toString(),style: kTextStyles.s16WhiteBold,),
//                                 Text(DateFormat.MMMM().format(_selectedDay!).toString(),style: kTextStyles.s16WhiteBold,),
//                               ],
//                             )),
//
//                           ),
//                           8.toHorizontalSizedBox,
//                           Expanded(
//                             child: KCard(
//                               paddingLeft: 0,
//                               paddingRight: 0,
//                               paddingTop: 0,
//                               paddingBottom: 0,
//                               height: 60.toAutoScaledHeight,
//
//                               backgroundColor: getColour(index,currentTheme),
//                               child: Padding(
//                                 padding:  EdgeInsets.only(left:8.toAutoScaledWidth),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//
//                                     Text('Republic Day',style: kTextStyles.s16BlackBold),
//                                     Text('National Holiday',style: kTextStyles.s14onSecondaryVariantRegular,),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//   Color? getColour(int i,var currentTheme){
//     if(i==0){
//       return currentTheme.themeBox.colors.greenvariant;
//     }
//     if(i==1){
//       return currentTheme.themeBox.colors.pinkVarinet;
//     }
//     if(i==2){
//       return currentTheme.themeBox.colors.blueVarient;
//     }
//     if(i%3==0){
//       return currentTheme.themeBox.colors.greenvariant;
//     }
//     if(i%3==1){
//       return currentTheme.themeBox.colors.pinkVarinet;
//     }
//
//     if(i%3==2){
//       return currentTheme.themeBox.colors.blueVarient;
//     }
//
//   }
// }
//
// class Event {
//   final String title;
//
//   const Event(this.title);
//
//   @override
//   String toString() => title;
// }
//
// final kEvents = LinkedHashMap<DateTime, List<Event>>(
//   equals: isSameDay,
//   hashCode: getHashCode,
// )..addAll(_kEventSource);
//
// final _kEventSource = { for (var item in List.generate(50, (index) => index)) DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5) : List.generate(
//         item % 4 + 1, (index) => Event('Event $item | ${index + 1}')) }
//   ..addAll({
//     kToday: [
//       Event('Today\'s Event 1'),
//       Event('Today\'s Event 2'),
//     ],
//   });
//
// int getHashCode(DateTime key) {
//   return key.day * 1000000 + key.month * 10000 + key.year;
// }
//
// /// Returns a list of [DateTime] objects from [first] to [last], inclusive.
// List<DateTime> daysInRange(DateTime first, DateTime last) {
//   final dayCount = last.difference(first).inDays + 1;
//   return List.generate(
//     dayCount,
//     (index) => DateTime.utc(first.year, first.month, first.day + index),
//   );
// }
//
// final kToday = DateTime.now();
// final kFirstDay = DateTime(2023, 03, 01);
// final kLastDay = DateTime(2024, 03, 01);
