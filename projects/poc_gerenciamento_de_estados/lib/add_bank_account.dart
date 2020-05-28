import 'package:flutter/material.dart';

class AddBankAccount extends StatefulWidget {
  @override
  _AddBankAccountState createState() => _AddBankAccountState();
}

class _AddBankAccountState extends State<AddBankAccount> {

  final controller = TextEditingController();
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  onSave() {
    if(controller.text != null && controller.text.isNotEmpty) {
      Navigator.of(context).pop(controller.text);
    } else {

      final snack = SnackBar(
        content: Text("Não pode ser vazio"),
      );

      key.currentState.showSnackBar(snack);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text("Adicionar conta bancária"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: "Conta bancária",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              child: Text("Salvar"),
              onPressed: onSave,
            ),
          ],
        ),
      ),
    );
  }
}
