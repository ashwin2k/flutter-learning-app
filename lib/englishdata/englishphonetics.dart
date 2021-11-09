class EnglishPhonetics{
  static Map phonetics={
    "bee":"B",
    "see":"C",
    "sea":"C",
    "Yef":"F",
    "etch":"H",
    "eye":"J",
    "kay":"K",
    "yum":"M",
    "yen":"N",
    "oh":"O",
    "ow":"O",
    "pee":"P",
    "queue":"Q",
    "are":"R",
    "yes":"S",
    "tea":"T",
    "you":"U",
    "we":"V",
    "vee":"V",
    "double you":"W",
    "double u":"W",
    "ex":"X",
    "why":"Y",
    "lizard":"Z",
    "wizard":"Z",
    "zedd":"Z",
    "zee":"Z",
    "zed":"Z",
    "ji":"G",
    "aur":"R",

  };
  static String returnAlphabet(String word){
    if(phonetics.containsKey(word.toLowerCase())) {
      return phonetics[word.toLowerCase()];
    }
    return "-1";
  }
}