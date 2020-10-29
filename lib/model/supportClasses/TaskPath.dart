import '../Task.dart';

class TaskPath {

  TaskPath([List<Task> taskList]){
    if(taskList == null)
      this.taskList = List<Task>();
    else
      this.taskList = taskList;
  }

  List<Task> taskList;

  void add(Task task){
    taskList.add(task);
  }

  int getLength()=> taskList.length;

  Task getLastTask()=> taskList.last;

  TaskPath getCopy(){
    return TaskPath(List.from(taskList));
  }

  void updatePercentage(){
    taskList.reversed.forEach((task) {
      task.updatePercentage();
    });
  }

  void backToTask(Task task){
    taskList.removeRange(taskList.indexOf(task) + 1, taskList.length);
  }

  void backToPrevious(){
    taskList.removeLast();
  }
}