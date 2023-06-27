import 'package:flutter/material.dart';

import 'contact.dart';

class CreateContactForm extends StatelessWidget {
  final TextEditingController textNameController = TextEditingController();
  final TextEditingController textNumberController = TextEditingController();

  CreateContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              TextField(
                  controller: textNameController,
                  decoration: const InputDecoration(
                      hintText: "Name", labelText: "Enter the contact name")),
              TextField(
                  controller: textNumberController,
                  decoration: const InputDecoration(
                      hintText: "Number",
                      labelText: "Enter the contact number")),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(
                        context,
                        Contact.simple(textNameController.text,
                            textNumberController.text));
                  },
                  color: Colors.purple,
                  child: const Text(
                    "Add Contact",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}