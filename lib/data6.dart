import 'dart:math';

import 'package:lingo/game_board4.dart';

class LingoGame6 {
  int rowID = 0;
  int letterID = 0;
  static String game_message = "";
  static String game_guess = "";
  static List<String> sixLetterWords = [
    "Kartal",
    "Kapıcı",
    /*"Gözlem",
    "Gececi",
    "Yalnız",
    "Talebe",
    "Kuvvet",
    "Başarı",
    "Şahane",
    "Anımsa",
    "Umutlu",
    "Zorluk",
    "Kazanç",
    "Hikaye",
    "Meydan",
    "Kamera",
    "Yapmak",
    "Gönder",
    "Kurban",
    "Hatıra",*/
    "Sistem"
  ];

  static bool gameOver = false;

  static List<Letter6> lingoRow = List.generate(6, (index) => Letter6("", 0));

  List<List<Letter6>> lingoBoard =
      List.generate(6, (index) => List.generate(6, (index) => Letter6("", 0)));

  static void initGame() {
    final random = new Random();
    int index = random.nextInt(sixLetterWords.length);
    game_guess = sixLetterWords[index];
  }

  void insertWord(index, word) {
    lingoBoard[rowID][index] = word;
  }

  bool checkWord(String word) {
    return sixLetterWords.contains(word);
  }
}

class Letter6 {
  String letter;
  int code = 0;

  Letter6(this.letter, this.code);
}
