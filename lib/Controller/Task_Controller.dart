import 'package:uy_ishi_3_oy/model/Task.dart';

class ContactsController {
  final List<Contact> _list = [
    Contact(
      name: "Homework",
      task: "+998 90 123 56 67",
    ),
    Contact(
      name: "Jerry",
      task: "+998 90 555 44 33",
    ),
    Contact(
      name: "Spike",
      task: "+998 88 777 66 55",
    ),
    Contact(
      name: "Sherlock Holmes",
      task: "+998 XX XXX XX XX",
    ),
  ];

  List<Contact> get list {
    return [..._list];
  }

  void delete(int index) {
    _list.removeAt(index);
  }

  void add(
    String name,
    String task,
  ) {
    _list.add(Contact(
      name: name,
      task: task,
    ));
  }

  void edit({required int index, required name, required task}) {}
}
