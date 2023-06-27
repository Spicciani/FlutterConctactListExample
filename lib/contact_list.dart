import 'package:contacts_app/local_database.dart';
import 'package:flutter/material.dart';

import 'contact.dart';
import 'contact_info.dart';

class ContactList extends StatefulWidget {
  const ContactList({
    super.key
  });

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Contact>>(
        future: LocalDatabase.contacts(),
        builder: (context, snapshot) {
          List<Contact>? dataList = snapshot.data;
          if(dataList == null) return ListView();

          return snapshot.hasData
              ? ListView.builder(
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ContactInfo(dataList[index])),
                          );
                        },
                        leading: CircleAvatar(
                          child: Text(
                              dataList[index].name.toUpperCase()[0]),
                        ),
                        title: Text(dataList[index].name),
                        subtitle: Text(dataList[index].number),
                        trailing: IconButton(
                          onPressed: () {
                            showConfirmitionDialog(context, () {
                              setState(() {
                                // widget.contacts.removeAt(index);
                                LocalDatabase.deleteContact(dataList[index]);
                              });
                            });
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ),
                    );
                  },
                )
              : const Center(child: CircularProgressIndicator());
        });
  }

  showConfirmitionDialog(BuildContext context, Function confirmFunc) {
    // set up the buttons
    Widget cancelButton = MaterialButton(
      child: const Text("Cancel"),
      onPressed: () {},
    );
    Widget continueButton = MaterialButton(
      child: const Text("Delete"),
      onPressed: () {
        confirmFunc();
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Contact deleting"),
      content: const Text("Are you sure you want to delete this contact?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
