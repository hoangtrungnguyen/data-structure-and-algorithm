import 'package:data_structure_and_algorithm/tries/string_trie.dart';
import 'package:test/test.dart';

void main(){

  test("Count all String", (){
    final trie = StringTrie();
    trie.insert('car');
    trie.insert('card');
    trie.insert('care');
    trie.insert('cared');
    trie.insert('cars');
    trie.insert('carbs');
    trie.insert('carapace');
    trie.insert('cargo');
    final actual = trie.count;
    print('count - ${actual}');
    expect(actual, 8);
  });
}