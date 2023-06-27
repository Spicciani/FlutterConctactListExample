import 'package:contacts_app/local_database.dart';
import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  LocalDatabase.initialize();
  runApp(const ContactApp());
}

class ContactApp extends StatelessWidget {
  const ContactApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(home: Home());
}