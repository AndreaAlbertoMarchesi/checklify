import 'package:checklist_app/models/supportClasses/SearchedTask.dart';
import 'package:checklist_app/models/supportClasses/TaskPath.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Task.g.dart';

/*
visit this link for automatic json serialization of a class:
https://flutter.dev/docs/development/data-and-backend/json
 */

@JsonSerializable(explicitToJson: true)
class Task {
  String title;
  List<Task> children = List<Task>();
  num percentage = 0;

  static final Task emptyRoot = Task("⌂");

  Task(this.title);

  void updatePercentage() {
    percentage = 0;
    children
        .forEach((child) => percentage += child.percentage / children.length);
  }

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);


  List<SearchedTask> searchTasks(String searchInput, TaskPath taskPath){
    var foundTasks = List<SearchedTask>();

    children.forEach((child) {
      var childPath = taskPath.getCopy();
      childPath.add(this);

      if(child.title.contains(searchInput))
        foundTasks.add(SearchedTask(child, childPath));

      foundTasks.addAll(child.searchTasks(searchInput, childPath));
    });
    return foundTasks;
  }

}
