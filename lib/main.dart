import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lingo/firebase_options.dart';
import 'package:lingo/game_page.dart';
import 'package:lingo/login_page.dart';
import 'package:lingo/sign_up.dart';
import 'package:lingo/type_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lingo',
      routes: {
        '/signUp': (context) => SignUpPage(),
        '/login': (context) => LoginPage(),
        '/type': (context) => TypePage(),
        // '/game': (context) => GamePage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}
