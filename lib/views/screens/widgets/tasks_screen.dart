import 'package:flutter/material.dart';
import 'package:uy_ishi_3_oy/Controller/Task_Controller.dart';
import 'package:uy_ishi_3_oy/model/Task.dart';
import 'package:uy_ishi_3_oy/views/screens/widgets/ListItem.dart';
import 'package:uy_ishi_3_oy/views/screens/widgets/List_Add.dart';
import 'package:uy_ishi_3_oy/views/screens/widgets/task_edit.dart';

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

    if (data != null) {
      contactsController.edit(
        index: index,
        name: data['name'],
        task: data['task'],
      );
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Contacts"),
        actions: [
          IconButton(
            onPressed: () async {
              Map<String, dynamic>? data = await showDialog(
                context: context,
                builder: (ctx) {
                  return const ContactAddDialog();
                },
              );

              if (data != null) {
                contactsController.add(
                  data['name'],
                  data['task'],
                );
                setState(() {});
              }
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contactsController.list.length,
        itemBuilder: (ctx, index) {
          return ContactItem(
              contact: contactsController.list[index],
              onDelete: () {
                onDelete(index);
              },
              onEdit: () {
                onEdit(contactsController.list[index], index);
              });
        },
      ),
    );
  }
}
