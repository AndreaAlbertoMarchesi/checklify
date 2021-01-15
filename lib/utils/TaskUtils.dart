import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/models/supportClasses/TaskPath.dart';
import 'package:checklist_app/models/supportClasses/TaskWithPath.dart';

class TaskUtils {

  static List<TaskWithPath> getTimelineTasks(TaskPath taskPath, Task task) {
    var foundTasks = List<TaskWithPath>();

    task.children.forEach((child) {
      var childPath = taskPath.getCopy();
      childPath.add(task);

      if (child.deadline != null && !child.isCompleted())
        foundTasks.add(TaskWithPath(child, childPath));

      foundTasks.addAll(getTimelineTasks(childPath, child));
    });
    return foundTasks;
  }

  static List<TaskWithPath> getTasksByName(String searchInput, TaskPath taskPath, Task task) {
    var foundTasks = List<TaskWithPath>();

    task.children.forEach((child) {
      var childPath = taskPath.getCopy();
      childPath.add(task);

      if (child.title.contains(searchInput))
        foundTasks.add(TaskWithPath(child, childPath));

      foundTasks.addAll(getTasksByName(searchInput, childPath, child));
    });
    return foundTasks;
  }

  static TaskWithPath getTaskByNotificationID(TaskWithPath taskWithPath, int id) {
    Task task = taskWithPath.task;
    if (task.notification != null && task.notification.id == id)
      return TaskWithPath(task, taskWithPath.taskPath);
    else {
      task.children.forEach((child) {
        var childPath = taskWithPath.taskPath;
        childPath.add(child);
        return getTaskByNotificationID(TaskWithPath(child, childPath), id);
      });
    }
    return null;
  }

  static int getHighestNotificationId(Task task, int maxId) {
    if (task.notification != null && task.notification.id > maxId)
      maxId = task.notification.id;

    task.children.forEach((child) {
      int childMaxId = getHighestNotificationId(child, maxId);
      if (childMaxId > maxId) maxId = childMaxId;
    });
    return maxId;
  }

}