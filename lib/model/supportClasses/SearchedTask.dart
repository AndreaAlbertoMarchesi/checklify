import 'package:checklist_app/model/supportClasses/TaskPath.dart';

import '../Task.dart';

class SearchedTask {
  SearchedTask(this.task, this.taskPath);
  Task task;
  TaskPath taskPath;
}