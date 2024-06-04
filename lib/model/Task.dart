class Contact {
  String name;
  String task;
  bool completed;
  bool reminder;

  Contact({required this.name, required this.task, this.completed = false, this.reminder = false});
}
