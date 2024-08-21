import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:giggle_chat_app/firebase_options.dart';
import 'package:giggle_chat_app/screens/chat_page.dart';
import 'package:giggle_chat_app/screens/login_page.dart';
import 'package:giggle_chat_app/screens/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        RegisterPage.id: (context) => RegisterPage(),
        ChatPage.id: (context) => ChatPage(),
        LoginPage.id: (context) => LoginPage(),
      },
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
