import 'package:contacts_app/local_database.dart';
import 'package:flutter/material.dart';

import 'contact.dart';
import 'contact_list.dart';
import 'create_contact_form.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    ScaffoldMessengerState scaffoldMessengerState = ScaffoldMessenger.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      body: const ContactList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // contacts.add("pippo ${contacts.length}");
          Contact contact = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateContactForm()),
          );

          setState(() {
            if (contact.name.trim().isEmpty) {
              scaffoldMessengerState.showSnackBar(
                  const SnackBar(content: Text("Name cannot be empty")));
              return;
            }

            if (contact.number.trim().isEmpty) {
              scaffoldMessengerState.showSnackBar(
                  const SnackBar(content: Text("Number cannot be empty")));
              return;
            }

            LocalDatabase.insert(contact);
            scaffoldMessengerState.showSnackBar(
                SnackBar(content: Text("${contact.name} added!")));
          });
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}