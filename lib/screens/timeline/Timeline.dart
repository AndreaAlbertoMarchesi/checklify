import 'package:cell_calendar/cell_calendar.dart';
import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/models/supportClasses/TaskPath.dart';
import 'package:checklist_app/models/supportClasses/TaskWithPath.dart';
import 'package:checklist_app/screens/timeline/widgets/TimelineFreeDays.dart';
import 'package:checklist_app/screens/timeline/widgets/TimelineTask.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Timeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();
    final appState = context.watch<AppState>();
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        extendBody: true,
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: ListView(
          children: getItems(appState.root),
        ));
  }

  List<Widget> getItems(Task root) {
    List<TaskWithPath> tasksWithPaths = root.getTimelineTasks(TaskPath());
    tasksWithPaths.sort((a, b) => a.task.deadline.compareTo(b.task.deadline));

    List<Widget> items = List<Widget>();
    DateTime previousDeadline;

    tasksWithPaths.forEach((e) {
      DateTime currentDeadline = e.task.deadline;
      bool hasSameDateAsPrevious =
          haveSameDate(currentDeadline, previousDeadline);

      if (previousDeadline != null &&
          currentDeadline.difference(previousDeadline).inDays > 1)
        items.add(TimelineFreeDays(previousDeadline, currentDeadline));

      items.add(TimelineTask(e, hasSameDateAsPrevious));

      previousDeadline = e.task.deadline;
    });
    return items;
  }

  bool haveSameDate(DateTime deadline, DateTime prevDeadline) {
    return prevDeadline == null
        ? false
        : deadline.month == prevDeadline.month &&
            deadline.day == prevDeadline.day;
  }
}

/*
 @override
  void initState() {
    super.initState();
      retrieveEvents().then((value) {
        setState(() {
          events = value;
        });
      });
  }



class Timeline extends StatelessWidget {
  final today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final _sampleEvents = [
      CalendarEvent(
          eventName: "New iPhone",
          eventDate: today.add(Duration(days: -42)),

          eventBackgroundColor: Colors.black),
      CalendarEvent(
          eventName: "Writing test",
          eventDate: today.add(Duration(days: -30)),
          eventBackgroundColor: Colors.deepOrange),
      CalendarEvent(
          eventName: "Play soccer",
          eventDate: today.add(Duration(days: -7)),
          eventBackgroundColor: Colors.greenAccent),
      CalendarEvent(
          eventName: "Learn about history",
          eventDate: today.add(Duration(days: -7))),
      CalendarEvent(
          eventName: "Buy new keyboard",
          eventDate: today.add(Duration(days: -7))),
      CalendarEvent(
          eventName: "Walk around the park",
          eventDate: today.add(Duration(days: -7)),
          eventBackgroundColor: Colors.deepOrange),
      CalendarEvent(
          eventName: "Buy a present for Rebecca",
          eventDate: today.add(Duration(days: -7)),
          eventBackgroundColor: Colors.pink),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body: CellCalendar(
        events: _sampleEvents,
        onCellTapped: (date) {
          final eventsOnTheDate = _sampleEvents.where((event) {
            final eventDate = event.eventDate;
            return eventDate.year == date.year &&
                eventDate.month == date.month &&
                eventDate.day == date.day;
          }).toList();
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title:
                        Text(date.month.monthName + " " + date.day.toString()),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: eventsOnTheDate
                          .map(
                            (event) => Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(4),
                              margin: EdgeInsets.only(bottom: 12),
                              color: event.eventBackgroundColor,
                              child: Text(
                                event.eventName,
                                style: TextStyle(color: event.eventTextColor),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ));
        },
        onPageChanged: (firstDate, lastDate) {
          /// Called when the page was changed
          /// Fetch additional events by using the range between [firstDate] and [lastDate] if you want
        },
      ),
    );
  }
}
*/
/*

  final DeviceCalendarPlugin _deviceCalendarPlugin = DeviceCalendarPlugin();
  var calendarsResult;
  List<Calendar> _calendars;

  fun() async {
    calendarsResult = await _deviceCalendarPlugin.retrieveCalendars();
    _calendars = calendarsResult?.data;
  }

  @override
  initState() {
    super.initState();
    fun();
  }


    print(_calendars[2].name);
    _deviceCalendarPlugin.createOrUpdateEvent(Event(
      _calendars[2].id,
      title: "yo",
      start: DateTime(
        2021,
        1,
        1,
      ),
      end: DateTime(
        2021,
        1,
        2,
      ),
      allDay: true,
    ));
*
* */

/*

      SfCalendar(
      monthViewSettings: MonthViewSettings(showAgenda: true),
          view: CalendarView.schedule,
          scheduleViewMonthHeaderBuilder: ,
          dataSource: MeetingDataSource(_getDataSource()),
          scheduleViewSettings: ScheduleViewSettings(),
          // by default the month appointment display mode set as Indicator, we can
          // change the display mode as appointment using the appointment display
          // mode property
        );
  }

  List<Meeting> _getDataSource() {
    var meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
    DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
        'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    meetings.add(Meeting(
        'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }
}

/// An object to set the appointment collection data source to calendar, which
/// used to map the custom appointment data to the calendar appointment, and
/// allows to add, remove or reset the appointment collection.
class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
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

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}

*/
