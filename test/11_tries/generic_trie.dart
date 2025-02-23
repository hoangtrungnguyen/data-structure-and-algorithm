import 'package:data_structure_and_algorithm/dsa/tries/trie.dart';
import 'package:test/test.dart';

void main() {
  group('insert', () {
    test('normal case', () {
      final trie = Trie<String, List<String>>();
      trie.insert([
        'car'
            'card'
            'care'
            'cared'
            'cars'
            'carbs'
            'carapace'
            'cargo'
      ]);

      trie.insert([
        'car'
            'card'
            'care'
            'cared'
            'cars'
            'carbs'
            'carapace'
            'cargo'
      ]);
    });
  });
}
