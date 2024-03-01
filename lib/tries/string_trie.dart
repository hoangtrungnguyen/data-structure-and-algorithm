import 'package:data_structure_and_algorithm/tries/trie_node.dart';

class StringTrie {
  TrieNode<int> root = TrieNode(key: null, parent: null);

  void insert(String text) {
    //1
    var current = root;
    //2
    for (var codeUnit in text.codeUnits) {
      current.children[codeUnit] ??= TrieNode(
        key: codeUnit,
        parent: current,
      );
      current = current.children[codeUnit]!;
    }
    //3
    current.isTerminating = true;
  }

  bool contains(String text) {
    var current = root;

    for (var codeUnit in text.codeUnits) {
      final child = current.children[codeUnit];
      if (child == null) {
        return false;
      }
      current = child;
    }

    return current.isTerminating;
  }

  void remove(String text) {
    var current = root;

    //1 - find the next character
    for (final codeUnit in text.codeUnits) {
      final child = current.children[codeUnit];
      if (child == null) {
        return;
      }
      current = child;
    }

    //2
    //2.1  - If False which means this `text` is a subset of the current trie key
    if (!current.isTerminating) {
      return;
    }
    //2.2
    current.isTerminating = false;

    //3 -
    while (
    //3.1 - Parent is not the root
    current.parent != null &&
        //3.2 - if current
        current.children.isEmpty &&
        //3.3 - is not the last character of the word
        !current.isTerminating) {
      //3.4 - get the parent then remove the node
      current.parent!.children[current.key!] = null;
      current = current.parent!;
    }
  }

  //
  List<String> matchPrefix(String prefix) {
    var current = root;

    for (final codeUnit in prefix.codeUnits) {
      final found =
      current.children[codeUnit]; //move one level down in the tree
      if (found == null) {
        return [];
      }
      current = found;
    }

    return _moreMatches(prefix, current);
  }

  List<String> _moreMatches(String prefix, TrieNode<int> node) {
    List<String> results = [];

    if (node.isTerminating) {
      results.add(prefix);
    }

    for (final child in node.children.values) {
      final codeUnit = child!.key!;
      results.addAll(
          _moreMatches('$prefix${String.fromCharCode(codeUnit)}', child));
    }

    return results;
  }

  int get count {
    int count0 = 0;
    for (final child in root.children.values) {
      count0 += _count(child);
    }
    return count0;
  }

  int _count(TrieNode<int>? node) {
    if (node == null) return 0;
    int count = 0;
    if (node.isTerminating) {
      count += 1;
    }
    for (final child in node.children.values) {
      count += _count(child);
    }
    return count;
  }

  List<String> allStrings() {
    if (isEmpty) return [];
    List<String> result = [];
    for (final child in root.children.values) {
      if(child!.isTerminating){
        result.add(String.fromCharCode(child.key!));
      }
      final allStrings = _allStrings("", child);
      result.addAll(allStrings);
    }
    return result;
  }

  List<String> _allStrings(String prefix, TrieNode<int>? node) {
    if (node == null) return [];
    List<String> result = [];
    if (node.isTerminating) {
      result.add('$prefix${String.fromCharCode(node.key!)}');
    }
    for (final child in node.children.values) {
      result.addAll(
          _allStrings("$prefix${String.fromCharCode(node.key!)}", child));
    }
    return result;
  }


  bool get isEmpty => root.children.isEmpty;

}
