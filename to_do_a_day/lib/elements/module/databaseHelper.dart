import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'task.dart';

class DatabaseHandler {
  Future<Database> initializeDb() async {
    String path = await getDatabasesPath();
    return openDatabase(join(path, 'Tasks.db'),
        onCreate: (database, version) async {
      await database.execute(
        'CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT NOT NULL ,isDone INTEGER NOT NULL ,priority INTEGER NOT NULL,notification TEXT,isArchived INTEGER NOT NULL,creationTime TEXT NOT NULL )',
      );
      await database.execute(
        'CREATE TABLE user(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT NOT NULL)',
      );
    }, version: 1);
  }

  //inserting into db
  Future<void> insertTask(Task task) async {
    final Database db = await initializeDb();
    await db.insert('tasks', task.toMap(),
        conflictAlgorithm:
            ConflictAlgorithm.replace); //will replace any duplicate entry
  }

  Future<void> updateTask(Task task) async {
    final Database db = await initializeDb();
    await db.update('tasks', task.toMap(),
        conflictAlgorithm:
            ConflictAlgorithm.replace); //will replace any duplicate entry
  }

//add name to user
  Future<void> addName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final Database db = await initializeDb();
    int userID = await db
        .insert('user', {'name': name},
            conflictAlgorithm: ConflictAlgorithm.replace)
        .whenComplete(() => print(name)); //will replace any duplicate entry
    await prefs.setInt('userID', userID);
  }

  //update name
  Future<void> nameUpdate(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final Database db = await initializeDb();
    await db.rawUpdate('UPDATE user SET name =?  WHERE id==? ',
        [name, prefs.getInt('userID')]);
  }

  Future<void> deleteNames() async {
    final Database db = await initializeDb();
    await db
        .rawUpdate(
          'delete from user',
        )
        .whenComplete(() => debugPrint('done'));
  }

  //deleting from db
  Future<void> deleteTask(Task task) async {
    final Database db = await initializeDb();
    await db.delete('tasks', where: 'id==?', whereArgs: [task.id]);
  }

  Future<void> EmptyArchive() async {
    final Database db = await initializeDb();
    await db.delete('tasks', where: 'isArchived==1');
  }

  //fetch all tasks
  Future<List<Task>> getTasks() async {
    final Database db = await initializeDb();
    List<Map<String, dynamic>> items =
        await db.query('tasks', where: 'isArchived==0', orderBy: 'id DESC');
    //now converting list of maps to lis of Tasks
    return List.generate(
        items.length,
        ((i) => Task(
            id: items[i]['id'],
            name: items[i]['name'],
            isDone: items[i]['isDone'] == 1 ? true : false,
            priority: items[i]['priority'],
            notifacation: items[i]['notification'],
            isArchived: items[i]['isArchived'] == 1
                ? true
                : false, //no bool datatype in sqflite so converting it to int,and here we convert in to bool when it comes from db
            creationTime: items[i]['creationTime'])));
  }

  //fetch all tasks
  Future<String> getname() async {
    final Database db = await initializeDb();
    List<Map<String, dynamic>> items = await db.query('user');
    //now converting list of maps to lis of Tasks
    print('from dataBase ${items[0]['name']}');
    return items[0]['name']; //query the name
  }

  //to fetch the Archived tasks
  Future<List<Task>> getArchivedTasks() async {
    final Database db = await initializeDb();
    List<Map<String, dynamic>> items =
        await db.query('tasks', where: 'isArchived==1', orderBy: 'id DESC');
    //now converting list of maps to lis of Tasks
    return List.generate(
        items.length,
        ((i) => Task(
            id: items[i]['id'],
            name: items[i]['name'],
            isDone: items[i]['isDone'] == 1 ? true : false,
            priority: items[i]['priority'],
            notifacation: items[i]['notification'],
            isArchived: items[i]['isArchived'] == 1
                ? true
                : false, //no bool datatype in sqflite so converting it to int,and here we convert in to bool when it comes from db
            creationTime: items[i]['creationTime'])));
  }

//to change the done state and toggle the checkbox
  Future<void> DoneUpdate(Task task) async {
    final Database db = await initializeDb();
    await db.rawUpdate('UPDATE tasks SET isDone =? WHERE id==? ',
        [task.isDone ? 1 : 0, task.id]);
  }

  Future<void> archivingTasks() async {
    final Database db = await initializeDb();
    await db.rawUpdate(
      'UPDATE tasks SET isArchived =1 ',
    );
  }
}
