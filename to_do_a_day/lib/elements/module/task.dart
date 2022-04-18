class Task {
  final String name;
  bool isDone = false;
  int priority;
  DateTime? notifacation;
  Task(
      {required this.name,
      this.isDone = false,
      required this.priority,
      this.notifacation});
  void toggleDone() {
    isDone = !isDone;
  }
}
