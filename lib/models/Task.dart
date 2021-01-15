import 'package:checklist_app/models/supportClasses/TaskWithPath.dart';
import 'package:checklist_app/models/supportClasses/TaskPath.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Task.g.dart';

/*
visit this link for automatic json serialization of a class:
https://flutter.dev/docs/development/data-and-backend/json

command:
flutter pub run build_runner build --delete-conflicting-outputs

 */

enum ProgressType {
  checkbox,
  counter,
  slider,
}

@JsonSerializable()
class TaskNotification {
  TaskNotification(this.dateTime, this.id);

  DateTime dateTime;
  int id;

  factory TaskNotification.fromJson(Map<String, dynamic> json) =>
      _$TaskNotificationFromJson(json);

  Map<String, dynamic> toJson() => _$TaskNotificationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Task {
  List<Task> children = List<Task>();
  String title;
  String notes;
  num percentage = 0;
  int colorValue;
  DateTime deadline;
  TaskNotification notification;
  bool isStarred = false;
  ProgressType progressType;
  int percentageDivisions;

  static final Task emptyRoot = Task("⌂");

  Task(this.title,
      {this.notes,
      this.colorValue,
      this.deadline,
      this.notification,
      this.isStarred,
      this.progressType,
      this.percentageDivisions});

  void updatePercentage() {
    percentage = 0;
    children
        .forEach((child) => percentage += child.percentage / children.length);
  }

  bool isCompleted() => percentage == 1;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);

  List<TaskWithPath> searchTasks(String searchInput, TaskPath taskPath) {
    var foundTasks = List<TaskWithPath>();

    children.forEach((child) {
      var childPath = taskPath.getCopy();
      childPath.add(this);

      if (child.title.contains(searchInput))
        foundTasks.add(TaskWithPath(child, childPath));

      foundTasks.addAll(child.searchTasks(searchInput, childPath));
    });
    return foundTasks;
  }

  List<TaskWithPath> getTimelineTasks(TaskPath taskPath) {
    var foundTasks = List<TaskWithPath>();

    children.forEach((child) {
      var childPath = taskPath.getCopy();
      childPath.add(this);

      if (child.deadline != null && !child.isCompleted())
        foundTasks.add(TaskWithPath(child, childPath));

      foundTasks.addAll(child.getTimelineTasks(childPath));
    });
    return foundTasks;
  }
}
