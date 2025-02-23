bool compareWordsLexicographically(String word1, String word2) {
  return word1.compareTo(word2) < 0;
}

void main() {
  print(compareWordsLexicographically("humble", "house"));  // True
  print(compareWordsLexicographically("humble", "house"));  // True
  print(compareWordsLexicographically("humble", "house"));  // True
  print(compareWordsLexicographically("hello", "world"));   // False
}