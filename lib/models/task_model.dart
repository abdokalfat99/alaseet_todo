class TaskModel {
  String title;
  String decsreption;
  DateTime createdAt;
  bool isDone;

  TaskModel(
      {required this.title,
      required this.decsreption,
      required this.createdAt,
      this.isDone = false});
}
