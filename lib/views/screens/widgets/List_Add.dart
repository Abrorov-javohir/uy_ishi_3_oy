import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uy_ishi_3_oy/model/Task.dart';

class ContactAddDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController();
    final _taskController = TextEditingController();
    bool _completed = false;
    bool _reminder = false;

    return AlertDialog(
      title: Text('Add Contact'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Name')),
          TextField(controller: _taskController, decoration: InputDecoration(labelText: 'Task')),
          CheckboxListTile(
            title: Text('Completed'),
            value: _completed,
            onChanged: (value) {
              _completed = value!;
            },
          ),
          CheckboxListTile(
            title: Text('Reminder'),
            value: _reminder,
            onChanged: (value) {
              _reminder = value!;
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop({'name': _nameController.text, 'task': _taskController.text, 'completed': _completed, 'reminder': _reminder});
          },
          child: Text('Add'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }
}

class ContactEditDialog extends StatelessWidget {
  final Contact contact;

  ContactEditDialog({required this.contact});

  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController(text: contact.name);
    final _taskController = TextEditingController(text: contact.task);
    bool _completed = contact.completed;
    bool _reminder = contact.reminder;

    return AlertDialog(
      title: Text('Edit Contact'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Name')),
          TextField(controller: _taskController, decoration: InputDecoration(labelText: 'Task')),
          CheckboxListTile(
            title: Text('Completed'),
            value: _completed,
            onChanged: (value) {
              _completed = value!;
            },
          ),
          CheckboxListTile(
            title: Text('Reminder'),
            value: _reminder,
            onChanged: (value) {
              _reminder = value!;
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop({'name': _nameController.text, 'task': _taskController.text, 'completed': _completed, 'reminder': _reminder});
          },
          child: Text('Save'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }
}
