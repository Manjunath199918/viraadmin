import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
import 'package:viraadmin/presentation/core_widgets/app_bar/app_bar.dart';
import 'package:viraadmin/presentation/core_widgets/card/card.dart';
import 'package:viraadmin/presentation/core_widgets/custom_textstyle/CustomTextStyle.dart';
import 'package:viraadmin/presentation/core_widgets/scaffold/scaffold.dart';
import 'package:viraadmin/presentation/core_widgets/seprater/line.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';

class AttendenceDetails extends ConsumerStatefulWidget {
  const AttendenceDetails({super.key});

  @override
  ConsumerState<AttendenceDetails> createState() => _AttendenceDetailsState();
}

class _AttendenceDetailsState extends ConsumerState<AttendenceDetails> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    print(selectedDay);
    print('selectedDay');
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<int> selectedDays = [12, 04, 05, 01];

    final currentTheme = ref.watch(KAppX.theme.current);

    KTextStyles kTextStyles = KTextStyles();
    return KScaffold(
      appBar:  KAppBar(
        backgroundColor:currentTheme.themeBox.colors.darkBlue ,
        title: Text('Details',style: kTextStyles.s18WhiteBold,),
      ),
      body: Column(
        children: [
          KCard(
            backgroundColor: currentTheme.themeBox.colors.blueVarient,
            paddingRight: 0,
            paddingLeft: 0,
            child: TableCalendar(
              firstDay: DateTime(1999, 07, 01),
              lastDay: DateTime(2029, 08, 02),
              focusedDay: _focusedDay,
              availableGestures: AvailableGestures.none,
              selectedDayPredicate: (day) {
                return selectedDays.contains(day.day);
              },
              rangeSelectionMode: _rangeSelectionMode,
              holidayPredicate: (day) {
                return day.weekday == 7;
              },
              //eventLoader: _getEventsForDay,
              headerStyle:  HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
                titleTextStyle:  kTextStyles.s18BlackBold,
              ),

              calendarBuilders: CalendarBuilders(
                dowBuilder: (context, day) {
                  if (true) {
                    final text = DateFormat.E().format(day);

                    return Center(
                      child: Text(
                        text,
                        style: kTextStyles.s16DarkBlueBold,
                      ),
                    );
                  }
                },

              ),
              startingDayOfWeek: StartingDayOfWeek.monday,

              calendarStyle: CalendarStyle(

                holidayTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: currentTheme.themeBox.fontSizes.s14,
                    color: currentTheme.themeBox.colors.onBackgroundVariant),
                holidayDecoration: const BoxDecoration(),

                weekendTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: currentTheme.themeBox.fontSizes.s14,
                    color: currentTheme.themeBox.colors.black),
                todayDecoration: BoxDecoration(
                  color: currentTheme.themeBox.colors.darkBlue,
                  shape: BoxShape.circle,
                ),

                // Use `CalendarStyle` to customize the UI
                outsideDaysVisible: false,

                defaultTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: currentTheme.themeBox.fontSizes.s14,
                    color: currentTheme.themeBox.colors.black),
                selectedDecoration: BoxDecoration(
                  color: currentTheme.themeBox.colors.onError,
                  shape: BoxShape.circle,
                ),
                selectedTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: currentTheme.themeBox.fontSizes.s14,
                    color: currentTheme.themeBox.colors.black),
              ),
              onDaySelected: _onDaySelected,
            ),
          ),
          KLine(),
          20.toVerticalSizedBox,
        ],
      ),
    );
  }


}

class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
    key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
    value: (item) => List.generate(
        item % 4 + 1, (index) => Event('Event $item | ${index + 1}')))
  ..addAll({
    kToday: [
      Event('Today\'s Event 1'),
      Event('Today\'s Event 2'),
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(2023, 03, 01);
final kLastDay = DateTime(2024, 03, 01);
