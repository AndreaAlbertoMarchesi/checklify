part of 'package:checklist_app/states/AppState.dart';

class _NotificationManager {
  FlutterLocalNotificationsPlugin _flutterNotificationsPlugin;

  AppState _appState;

  initialize(AppState appState) async {
    this._appState = appState;
    _flutterNotificationsPlugin = FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    final _initializationSettingsAndroid =
    /*mettere qui l icona, questa è l icona della notifica*/
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final _initializationSettingsIOS = IOSInitializationSettings();
    final _initializationSettings = InitializationSettings(
      android: _initializationSettingsAndroid,
      iOS: _initializationSettingsIOS,
    );
    await _flutterNotificationsPlugin.initialize(_initializationSettings,
        onSelectNotification: _onSelectNotification);
  }

  Future _onSelectNotification(String payload) async {
    int id = int.parse(payload);
    TaskWithPath taskWithPathToOpen =
        _getTaskWithPathWithID(TaskWithPath(_appState.root, TaskPath()), id);
    _appState.openTask(taskWithPathToOpen.task, taskWithPathToOpen.taskPath);
  }

  TaskNotification scheduleNotification(
      DateTime scheduledDate, Task root, Task task) {
    int id = task.notification == null
        ? _getHighestNotificationId(root, 0)
        : task.notification.id;

    var androidDetails = new AndroidNotificationDetails(
        "Channel ID", "Desi programmer", "This is my channel",
        importance: Importance.max);
    var iSODetails = new IOSNotificationDetails();
    var generalNotificationDetails =
        new NotificationDetails(android: androidDetails, iOS: iSODetails);
  String title = task.title;
    _flutterNotificationsPlugin.schedule(
        id, "Reminder for : $title)", "", scheduledDate, generalNotificationDetails,
        payload: id.toString());

    _printDebugInformation(scheduledDate, id);
    return TaskNotification(scheduledDate, id);
  }

  cancelNotification(int notificationId) async {
    print("cancelling notification with id: " + notificationId.toString());
    await _flutterNotificationsPlugin.cancel(notificationId);
  }

  static int _getHighestNotificationId(Task task, int maxId) {
    if (task.notification != null && task.notification.id > maxId)
      maxId = task.notification.id;

    task.children.forEach((child) {
      int childMaxId = _getHighestNotificationId(child, maxId);
      if (childMaxId > maxId) maxId = childMaxId;
    });
    return maxId;
  }

  TaskWithPath _getTaskWithPathWithID(TaskWithPath taskWithPath, int id) {
    Task task = taskWithPath.task;
    if (task.notification != null && task.notification.id == id)
      return TaskWithPath(task, taskWithPath.taskPath);
    else {
      task.children.forEach((child) {
        var childPath = taskWithPath.taskPath;
        childPath.add(child);
        return _getTaskWithPathWithID(TaskWithPath(child, childPath), id);
      });
    }
    return null;
  }

  _printDebugInformation(DateTime scheduledDate, int id) async {
    print("scheduled notification for: " +
        scheduledDate.toIso8601String() +
        " with id: " +
        id.toString());
    List<PendingNotificationRequest> pendingNotificationRequests =
        await _flutterNotificationsPlugin?.pendingNotificationRequests();
    print("pending notifications: " +
        pendingNotificationRequests.length.toString());
  }
}
