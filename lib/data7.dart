import 'dart:math';

import 'package:lingo/game_board4.dart';

class LingoGame7 {
  int rowID = 0;
  int letterID = 0;
  static String game_message = "";
  static String game_guess = "";
  static List<String> sevenLetterWords = [
    "Karınca",
    "Papağan",
    /*"Örümcek",
    "Penguen",
    "Balaban",
    "Pelikan",
    "Kızkuşu",
    "Kukumav",
    "Makarna",
    "Börülce",
    "Domates",
    "Avokado",
    "Brokoli",
    "Dereotu",
    "Ispanak",
    "Muşmula",
    "Kereviz",
    "Patates",
    "Şeftali",
    "Yararlı",
    "Çeşitli",
    "Saygılı",
    "Utangaç",
    "Değişik",
    "Alışkın",
    "Manidar",
    "Dairevi",
    "Gururlu",*/
    "İradeli"
  ];

  static bool gameOver = false;

  static List<Letter7> lingoRow = List.generate(7, (index) => Letter7("", 0));

  List<List<Letter7>> lingoBoard =
      List.generate(7, (index) => List.generate(7, (index) => Letter7("", 0)));

  static void initGame() {
    final random = new Random();
    int index = random.nextInt(sevenLetterWords.length);
    game_guess = sevenLetterWords[index];
  }

  void insertWord(index, word) {
    lingoBoard[rowID][index] = word;
  }

  bool checkWord(String word) {
    return sevenLetterWords.contains(word);
  }
}

class Letter7 {
  String letter;
  int code = 0;

  Letter7(this.letter, this.code);
}
