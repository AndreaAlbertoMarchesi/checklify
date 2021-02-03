import 'package:checklist_app/Services/phoneStorage/Keys.dart';
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

  static List<TaskWithPath> getTasksByName(
      String searchInput, TaskPath taskPath, Task task) {
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

  static TaskWithPath getTaskByNotificationID(
      int id, TaskPath taskPath, Task task) {
    TaskWithPath foundTask;

    task.children.forEach((child) {
      if (foundTask == null) {
        var childPath = taskPath.getCopy();
        childPath.add(task);

        if (child.notification != null && child.notification.id == id)
          foundTask = TaskWithPath(child, childPath);
        else
          foundTask = TaskUtils.getTaskByNotificationID(id, childPath, child);
      }
    });
    return foundTask;
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

  static int compareTasks(Task a, Task b, String order) {
    if (a.isStarred && !b.isStarred)
      return 0;
    else if (!a.isStarred && b.isStarred) return 1;

    switch (order) {
      case Keys.orderByName:
        return a.title.toLowerCase().compareTo(b.title.toLowerCase());

      case Keys.orderByDate:
        if (a.deadline != null && b.deadline == null)
          return 0;
        else if (a.deadline == null && b.deadline != null)
          return 1;
        else
          return a.deadline != null && b.deadline != null
              ? a.deadline.compareTo(b.deadline)
              : 0;
        break;

      default:
        return 0;
    }
  }
}
