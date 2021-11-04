import 'dart:math';

class EnglishPracticeResoruces{
  String alphabet;
  String word;
  String resource;

  EnglishPracticeResoruces(this.alphabet,this.word,this.resource);

  static List<EnglishPracticeResoruces> questions=[
    EnglishPracticeResoruces("A", "Apple", "apple.jpg"),
    EnglishPracticeResoruces("B", "Ball", "ball.png"),
    EnglishPracticeResoruces("C", "Cat", "cat.jpg"),
    EnglishPracticeResoruces("D", "Dog", "dog.jpg"),
    EnglishPracticeResoruces("E", "Elephant", "elphant.jpg"),
    EnglishPracticeResoruces("F", "Fish", "fish.jpg"),
    EnglishPracticeResoruces("G", "Grape", "grapes.jpg"),
    EnglishPracticeResoruces("H", "Hen", "hen.jpg"),
    EnglishPracticeResoruces("I", "Ice cream", "icream.jpg"),
    EnglishPracticeResoruces("J", "Jug", "jug.jpg"),
    EnglishPracticeResoruces("K", "Kite", "kite.jpg"),
    EnglishPracticeResoruces("L", "Lion", "lion.jpg"),
    EnglishPracticeResoruces("M", "Monkey", "monkey.jpg"),
    EnglishPracticeResoruces("N", "Nest", "nest.jpeg"),
    EnglishPracticeResoruces("O", "orange", "orange.jpg"),
    EnglishPracticeResoruces("P", "Peacock", "peacock.jpg"),
    EnglishPracticeResoruces("Q", "Queen", "queen.jpg"),
    EnglishPracticeResoruces("R", "Rose", "rose.jpg"),
    EnglishPracticeResoruces("S", "Swan", "swan.jpg"),
    EnglishPracticeResoruces("T", "Telephone", "telephone.jpg"),
    EnglishPracticeResoruces("U", "Umbrella", "umbrella.jpeg"),
    EnglishPracticeResoruces("V", "Van", "van.jpg"),
    EnglishPracticeResoruces("W", "Watch", "watch.jpg"),
    EnglishPracticeResoruces("X", "Xylaphone", "xylaphone.jpg"),
    EnglishPracticeResoruces("Y", "Yatch", "yatch.jpg"),
    EnglishPracticeResoruces("Z", "Zebra", "zebra.jpg"),

  ];
  static EnglishPracticeResoruces getRandomAlphabet(){
    var rng = new Random();
    // print(rng.nextInt(26));
    return questions[rng.nextInt(26)];

  }
}