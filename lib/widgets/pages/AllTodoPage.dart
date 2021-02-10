import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/pages/MyHomePage.dart';

class AllTodoPage extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
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
          controller: titleController,
          decoration: const InputDecoration(hintText: 'Saisir la tâche'),
        ),
        actions: <Widget>[
          FlatButton(
            child: const Text('Ajouter'),
            onPressed: () {
              //code pour mettre à jour le nom de la tâche
            },
          ),
          FlatButton(
            child: const Text('Annuler'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
