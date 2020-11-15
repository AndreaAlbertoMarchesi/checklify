import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/models/supportClasses/TaskPath.dart';
import 'package:checklist_app/utils/PhoneStorage.dart';
import 'package:flutter/cupertino.dart';

import 'SelectionState.dart';

class AppState extends ChangeNotifier {
  Task root = Task.emptyRoot;
  Task task = Task.emptyRoot;
  TaskPath taskPath = TaskPath();

  final PhoneStorage _storage;
  final _selectionState = SelectionState();

  AppState(this._storage) {
    _storage.readData().then((Task value) {
      root = value;
      task = root;
      taskPath.add(root);
      notifyListeners();
    });
  }

  void selectTask(Task task) {
    if (!_selectionState.hasSelected(task))
      _selectionState.select(task, taskPath.getCopy());
    notifyListeners();
  }

  void deselect([Task task]) {
    task == null
        ? _selectionState.clearSelection()
        : _selectionState.deselect(task);
    notifyListeners();
  }

  List<Task> getSelectedTasks() {
    return _selectionState.tasks;
  }

  void addTask(String title,
      {int colorValue, String notes, DateTime dateTime}) {
    Task createdTask =
        Task(title, colorValue: colorValue, notes: notes, dateTime: dateTime);
    task.children.add(createdTask);
    taskPath.updatePercentage();
    _storage.writeData(root);
    notifyListeners();
  }

  void deleteTask(Task task) {
    this.task.children.remove(task);
    taskPath.updatePercentage();
    _storage.writeData(root);
    notifyListeners();
  }

  void updateTask(Task task,
      {num percentage, String title, int colorValue, String notes}) {
    if (percentage != null) {
      task.percentage = percentage;
      taskPath.updatePercentage();
    }
    if (title != null) task.title = title;
    if (colorValue != null) task.colorValue = colorValue;
    if (notes != null) task.notes = notes;

    _storage.writeData(root);
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
    else
      this.taskPath = taskPath;
    notifyListeners();
  }

  void moveTask() {
    task.children.addAll(_selectionState.tasks);
    taskPath.updatePercentage();

    _selectionState.removeTasksFromOldParents();
    _selectionState.clearSelection();

    _storage.writeData(root);
    notifyListeners();
  }

  void handleReorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final element = task.children.removeAt(oldIndex);
    task.children.insert(newIndex, element);

    notifyListeners();
  }
}
