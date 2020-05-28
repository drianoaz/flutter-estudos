import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String bankAccount;

  Future<void> addBankAccount() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(bankAccount ?? "Sem conta bancária selecionada"),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              child: Text("Selecionar/cadastrar conta bancária"),
              onPressed: addBankAccount,
            )
          ],
        ),
      ),
    );
  }
}
