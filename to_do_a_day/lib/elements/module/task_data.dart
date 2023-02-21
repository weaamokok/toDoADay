import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icon.dart';
import 'package:provider/provider.dart';
import 'package:to_do_a_day/elements/widgets/taskTile.dart';
import '../../screens/task_screen.dart';
import '../const.dart';
import 'task.dart';
import 'dart:collection';
import 'package:to_do_a_day/elements/module/databaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskData extends ChangeNotifier {
  final db = DatabaseHandler();
  String userImage = 'images/Stuck at Home - Avatar.png';

  DateTime morningAlert = DateTime(DateTime.now().year, DateTime.now().month,
      DateTime.now().day, 07, 00, 00);
  String? name;
  // ignore: prefer_final_fields
  List<Task> tasks = [
    // Task(name: 'nme', priority: 1),
    // Task(name: 'ame', priority: 1)
  ];
  var len;
  var archlen;
  List<List<Task>> _taskArchive = [];
  final fireStore = FirebaseFirestore.instance;
//update Image
  updateImage(isFemale) {
    userImage = isFemale == true
        ? 'images/Stuck at Home - Avatar.png'
        : 'images/Stuck at Home Avatar.png';
    notifyListeners();
  }
  // List<List<Task>> deserializedLists=_taskArchive.;

  UnmodifiableListView<Task> get tasksy {
    return UnmodifiableListView(
        tasks); //to prevent any modifiing on the list of tasks
  }

  UnmodifiableListView<List<Task>> get archivesTasks {
    return UnmodifiableListView(
        _taskArchive); //to prevent any modifiing on the list of tasks
  }

  // Future<List<Task>> getTasks() async {
  //   List<Task> tasks = await db.getTasks();
  //   notifyListeners();
  //   return tasks;
  // }
  getName() async {
    this.name = await db.getname();

    setName(await db.getname());
    print('----------------');
    print(this.name);
    notifyListeners();
    return name;
  }

  void addName(addedName) {
    name = addedName;
    notifyListeners();
    db.addName(addedName);
  }

  setName(name) => this.name = name;

  void updateName(addedName) {
    setName(addedName);
    notifyListeners();
    db.nameUpdate(addedName);
  }

  void addTask(String name, bool isDone, int priority, DateTime? notifacation,
      bool isArchives, DateTime creationTime) {
    final task = Task(
        name: name,
        priority: priority,
        isDone: false,
        notifacation: notifacation,
        isArchived: false,
        creationTime: CurrentDate);
    Tasks.add(task);
    notifyListeners();
    db.insertTask(task);
  }

  void update(String name, bool isDone, int priority, DateTime? notifacation,
      bool isArchives, DateTime creationTime) {
    final task = Task(
        name: name,
        priority: priority,
        isDone: false,
        notifacation: notifacation,
        isArchived: false,
        creationTime: CurrentDate);
    Tasks.add(task);
    notifyListeners();
    db.insertTask(task);
  }

  void resetPriority() {
    gPriority = conActPriorityG;
    rPriority = conActPriorityR;
    yPriority = conActPriorityY;
  }

  void timerForArchive(context) {
    DateFormat formator = DateFormat('yyyy-MM-dd');
    // String formated = formator.format(DateTime(
    //   CurrentDate.year,
    //   CurrentDate.month,
    //   CurrentDate.day + 1,
    // ));
    String formated = formator.format(DateTime.now());

    DateTime timetoArch = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day + 1, 00, 00, 00);

    if (DateTime.now().compareTo(timetoArch) <= 0) {
      //here I cpompare btween the date time now and the midnigh
      notifyListeners();
      db.archivingTasks();
    }
  }

  void ArchivingFunctionality() {
    db.archivingTasks();
    notifyListeners();
  }

//TODO find hoe to make it archive once a day
  void ArchiveEmpty() {
    db.EmptyArchive();
    notifyListeners();
  }

  void updateTask(Task task) {
    task.isDone = !task.isDone;
    notifyListeners();
    db.DoneUpdate(task);
  }

  void deletingTask(Task task) {
    tasks.remove(task);
    notifyListeners();
    db.deleteTask(task);
  }

  int? countinarchiveLen() {
    int? archiveLen;
    archivesTasks
        .map((taskList) => taskList)
        .map((tasks) => tasks)
        .map((element) => {
              () {
                archiveLen! + 1;
              }
            });

    return archiveLen;
  }
}

void selectedPage() {}
