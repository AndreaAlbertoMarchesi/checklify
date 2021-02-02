import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/models/supportClasses/TaskPath.dart';
import 'package:checklist_app/models/supportClasses/TaskWithPath.dart';
import 'package:checklist_app/utils/TaskUtils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var mockTaskGrandchild1 = Task("grandchild1");
  mockTaskGrandchild1.notification = TaskNotification(null, 3);
  mockTaskGrandchild1.deadline = DateTime.now();

  var mockTaskChild1 = Task("child1");
  mockTaskChild1.notification = TaskNotification(null, 0);
  mockTaskChild1.deadline = DateTime.now();
  mockTaskChild1.percentage = 1;
  mockTaskChild1.children.add(mockTaskGrandchild1);

  var mockTaskChild2 = Task("child2");
  mockTaskChild2.notification = TaskNotification(null, 9);

  var mockTaskRoot = Task.emptyRoot;
  mockTaskRoot.children.add(mockTaskChild1);
  mockTaskRoot.children.add(mockTaskChild2);

  var mockEmptyTask = Task("empty");

  group('getTasksByName', () {
    test('existing tasks', () {
      var foundTasks =
          TaskUtils.getTasksByName("child1", TaskPath(), mockTaskRoot);

      expect(foundTasks[1].task, mockTaskGrandchild1);
      expect(foundTasks[1].taskPath.taskList,
          TaskPath([mockTaskRoot, mockTaskChild1]).taskList);

      expect(foundTasks[0].task, mockTaskChild1);
      expect(
          foundTasks[0].taskPath.taskList, TaskPath([mockTaskRoot]).taskList);

      expect(foundTasks.length, 2);
    });

    test('non existing tasks', () {
      var foundTasks =
          TaskUtils.getTasksByName("name", TaskPath(), mockTaskRoot);

      expect(foundTasks.length, 0);
    });
  });

  group('getTimelineTasks', () {
    test('existing tasks', () {
      var foundTasks = TaskUtils.getTimelineTasks(TaskPath(), mockTaskRoot);

      expect(foundTasks.first.task, mockTaskGrandchild1);
      expect(foundTasks.first.taskPath.taskList,
          TaskPath([mockTaskRoot, mockTaskChild1]).taskList);
      expect(foundTasks.length, 1);
    });

    test('non existing tasks', () {
      var foundTasks = TaskUtils.getTimelineTasks(TaskPath(), mockEmptyTask);

      expect(foundTasks.length, 0);
    });
  });

  group('getTasksByNotificationID', () {
    test('existing task', () {
      var foundTaskWithPath =
          TaskUtils.getTaskByNotificationID(0, TaskPath(), mockTaskRoot);
      expect(foundTaskWithPath.task, mockTaskChild1);
      expect(foundTaskWithPath.taskPath.taskList,
          TaskPath([mockTaskRoot]).taskList);
    });

    test('non existing task', () {
      var foundTaskWithPath =
          TaskUtils.getTaskByNotificationID(1, TaskPath(), mockTaskRoot);
      expect(foundTaskWithPath, null);
    });
  });

  group('getHighestNotificationID', () {
    test('already existing notifications', () {
      expect(TaskUtils.getHighestNotificationId(mockTaskRoot, 0), 9);
    });

    test('no existing notification', () {
      expect(TaskUtils.getHighestNotificationId(mockEmptyTask, 0), 0);
    });
  });
}
