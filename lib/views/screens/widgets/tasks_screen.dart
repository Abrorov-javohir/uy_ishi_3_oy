import 'package:flutter/material.dart';
import 'package:uy_ishi_3_oy/Controller/Task_Controller.dart';
import 'package:uy_ishi_3_oy/model/Task.dart';
import 'package:uy_ishi_3_oy/views/screens/statistic_screen.dart';
import 'package:uy_ishi_3_oy/views/screens/widgets/ListItem.dart';
import 'package:uy_ishi_3_oy/views/screens/widgets/List_Add.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final contactsController = ContactsController();

  void onDelete(int index) {
    contactsController.delete(index);
    setState(() {});
  }

  void onEdit(Contact contact, int index) async {
    Map<String, dynamic>? data = await showDialog(
      context: context,
      builder: (ctx) {
        return ContactEditDialog(contact: contact);
      },
    );

    if (data != null && data['name'] != null && data['task'] != null) {
      contactsController.edit(
        index: index,
        name: data['name'],
        task: data['task'],
        completed: data['completed'],
        reminder: data['reminder'],
      );
      setState(() {});
    }
  }

  void onAdd() async {
    Map<String, dynamic>? data = await showDialog(
      context: context,
      builder: (ctx) {
        return ContactAddDialog();
      },
    );

    if (data != null && data['name'] != null && data['task'] != null) {
      contactsController.add(
          data['name'], data['task'], data['completed'], data['reminder']);
      setState(() {});
    }
  }

  void onViewStatistics() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            StatisticsScreen(contactsController: contactsController),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Contacts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: onAdd,
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Adjust the number of columns
          childAspectRatio: 3 / 2, // Adjust the aspect ratio as needed
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: contactsController.list.length,
        itemBuilder: (ctx, index) {
          final contact = contactsController.list[index];
          return ContactItem(
            contact: contact,
            onDelete: () => onDelete(index),
            onEdit: () => onEdit(contact, index),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StatisticsScreen(
                        contactsController: contactsController),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
