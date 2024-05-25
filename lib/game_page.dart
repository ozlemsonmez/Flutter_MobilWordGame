import 'package:flutter/material.dart';
import 'package:lingo/data5.dart';
import 'package:lingo/data6.dart';
import 'package:lingo/data7.dart';
import 'package:lingo/keyboard4.dart';
import 'package:lingo/data4.dart';
import 'package:lingo/keyboard5.dart';
import 'package:lingo/keyboard6.dart';
import 'package:lingo/keyboard7.dart';
import 'package:lingo/type_page.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key, required this.gameType}) : super(key: key);

  final int gameType;

  @override
  State<GamePage> createState() => _GameState();
}

class _GameState extends State<GamePage> {
  LingoGame4 _game4 = LingoGame4();
  LingoGame5 _game5 = LingoGame5();
  LingoGame6 _game6 = LingoGame6();
  LingoGame7 _game7 = LingoGame7();

  @override
  void initState() {
    super.initState();
    LingoGame4.initGame();
    LingoGame5.initGame();
    LingoGame6.initGame();
    LingoGame7.initGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          lingoText(),
          if (widget.gameType == 4) Keyboard4(_game4),
          if (widget.gameType == 5) Keyboard5(_game5),
          if (widget.gameType == 6) Keyboard6(_game6),
          if (widget.gameType == 7) Keyboard7(_game7),
          customSizedBox(10),
          backButton(),
        ],
      ),
    );
  }

  Center backButton() {
    return Center(
        child: TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => TypePage()));
            },
            child: Text(
              "Geri Dön",
              style: TextStyle(color: Colors.yellow),
            )));
  }

  Text lingoText() {
    return Text(
      "Lingo",
      style: TextStyle(
          color: Colors.yellow, fontSize: 30, fontWeight: FontWeight.bold),
    );
  }

  Widget customSizedBox(int num) => SizedBox(height: num.toDouble());
}
