import 'package:flutter/material.dart';

class SelectBankAccount extends StatefulWidget {
  @override
  _SelectBankAccountState createState() => _SelectBankAccountState();
}

class _SelectBankAccountState extends State<SelectBankAccount> {

  List<String> bankAccounts = ["Conta bancária 1", "Conta bancária 2"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contas bancárias"),
      ),
      body: ListView.builder(
        itemCount: bankAccounts.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(bankAccounts[index]), onTap: () {
              Navigator.of(context).pop(bankAccounts[index]);
            },);
          }
      ),
    );
  }
}
