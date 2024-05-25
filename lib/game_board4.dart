import 'package:flutter/material.dart';
import 'package:lingo/data4.dart';
import 'package:lingo/data5.dart';
import 'package:lingo/data6.dart';
import 'package:lingo/data7.dart';

class GameBoard4 extends StatefulWidget {
  GameBoard4(this.game, {Key? key}) : super(key: key);
  LingoGame4 game;

  @override
  State<GameBoard4> createState() => _GameBoard4State();
}

class _GameBoard4State extends State<GameBoard4> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.game.lingoBoard
          .map((e) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: e
                    .map((e) => Container(
                          padding: EdgeInsets.all(16),
                          width: 64,
                          height: 64,
                          margin: EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: e.code == 0
                                ? Colors.grey.shade800
                                : e.code == 1
                                    ? Colors.green.shade400
                                    : Colors.amber.shade400,
                          ),
                          child: Center(
                            child: Text(
                              e.letter!,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ))
          .toList(),
    );
  }
}
