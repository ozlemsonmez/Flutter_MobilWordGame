import 'dart:math';

import 'package:lingo/game_board4.dart';

class LingoGame5 {
  int rowID = 0;
  int letterID = 0;
  static String game_message = "";
  static String game_guess = "";
  static List<String> fiveLetterWords = [
    "Masal",
    "Pasta",
    /*"Tavuk",
    "Gelin",
    "Kalem",
    "Kitap",
    "Çanta",
    "Kilit",
    "Fikir",
    "Gözlü",
    "Sebze",
    "Meyve",
    "Kemer",
    "Kumru",
    "Sahne",
    "Şehir",
    "Dünya",
    "Örnek",
    "İzmir",
    "Kayık",
    "Zaman",
    "Sürüm",
    "Yürek",
    "Çiçek",
    "Düşün",
    "Sesli",
    "Konum",*/
    "Yolcu"
  ];

  static bool gameOver = false;

  static List<Letter5> lingoRow = List.generate(5, (index) => Letter5("", 0));

  List<List<Letter5>> lingoBoard =
      List.generate(5, (index) => List.generate(5, (index) => Letter5("", 0)));

  static void initGame() {
    final random = new Random();
    int index = random.nextInt(fiveLetterWords.length);
    game_guess = fiveLetterWords[index];
  }

  void insertWord(index, word) {
    lingoBoard[rowID][index] = word;
  }

  bool checkWord(String word) {
    return fiveLetterWords.contains(word);
  }
}

class Letter5 {
  String letter;
  int code = 0;

  Letter5(this.letter, this.code);
}
