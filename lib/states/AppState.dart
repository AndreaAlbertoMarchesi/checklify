import 'package:checklist_app/Services/phoneStorage/PhoneStorage.dart';
import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/models/supportClasses/TaskPath.dart';
import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:checklist_app/models/supportClasses/TaskWithPath.dart';
import 'package:checklist_app/utils/TaskUtils.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';

part '../Services/NotificationManager.dart';

part 'AppStateParts/SelectionState.dart';

class AppState extends ChangeNotifier {
  Task root = Task.emptyRoot;
  Task task = Task.emptyRoot;
  TaskPath taskPath = TaskPath();

  final PhoneStorage _storage;
  final _selectionState = _SelectionState();
  final _NotificationManager _notificationManager = _NotificationManager();

  AppState(this._storage) {
    _storage.readTaskTree().then((Task value) {
      root = value;
      task = root;
      taskPath.add(root);
      notifyListeners();
      _notificationManager.initialize(this);
    });
  }

  void setStarredTask() {
    task.children.forEach((element) {
      if (element.isStarred)
        handleReorder(task.children.indexOf(element), 0, true);
    });
    notifyListeners();
  }

  void selectTask(Task task) {
    if (!_selectionState.isSelected(task))
      _selectionState.select(task, taskPath.getCopy());
    notifyListeners();
  }

  void deselect([Task task]) {
    task == null
        ? _selectionState.clearSelection()
        : _selectionState.deselect(task);
    notifyListeners();
  }

  List<TaskWithPath> getSelectedTaskWithPaths() {
    return _selectionState.taskWithPaths;
  }

  bool isSelected([Task task]) {
    return _selectionState.isSelected(task);
  }

  void addTask(TaskValues taskValues) {
    Task createdTask = Task(taskValues.title,
        colorValue: taskValues.colorValue,
        notes: taskValues.notes,
        deadline: taskValues.deadline,
        isStarred: taskValues.isStarred,
        progressType: taskValues.progressType,
        percentageDivisions: taskValues.percentageDivisions);

    if (taskValues.dateTimeNotification != null)
      createdTask.notification = _notificationManager.scheduleNotification(
          taskValues.dateTimeNotification, root, createdTask);

    task.children.add(createdTask);
    taskPath.updatePercentage();
    setStarredTask();
    _storage.writeTaskTree(root);
    notifyListeners();
  }

  void deleteTask(Task task) {
    if (task.notification != null)
      _notificationManager.cancelNotification(task.notification.id);

    this.task.children.remove(task);
    taskPath.updatePercentage();
    _storage.writeTaskTree(root);
    notifyListeners();
  }

  void updateTask(Task task, TaskValues taskValues) {
    DateTime newNotificationDateTime = taskValues.dateTimeNotification;
    DateTime oldNotificationDateTime =
        task.notification == null ? null : task.notification.dateTime;

    if (newNotificationDateTime != null &&
        newNotificationDateTime != oldNotificationDateTime)
      task.notification = _notificationManager.scheduleNotification(
          taskValues.dateTimeNotification, root, task);
    else if(newNotificationDateTime == null && task.notification != null){
      _notificationManager.cancelNotification(task.notification.id);
      task.notification = null;
    }

    task.title = taskValues.title;
    task.colorValue = taskValues.colorValue;
    task.notes = taskValues.notes;
    task.deadline = taskValues.deadline;
    task.isStarred = taskValues.isStarred;
    task.progressType = taskValues.progressType;
    task.percentageDivisions = taskValues.percentageDivisions;
    task.doesShowDailyPercentage = taskValues.doesShowDailyPercentage;
    setStarredTask();
    _storage.writeTaskTree(root);
    notifyListeners();
  }

  void updatePercentage(Task task, num percentage) {
    task.percentage = percentage;
    taskPath.updatePercentage();
    notifyListeners();
  }

  void backToTask(Task task) {
    taskPath.backToTask(task);
    this.task = task;
    notifyListeners();
  }

  void backToPreviousTask() {
    if (taskPath.getLength() > 1) {
      taskPath.backToPrevious();
      this.task = taskPath.getLastTask();
      notifyListeners();
    }
  }

  void backToRoot() {
    taskPath.backToTask(root);
    this.task = root;
    notifyListeners();
  }

  void openTask(Task task, [TaskPath taskPath]) {
    this.task = task;
    if (taskPath == null)
      this.taskPath.add(task);
    else {
      taskPath.add(task);
      this.taskPath = taskPath;
    }
    notifyListeners();
  }

  void moveTask() {
    task.children.addAll(_selectionState.getTasks());
    taskPath.updatePercentage();

    _selectionState.removeTasksFromOldParents();
    _selectionState.clearSelection();

    _storage.writeTaskTree(root);
    notifyListeners();
  }

  void handleReorder(int oldIndex, int newIndex, bool isUpdated) {
    if (!task.children.elementAt(oldIndex).isStarred && !isUpdated) {
      if (oldIndex < newIndex) {
        newIndex -= 1;
        final element = task.children.removeAt(oldIndex);
        task.children.insert(newIndex, element);
      } else {
        int index = 0;
        task.children.forEach((element) {
          if (element.isStarred) index++;
        });
        final element = task.children.removeAt(oldIndex);
        if (index > newIndex)
          task.children.insert(index, element);
        else
          task.children.insert(newIndex, element);
      }
      notifyListeners();
    } else if (isUpdated && task.children.elementAt(oldIndex).isStarred) {
      final element = task.children.removeAt(oldIndex);
      task.children.insert(newIndex, element);
    }
  }

  void setTaskOrder(order) {
    task.children.sort((a, b) => TaskUtils.compareTasks(a, b, order));
    _storage.writeTaskTree(root);
    notifyListeners();
  }
}
