import 'package:flutter/material.dart';

class AllTodoPage extends StatelessWidget {
  TextEditingController titleController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Changer la tâche"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: AlertDialog(
        title: Text("Changer le nom de la tâche"),
        content: TextField(
          controller: titleController2,
        ),
      ),
    );
  }
}
