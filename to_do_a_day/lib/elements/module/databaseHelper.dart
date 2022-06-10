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
    }, version: 1);
  }

  //inserting into db
  Future<void> insertTask(Task task) async {
    final Database db = await initializeDb();
    await db.insert('tasks', task.toMap(),
        conflictAlgorithm:
            ConflictAlgorithm.replace); //will replace any duplicate entry
  }

  //deleting from db
  Future<void> deleteTask(Task task) async {
    final Database db = await initializeDb();
    await db.delete('tasks', where: 'id==?', whereArgs: [task.id]);
  }

  //fetch all tasks
  Future<List<Task>> getTasks() async {
    final Database db = await initializeDb();
    List<Map<String, dynamic>> items =
        await db.query('tasks', orderBy: 'id DESC');
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
}
