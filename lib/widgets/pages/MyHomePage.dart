import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/Todo.dart';
import 'package:flutter_application_1/data/todos.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.todos});
  final List<Todo> todos;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODOLIST"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          SizedBox(
            height: 600,
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, i) {
                final element = todos[i];
                return Todo(
                  elmt: element,
                  delete: () {
                    setState(() {
                      todos.removeAt(i);
                    });
                  },
                );
              },
              shrinkWrap: true,
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: FloatingActionButton(
          onPressed: () => _displayDialog(context),
          tooltip: 'Ajouter une tâche',
          backgroundColor: Colors.red,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  void _addTodoItem(String title) {
    setState(() {
      Todos elmt = new Todos(
          title: titleController.text, content: contentController.text);
      todos.add(elmt);
    });
    titleController.clear();
  }

  Future<AlertDialog> _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Ajouter une tâche à votre liste'),
            content: TextField(
              controller: titleController,
              decoration: const InputDecoration(hintText: 'Saisir la tâche'),
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('Ajouter'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _addTodoItem(titleController.text);
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
        });
  }
}
