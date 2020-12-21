class DateTimeFormatter {
  static String dateTimeToFullString(DateTime dateTime) {
    return dayToString(dateTime.day) +
        ", " +
        monthToString(dateTime.month) +
        " " +
        dateTime.day.toString() +
        ", " +
        dateTime.year.toString()+

        ", at " +
      dateTime.hour.toString()+":"+dateTime.minute.toString()
      ;
  }

  static String dayToString(int dateTimeDay) {
    switch (dateTimeDay) {
      case DateTime.monday:
        return "Monday";
      case DateTime.tuesday:
        return "Tuesday";
      case DateTime.wednesday:
        return "Wednesday";
      case DateTime.thursday:
        return "Thursday";
      case DateTime.friday:
        return "Friday";
      case DateTime.saturday:
        return "Saturday";
    }
    return "Sunday";
  }

  static String monthToString(int dateTimeMonth) {
    switch (dateTimeMonth) {
      case DateTime.january:
        return "Jan";
      case DateTime.february:
        return "Feb";
      case DateTime.march:
        return "Mar";
      case DateTime.april:
        return "Apr";
      case DateTime.may:
        return "May";
      case DateTime.june:
        return "Jun";
      case DateTime.july:
        return "Jul";
      case DateTime.august:
        return "Aug";
      case DateTime.september:
        return "Sep";
      case DateTime.october:
        return "Oct";
      case DateTime.november:
        return "Nov";
    }
    return "Dec";
  }
}
