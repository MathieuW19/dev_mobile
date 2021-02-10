import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/pages/MyHomePage.dart';

class Todo extends StatelessWidget {
  final Function delete;
  final Todos elmt;
  TextEditingController titleController2 = TextEditingController();
  Todo({this.elmt, this.delete});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text(this.elmt.title),
          subtitle: Text(this.elmt.content),
          trailing: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.delete,
                ),
                onPressed: this.delete,
              ),
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  return AlertDialog(
                    title: Text("Changer le nom de la tâche"),
                    content: TextField(
                      controller: titleController2,
                      decoration: const InputDecoration(
                          hintText: 'Saisir le nouveau nom de la tâche'),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: const Text('Changer'),
                        onPressed: () {
                          Navigator.of(context).pop();
                          //editTodo(titleController2.text);
                        },
                      ),
                      FlatButton(
                        child: const Text('Annuler'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  );

                  /*Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AllTodoPage()),
          );*/
                },
              ),
            ],
          )),
    ]);
  }
}

class Todos {
  final String title;
  final String content;
  bool done;
  Todos({this.title, this.content, this.done});
}
