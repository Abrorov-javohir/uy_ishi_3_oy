import 'package:flutter/material.dart';
import 'package:uy_ishi_3_oy/model/Task.dart';

class ContactItem extends StatefulWidget {
  final Contact contact;
  final Function() onDelete;
  final Function() onEdit;

  const ContactItem({
    super.key,
    required this.contact,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  _ContactItemState createState() => _ContactItemState();
}

class _ContactItemState extends State<ContactItem> {
  bool isTicked = false;

  void CheckTick() {
    setState(() {
      isTicked = !isTicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.contact.name),
      subtitle: Text(widget.contact.task),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: CheckTick,
            icon: Icon(
              isTicked ? Icons.check_box : Icons.check_box_outline_blank,
              color: Colors.green,
            ),
          ),
          IconButton(
            onPressed: () {
              widget.onDelete();
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
