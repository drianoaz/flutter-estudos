import 'package:flutter/material.dart';

import 'add_bank_account.dart';

class SelectBankAccount extends StatefulWidget {
  @override
  _SelectBankAccountState createState() => _SelectBankAccountState();
}

class _SelectBankAccountState extends State<SelectBankAccount> {
  List<String> bankAccounts = ["Conta bancária 1", "Conta bancária 2"];

  Future<void> addBankAccount() async {
    String data = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return AddBankAccount();
        },
      ),
    );

    if (data != null) {
      setState(() {
        bankAccounts.add(data);
      });
    }
  }
  
  onSelect(index) {
    Navigator.of(context).pop(bankAccounts[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contas bancárias"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: addBankAccount,
          )
        ],
      ),
      body: ListView.builder(
          itemCount: bankAccounts.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(bankAccounts[index]),
              onTap: () => onSelect(index),
            );
          }),
    );
  }
}
