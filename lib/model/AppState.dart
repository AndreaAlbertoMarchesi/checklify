import 'package:checklist_app/controller/Storage.dart';
import 'package:checklist_app/model/SelectionState.dart';
import 'package:checklist_app/model/supportClasses/TaskPath.dart';
import 'package:flutter/cupertino.dart';

import 'Task.dart';

class AppState extends ChangeNotifier {
  Task root = Task.emptyRoot;
  Task task = Task.emptyRoot;
  TaskPath taskPath = TaskPath();

  final Storage _storage = Storage();
  final _selectionState = SelectionState();

  AppState() {
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

  List<Task> getSelectedTasks(){
    return _selectionState.tasks;
  }

  void addTask(String title) {
    task.children.add(Task(title));
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

  void updateTask(Task task, {num percentage, String title}) {
    if(percentage != null) {
      task.percentage = percentage;
      taskPath.updatePercentage();
    }
    if(title != null){
      task.title = title;
    }

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

  void openTask(Task task) {
    taskPath.add(task);
    this.task = task;
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
}
