import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _toDoList = [];

  final newTodoController = TextEditingController();

  void _addToDo() {
    setState(() {
      _toDoList.add({
        "title": newTodoController.text,
        "ok": false,
      });

      newTodoController.clear();
    });
  }

  void _onToDoChanged(bool checked, int index) {
    setState(() {
      _toDoList[index]["ok"] = checked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Lista de tarefas"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: newTodoController,
                    decoration: InputDecoration(
                      labelText: "Nova tarefa",
                      labelStyle: TextStyle(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
                RaisedButton(
                  color: Colors.blueAccent,
                  child: Text("Add"),
                  textColor: Colors.white,
                  onPressed: _addToDo,
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _toDoList.length,
              itemBuilder: (BuildContext context, index) {
                return CheckboxListTile(
                  onChanged: (bool checked) => _onToDoChanged(checked, index),
                  title: Text(_toDoList[index]["title"]),
                  value: _toDoList[index]["ok"],
                  secondary: CircleAvatar(
                    child: _toDoList[index]["ok"]
                        ? Icon(Icons.check)
                        : Icon(Icons.error),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> _saveData() async {
    final String data = json.encode(_toDoList);
    final File file = await _getFile();

    return file.writeAsString(data);
  }

  Future<String> _readData() async {
    final file = await _getFile();
    return file.readAsString();
  }
}
