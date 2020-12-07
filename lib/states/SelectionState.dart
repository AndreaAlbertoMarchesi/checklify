import 'package:checklist_app/models/supportClasses/TaskWithPath.dart';

import '../models/Task.dart';
import '../models/supportClasses/TaskPath.dart';

class SelectionState {

  List<TaskWithPath> taskWithPaths = List<TaskWithPath>();

  bool isSelected([Task task]){
    if(task==null)
      return getTasks().length>0;
    else
      return getTasks().contains(task);
  }

  void select(Task task, TaskPath taskPath)=> taskWithPaths.add(TaskWithPath(task, taskPath));


  void deselect(Task task)=> taskWithPaths.removeWhere((e) => e.task == task);

  void clearSelection()=> taskWithPaths.clear();

  void removeTasksFromOldParents(){
    taskWithPaths.forEach((e) {
      e.taskPath.getLastTask().children.remove(e.task);
      e.taskPath.updatePercentage();
    });
  }

  List<Task> getTasks()=> taskWithPaths.map((e) => e.task).toList();

  int getLength()=> taskWithPaths.length;

}