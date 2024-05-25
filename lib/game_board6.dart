import 'package:flutter/material.dart';
import 'package:lingo/data4.dart';
import 'package:lingo/data5.dart';
import 'package:lingo/data6.dart';
import 'package:lingo/data7.dart';

class GameBoard6 extends StatefulWidget {
  GameBoard6(this.game, {Key? key}) : super(key: key);
  LingoGame6 game;

  @override
  State<GameBoard6> createState() => _GameBoard6State();
}

class _GameBoard6State extends State<GameBoard6> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.game.lingoBoard
          .map((e) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: e
                    .map((e) => Container(
                          padding: EdgeInsets.all(16),
                          width: 60,
                          height: 60,
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
