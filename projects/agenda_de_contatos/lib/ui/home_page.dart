import 'package:agenda_de_contatos/helpers/contact_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContactHelper helper = ContactHelper();

  @override
  void initState() {
    super.initState();

    final contact = Contact(
        name: "Adriano de Azevedo",
        email: "contato@adriano.dev",
        phone: "11 9 1234-1234",
        img: "teste.jpg");

    helper.saveContact(contact);

    helper.getAllContacts().then((contacts) => {print(contacts)});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
