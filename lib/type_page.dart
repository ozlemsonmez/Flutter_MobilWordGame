import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lingo/game_page.dart';

class TypePage extends StatefulWidget {
  const TypePage({Key? key}) : super(key: key);

  @override
  State<TypePage> createState() => _TypeState();
}

class _TypeState extends State<TypePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: height * 0.25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/logo.png'),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customSizedBox(20),
                    titleText(),
                    customSizedBox(50),
                    typeButton(4),
                    customSizedBox(20),
                    typeButton(5),
                    customSizedBox(20),
                    typeButton(6),
                    customSizedBox(20),
                    typeButton(7),
                    customSizedBox(80),
                    exitButton(),
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }

  Center typeButton(int gameType) {
    String num = gameType.toString();
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => GamePage(gameType: gameType)));
        },
        child: Text(num + " Harfli Oyun"),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber[400],
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          textStyle: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  Widget customSizedBox(int num) => SizedBox(height: num.toDouble());

  Text titleText() {
    return Text(
      "Lütfen oynamak istediğiniz oyun \ntipini seçin",
      style: TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Center exitButton() {
    return Center(
        child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: Text(
              "Çıkış Yap",
              style: TextStyle(color: Colors.yellow),
            )));
  }
}
