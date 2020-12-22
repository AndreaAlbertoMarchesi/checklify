import 'package:checklist_app/models/supportClasses/TaskWithPath.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:provider/provider.dart';

class InAppCalendar extends StatelessWidget {
  InAppCalendar(this.taskWithPath);

  final List<TaskWithPath> taskWithPath;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();
    final appState = context.watch<AppState>();

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Calendar",
          ),
        ),
        body: SfCalendar(
          backgroundColor: Colors.transparent,
          view: CalendarView.month,
          headerHeight: 50,
          headerStyle: CalendarHeaderStyle(
            textStyle: TextStyle(
              fontSize: settings.getFontSizeChildren(),
              letterSpacing: 0.6,
              color: settings.getFont(),
            ),
          ),
          firstDayOfWeek: 1,
          initialSelectedDate: DateTime.now(),
          showNavigationArrow: true,
          showDatePickerButton: true,
          allowViewNavigation: true,
          appointmentTextStyle: TextStyle(
            fontSize: 12,
            letterSpacing: 0.6,
          ),
          viewHeaderStyle: ViewHeaderStyle(
            backgroundColor: settings.getColor(),
            dayTextStyle: TextStyle(
              fontSize: 15,
              letterSpacing: 0.6,
              color: settings.getFont(),
            ),
          ),
          allowedViews: [
            CalendarView.month,
            CalendarView.week,
          ],
          dataSource: MeetingDataSource(_getDataSource()),
          monthViewSettings: MonthViewSettings(
              numberOfWeeksInView: 6,
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
        ));
  }

  List<Meeting> _getDataSource() {
    List<Meeting> meetings = <Meeting>[];

    taskWithPath.forEach((element) {
      final DateTime startTime = DateTime(
          element.task.deadline.year,
          element.task.deadline.month,
          element.task.deadline.day,
          element.task.deadline.hour);
      final DateTime endTime = startTime.add(const Duration(hours: 2));
      meetings.add(Meeting(element.task.title, startTime, endTime,
          Color(element.task.colorValue), false));
    });
    return meetings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments[index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments[index].to;
  }

  @override
  String getSubject(int index) {
    return appointments[index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments[index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments[index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
