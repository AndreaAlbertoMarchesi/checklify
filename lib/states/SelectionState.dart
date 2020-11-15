import '../models/Task.dart';
import '../models/supportClasses/TaskPath.dart';

class SelectionState {

  List<TaskPath> taskPaths = List<TaskPath>();
  List<Task> tasks = List<Task>();

  bool hasSelected([Task task]){
    if(task==null)
      return tasks.length>0;
    else
      return tasks.contains(task);
  }

  void select(Task task, TaskPath taskPath){
    tasks.add(task);
    taskPaths.add(taskPath);
  }


  void deselect(Task task){
    taskPaths.removeAt(tasks.indexOf(task));
    tasks.remove(task);
  }

  void clearSelection(){
    tasks.clear();
    taskPaths.clear();
  }

  void removeTasksFromOldParents(){
    for(int i = 0; i < tasks.length; i++){
      TaskPath taskPath = taskPaths[i];
      taskPath.getLastTask().children.remove(tasks[i]);
      taskPath.updatePercentage();
    }
  }

  int getLength(){
    return tasks.length;
  }

}