import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_a_day/elements/widgets/addingTodo.dart';
import 'package:sqflite/sqflite.dart';

final String tableTodo = 'todo';
final String columnId = '_id';
final String columnTitle = 'name';
final String columnDone = 'done';
final String columnPriority = 'priority';
final String columnNotifi = 'notification';

class Task {
  int? id;
  String name;
  int isDone = 0;
  int priority;
  var notifacation;
  int? isArchived;
  var creationDate;
  // Map<String, Object?> toMap() {
  //   var map = <String, Object?>{
  //     columnTitle: name,
  //     columnDone: isDone,
  //     columnPriority: priority,
  //     columnNotifi: notifacation
  //   };

  //   map[columnId] = id;

  //   return map;
  // }

  Task(
      {required this.name,
      this.isDone = 0,
      required this.priority,
      this.notifacation,
      this.isArchived = 0,
      this.creationDate});
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isDone': isDone,
      'priority': priority,
      'notifiction': notifacation.toString(),
      'isArchived': isArchived,
      'creationDate': creationDate
    };
  }

  factory Task.fromMap(Map<dynamic, dynamic> map) {
    return Task(
        name: map['name'],
        isDone: map['isDone'],
        priority: map['priority'],
        notifacation: map['notifiction']);
  }
  String toJson() => json.encode(toMap());
  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));
  void toggleDone() {
    isDone == 0 ? isDone = 1 : isDone = 0;
  }
}
