import 'package:checklist_app/controller/Storage.dart';
import 'package:checklist_app/model/SelectionState.dart';
import 'package:checklist_app/model/supportClasses/TaskPath.dart';
import 'package:flutter/cupertino.dart';

import 'Task.dart';

class AppState extends ChangeNotifier {
  Task root = Task.emptyRoot;
  Task task = Task.emptyRoot;
  TaskPath taskPath = TaskPath();

  final Storage storage = Storage();
  final selectionState = SelectionState();

  AppState() {
    storage.readData().then((Task value) {
      root = value;
      task = root;
      taskPath.add(root);
      notifyListeners();
    });
  }

  void selectTask(Task task) {
    if (!selectionState.hasSelected(task))
      selectionState.select(task, taskPath.getCopy());
    notifyListeners();
  }

  void unDoSelection() {
    selectionState.clearSelection();
    notifyListeners();
  }

  void addTask(String title) {
    task.children.add(Task(title));
    taskPath.updatePercentage();
    storage.writeData(root);
    notifyListeners();
  }

  void deleteTask(Task task) {
    this.task.children.remove(task);
    taskPath.updatePercentage();
    storage.writeData(root);
    notifyListeners();
  }

  void tickTask(Task task) {
    task.percentage = task.percentage == 0 ? 1 : 0;

    taskPath.updatePercentage();

    storage.writeData(root);
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

  void openTask(Task task) {
    taskPath.add(task);
    this.task = task;
    notifyListeners();
  }

  void moveTask() {
    task.children.addAll(selectionState.tasks);
    taskPath.updatePercentage();

    selectionState.removeTasksFromOldParents();
    selectionState.clearSelection();

    storage.writeData(root);
    notifyListeners();
  }
}
