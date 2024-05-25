import 'dart:math';

import 'package:lingo/game_board4.dart';

class LingoGame4 {
  int rowID = 0;
  int letterID = 0;
  static String game_message = "";
  static String game_guess = "";
  static List<String> fourLetterWord = [
    "Elma",
    "Arzu",
    "Baba",
    /*"Adam",
    "Kedi",
    "Anaç",
    "Koku",
    "Gemi",
    "Gaye",
    "Kupa",
    "Fena",
    "Kuma",
    "Hava",
    "Kuzu",
    "Dost",
    "Kaya",
    "Kara",
    "Para",
    "Yara",
    "Evde",
    "Sava",
    "Veda",
    "Yava",
    "Deri",
    "Dere",
    "Vefa",
    "Yola",
    "Asma",
    "Cema",
    "Çare",
    "Yama",*/
    "Süre"
  ];

  static List<String> fourLetterWords =
      fourLetterWord.map((word) => word.toUpperCase()).toList();

  static bool gameOver = false;

  static List<Letter4> lingoRow = List.generate(4, (index) => Letter4("", 0));

  List<List<Letter4>> lingoBoard =
      List.generate(4, (index) => List.generate(4, (index) => Letter4("", 0)));

  static void initGame() {
    final random = new Random();
    int index = random.nextInt(fourLetterWords.length);
    game_guess = fourLetterWords[index];
  }

  void insertWord(index, word) {
    lingoBoard[rowID][index] = word;
  }

  bool checkWord(String word) {
    return fourLetterWords.contains(word);
  }
}

class Letter4 {
  String letter;
  int code = 0;

  Letter4(this.letter, this.code);
}
