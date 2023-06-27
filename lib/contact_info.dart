import 'package:flutter/material.dart';

import 'contact.dart';

class ContactInfo extends StatelessWidget {
  final Contact contact;

  const ContactInfo(this.contact, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100,
                child: Text(
                  contact.name[0].toUpperCase()[0],
                  style: const TextStyle(fontSize: 50),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  contact.name,
                  style: const TextStyle(fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  contact.number,
                  style: const TextStyle(fontSize: 20, color: Colors.blueGrey),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}