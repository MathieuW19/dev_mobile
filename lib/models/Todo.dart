import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/pages/AllTodoPage.dart';

class Todo extends StatelessWidget {
  final Function delete;
  final Todos elmt;

  Todo({this.elmt, this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(children: [
      Icon(Icons.keyboard_arrow_right),
      Expanded(
        child: Text(this.elmt.title),
      ),
      IconButton(
        icon: Icon(Icons.edit),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AllTodoPage()),
          );
        },
      ),
      IconButton(
        icon: Icon(Icons.delete),
        onPressed: this.delete,
      ),
    ]));
  }
}

class Todos {
  final String title;
  final String content;
  Todos({this.title, this.content});
}
