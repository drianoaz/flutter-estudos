import 'package:flutter/material.dart';

class AddBankAccount extends StatefulWidget {
  @override
  _AddBankAccountState createState() => _AddBankAccountState();
}

class _AddBankAccountState extends State<AddBankAccount> {
  final controller = TextEditingController();
  
  onSave() {
    Navigator.popUntil(context, (route) {
      if(route.isFirst) {
        return true;
      }
      return false;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            const SizedBox(height: 10.0,),
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
