void main(){
  final words = ['done', 'ad', 'eel', 'zoo', 'adept', 'do'];
  print(uniqueCharacters(words));
}

int uniqueCharacters(List<String> words){
  final uniqueChars = <int>{};
  for(final word in words){
     for(final codeUnit in word.codeUnits){
       uniqueChars.add(codeUnit);
     }
  }
  return uniqueChars.length;
}

