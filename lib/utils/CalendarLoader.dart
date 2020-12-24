import 'package:device_calendar/device_calendar.dart';

List<Calendar> calendars;
List<String> calendarsNames;
var events;

DeviceCalendarPlugin _deviceCalendarPlugin = DeviceCalendarPlugin();

Future<List<Event>> retrieveEvents() async {
  var _calendar;
  var _calendars;

  try {
    var permissionsGranted = await _deviceCalendarPlugin.hasPermissions();
    if (permissionsGranted.isSuccess && !permissionsGranted.data) {
      permissionsGranted = await _deviceCalendarPlugin.requestPermissions();
      if (!permissionsGranted.isSuccess || !permissionsGranted.data) {}
    }

    final calendarsResult = await _deviceCalendarPlugin.retrieveCalendars();

    _calendars = calendarsResult?.data;

    _calendar = _calendars[2];
    print(_calendar.toString());

    final startDate = DateTime.now().add(Duration(days: -30));
    final endDate = DateTime.now().add(Duration(days: 30));
    var calendarEventsResult = await _deviceCalendarPlugin.retrieveEvents(
        _calendar.id,
        RetrieveEventsParams(startDate: startDate, endDate: endDate));
    print(calendarEventsResult?.data.toString());
    return calendarEventsResult?.data;
  } catch (e) {
    print(e);
  }
}
