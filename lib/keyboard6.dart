import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lingo/data4.dart';
import 'package:lingo/data5.dart';
import 'package:lingo/data6.dart';
import 'package:lingo/data7.dart';
import 'package:lingo/game_board4.dart';
import 'package:lingo/game_board6.dart';

class Keyboard6 extends StatefulWidget {
  Keyboard6(this.game, {Key? key}) : super(key: key);

  LingoGame6 game;

  @override
  State<Keyboard6> createState() => _Keyboard6State();
}

class _Keyboard6State extends State<Keyboard6> {
  List row1 = ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P', 'Ğ', 'Ü'];
  List row2 = ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L', 'Ş', 'İ'];
  List row3 = ['<-', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', 'Ö', 'Ç', 'Enter'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(LingoGame6.game_message, style: TextStyle(color: Colors.white)),
        customSizedBox(10),
        GameBoard6(widget.game),
        customSizedBox(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row1.map((e) {
            return InkWell(
              onTap: () {
                print(e);
                if (widget.game.letterID < 6) {
                  setState(() {
                    widget.game.insertWord(widget.game.letterID, Letter6(e, 0));
                    widget.game.letterID++;
                  });
                }
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade800,
                ),
                child: Text(
                  e,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row2.map((e) {
            return InkWell(
              onTap: () {
                print(e);
                if (widget.game.letterID < 6) {
                  setState(() {
                    widget.game.insertWord(widget.game.letterID, Letter6(e, 0));
                    widget.game.letterID++;
                  });
                }
              },
              child: Container(
                padding: EdgeInsets.all(11),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade800,
                ),
                child: Text(
                  e,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row3.map((e) {
            return InkWell(
              onTap: () {
                print(e);
                if (e == "<-") {
                  if (widget.game.letterID > 0) {
                    setState(() {
                      widget.game.letterID--;
                      widget.game
                          .insertWord(widget.game.letterID, Letter6("", 0));
                    });
                  }
                } else if (e == "Enter") {
                  if (widget.game.letterID >= 6) {
                    String guess = widget.game.lingoBoard[widget.game.rowID]
                        .map((e) => e.letter)
                        .join();
                    if (widget.game.checkWord(guess)) {
                      if (guess == LingoGame6.game_guess) {
                        setState(() {
                          LingoGame6.game_message = "Tebrikler bildiniz";
                          widget.game.lingoBoard[widget.game.rowID]
                              .forEach((element) {
                            element.code = 1;
                          });
                        });
                      } else {
                        int listLength = guess.length;
                        bool anyMatch = false;
                        for (int i = 0; i < listLength; i++) {
                          String char = guess[i];
                          if (LingoGame6.game_guess.contains(char)) {
                            anyMatch = true;
                            if (LingoGame6.game_guess[i] == char) {
                              setState(() {
                                widget.game.lingoBoard[widget.game.rowID][i]
                                    .code = 1;
                              });
                            } else {
                              setState(() {
                                widget.game.lingoBoard[widget.game.rowID][i]
                                    .code = 2;
                              });
                            }
                          }
                        }
                        if (!anyMatch) {
                          setState(() {
                            widget.game.rowID++; // Eşleşme yoksa alt satıra geç
                            widget.game.letterID = 0;
                          });
                        }
                      }
                    } else {
                      widget.game
                          .rowID++; // Eğer kelime bulunamazsa alt satıra geç
                      widget.game.letterID = 0;
                      LingoGame5.game_message = "Kelime bulunamadı";
                    }
                  }
                } else {
                  if (widget.game.letterID < 6) {
                    setState(() {
                      widget.game
                          .insertWord(widget.game.letterID, Letter6(e, 0));
                      widget.game.letterID++;
                    });
                  }
                }
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade800,
                ),
                child: Text(
                  e,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget customSizedBox(int num) => SizedBox(height: num.toDouble());
}
