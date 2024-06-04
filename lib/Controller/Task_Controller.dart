import 'package:uy_ishi_3_oy/model/Task.dart';

class ContactsController {
  List<Contact> list = [];

  void add(String name, String task, bool completed, bool reminder) {
    list.add(Contact(name: name, task: task, completed: completed, reminder: reminder));
  }

  void delete(int index) {
    list.removeAt(index);
  }

  void edit({required int index, required String name, required String task, required bool completed, required bool reminder}) {
    list[index] = Contact(name: name, task: task, completed: completed, reminder: reminder);
  }

  int countCompleted() {
    return list.where((contact) => contact.completed).length;
  }

  int countUncompleted() {
    return list.where((contact) => !contact.completed).length;
  }

  int countReminders() {
    return list.where((contact) => contact.reminder).length;
  }
}
