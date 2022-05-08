import 'package:flutter/foundation.dart';
import 'task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'buy milk', notifacation: null, priority: 3),
    Task(
      name: 'buy ki',
      notifacation: DateTime.now(),
      priority: 3,
    ),
    Task(name: 'buy lk', notifacation: null, priority: 2),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(
        _tasks); //to prevent any modifiing on the list of tasks
  }

  void addTask(String name, bool isDone, int priority, DateTime? notifacation) {
    final task = Task(
        name: name,
        priority: priority,
        isDone: false,
        notifacation: notifacation);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deletingTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  bool isEmptyList() {
    return _tasks.iterator.moveNext();
    ;
  }
}
