import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'model/task.dart';

enum AppTheme {
  DARK,
  LIGHT,
}

class AppState extends ChangeNotifier {
  final String username = 'Muhammad Taha';

  AppTheme appTheme = AppTheme.DARK;

  Box<Task> taskBox = Hive.box<Task>('taskBox');

  List<Task> get todoList =>
      taskBox.values.where((task) => task.status == 'todo').toList();

  List<Task> get completedList =>
      taskBox.values.where((task) => task.status == 'completed').toList();

  void toggleTheme(isDarkTheme) {
    if (appTheme == AppTheme.DARK) {
      appTheme = AppTheme.LIGHT;
    } else {
      appTheme = AppTheme.DARK;
    }
    notifyListeners();
  }

  void addTask(Task task) {
    taskBox.add(task);
    notifyListeners();
  }

  void completeTask(int index) {
    int taskId = todoList.elementAt(index).id;
    Task task = taskBox.values.firstWhere((task) => task.id == taskId);
    task.status = 'completed';
    taskBox.putAt(index, task);
    notifyListeners();
  }

  void deleteTask(int index) {
    taskBox.deleteAt(index);
  }
}
