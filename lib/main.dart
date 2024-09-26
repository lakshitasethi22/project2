import 'package:flutter/material.dart';
import 'package:trainingapp/pages/welcome_page.dart'; // Import the welcome page
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage(), // Use the WelcomePage widget
    );
  }
}
