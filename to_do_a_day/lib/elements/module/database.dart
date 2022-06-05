import 'package:sqflite/sqflite.dart';
import 'package:to_do_a_day/elements/module/task.dart';
import 'package:path/path.dart';

late Database db;

class TodoProvider {
  static final TodoProvider _todoProvider = TodoProvider();
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    //Initialize the DB first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    //set the path to the database using join fron path.dart
    final path = join(databasePath, 'flutter_sqflite_database.db');

    //set the version this excutes the oncreate function from the path to preform database upgrades and downgrades
    return await openDatabase(path,
        onCreate: _onCreate,
        version: 2,
        onConfigure: (db) async => await db.execute('PRAGMA foreign_keys=ON'));
  }

//when database is first created, create table to store the tasks
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
create table Task ( 
  id integer primary key autoincrement, 
  name text not null,
 isDone int not null,
   priority integer not null,
   notifiction TEXT ,
   isArchived int not null,
   creationDate  INTEGER DEFAULT (cast(srtftime('%s','now'))) not null
  )
''');
  }

  Future<List<Task>> getTodo() async {
    final db = await _todoProvider.database;

    //query the table of task, will get all tasks
    List<Map<String, dynamic>> maps =
        await db.query('Task', orderBy: 'id DESC');
    //convert list<map<String,dynamic>> into a list<Task>

    return List.generate(maps.length, (index) => Task.fromMap(maps[index]));
  }

//   Future open(String path) async {
//     db = await openDatabase(path, version: 1,
//         onCreate: (Database db, int version) async {
//       await db.execute('''
// create table Task (
//   id integer primary key autoincrement,
//   name text not null,
//  isDone bool not null,
//    priority integer not null,
//    notifiction timeStamp ,
//    isArchived bool not null,
//    creationDate timeStamp not null
//   )
// ''');
//     });
//   }

  // static Future<List<Task>> getTodo() async {
  //   final db = await _todoProvider.database;

  //   //query the table of task, will get all tasks
  //   List<Map<String, dynamic>> maps = await db.query('Task');
  //   //convert list<map<String,dynamic>> into a list<Task>

  //   return List.generate(maps.length, (index) => Task.fromMap(maps[index]));
  // }

  // Future<Task> getTodo(int id) async {
  //   List<Map> maps = await db.query(tableTodo,
  //       columns: [columnId, columnDone, columnTitle],
  //       where: '$columnId = ?',
  //       whereArgs: [id]);

  //   return Task.fromMap(maps.first);
  // }

  Future<int> delete(int id) async {
    return await db.delete(tableTodo, where: '$columnId = ?', whereArgs: [id]);
  }

  // Future<int> update(Task todo) async {
  //   return await db.update(tableTodo, todo.toMap(),
  //       where: '$columnId = ?', whereArgs: [todo.id]);
  // }

  Future close() async => db.close();
}
