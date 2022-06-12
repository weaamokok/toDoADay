class Task {
  int? id;
  final String name;
  bool isDone;
  int priority;
  var notifacation;
  bool isArchived;
  var creationTime;

  Task(
      {this.id,
      required this.name,
      this.isDone = false,
      required this.priority,
      this.notifacation,
      this.isArchived = false,
      required this.creationTime});

//convrting to map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isDone': isDone ? 1 : 0,
      'priority': priority,
      'notification': notifacation.toString(),
      'isArchived': isArchived ? 1 : 0,
      'creationTime': creationTime.toString()
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
        id: map['id'],
        name: map['name'],
        isDone: map['isDone'],
        priority: map['priority'],
        notifacation: map['notification'],
        isArchived: map['isArchived'],
        creationTime: map['creationTime']);
  }

  void toggleDone() {
    isDone = !isDone;
    //for checkbox
  }

  void toggleArchive() {
    isArchived = !isArchived;
  }
}
