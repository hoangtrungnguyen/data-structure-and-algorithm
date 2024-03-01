import 'trie_node.dart';

class Trie<E, T extends Iterable<E>>{
  TrieNode<E> root = TrieNode(key: null, parent: null);

  void insert(T data) {
    //1
    var current = root;
    //2
    for (var codeUnit in data) {
      current.children[codeUnit] ??= TrieNode(
        key: codeUnit,
        parent: current,
      );
      current = current.children[codeUnit]!;
    }
    //3
    current.isTerminating = true;
  }

  bool contains(T collection) {
    var current = root;
    for (var element in collection) {
      final child = current.children[element];
      if (child == null) {
        return false;
      }
      current = child;
    }
    return current.isTerminating;
  }


}