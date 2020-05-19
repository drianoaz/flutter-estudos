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

  @override
  void initState() {
    super.initState();

    _readData();
  }

  void _addToDo() {
    setState(() {
      _toDoList.add({
        "title": newTodoController.text,
        "ok": false,
      });

      newTodoController.clear();
      _saveData();
    });
  }

  void _onToDoChanged(bool checked, int index) {
    setState(() {
      _toDoList[index]["ok"] = checked;
      _saveData();
    });
  }

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      _toDoList.sort((a, b) {
        if (a["ok"] && !b["ok"])
          return 1;
        else if (!a["ok"] && b["ok"])
          return -1;
        else
          return 0;
      });

      _saveData();
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
            child: RefreshIndicator(
              onRefresh: _onRefresh,
              child: ListView.builder(
                itemCount: _toDoList.length,
                itemBuilder: buildItem,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildItem(BuildContext context, index) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      direction: DismissDirection.startToEnd,
      onDismissed: (_) {
        final removedElement = Map.from(_toDoList[index]);
        _toDoList.removeAt(index);

        _saveData();

        final snack = SnackBar(
          content: Text('Tarefa "${removedElement["title"]}" removida!'),
          duration: Duration(seconds: 2),
          action: SnackBarAction(
            label: "Desfazer",
            onPressed: () {
              setState(() {
                _toDoList.insert(index, removedElement);
                _saveData();
              });
            },
          ),
        );

        Scaffold.of(context).showSnackBar(snack);
      },
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      child: CheckboxListTile(
        onChanged: (bool checked) => _onToDoChanged(checked, index),
        title: Text(_toDoList[index]["title"]),
        value: _toDoList[index]["ok"],
        secondary: CircleAvatar(
          child: _toDoList[index]["ok"] ? Icon(Icons.check) : Icon(Icons.error),
        ),
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

  Future<void> _readData() async {
    final file = await _getFile();
    final String data = await file.readAsString();

    setState(() {
      _toDoList = json.decode(data);
    });
  }
}
