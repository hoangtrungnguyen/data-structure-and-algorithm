import 'package:data_structure_and_algorithm/tries/string_trie.dart';
import 'package:test/test.dart';

void main() {
  test("empty", () {
    final trie = StringTrie();
    expect(trie.allStrings(), []);
  });

  test("all string", () {
    final trie = StringTrie();
    trie.insert('car');
    trie.insert('card');
    trie.insert('care');
    trie.insert('cared');
    trie.insert('cars');
    trie.insert('carbs');
    trie.insert('carapace');
    trie.insert('cargo');
    final actual = trie.allStrings();
    expect(actual.contains('cargo'), true);
  });
}
