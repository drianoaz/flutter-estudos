import 'package:flutter/material.dart';
import 'package:poc_gerenciamento_de_estados/select_bank_account.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String bankAccount;

  Future<void> addBankAccount() async {
    String data = await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return SelectBankAccount();
      }
    ));

    if(data != null) {
      setState(() {
        bankAccount = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
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
