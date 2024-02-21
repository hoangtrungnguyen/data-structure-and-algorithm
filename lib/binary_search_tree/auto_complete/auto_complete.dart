import 'package:data_structure_and_algorithm/binary_tree/binary_node.dart';

class TextNode {

  String word;
  TextNode? left;
  TextNode? right;

  TextNode(this.word);
}


class BinarySearchTree {
  TextNode? root;

  void insert(String word) {
    root = _insertHelper(root, word);
  }

  TextNode? _insertHelper(TextNode? node, String word) {
    if (node == null) return TextNode(word);

    if (word.compareTo(node.word) < 0) {
      node.left = _insertHelper(node.left, word);
    } else {
      node.right = _insertHelper(node.right, word);
    }
    return node;
  }

  List<String> autocomplete(String prefix) {
    TextNode? currentNode = _findNodeWithPrefix(root, prefix);
    return currentNode == null ? [] : _collectWords(currentNode);
  }

  TextNode? _findNodeWithPrefix(TextNode? node, String prefix) {
    if (node == null) return null;
    if (node.word.startsWith(prefix)) return node;

    if (prefix.compareTo(node.word) < 0) {
      return _findNodeWithPrefix(node.left, prefix);
    } else {
      return _findNodeWithPrefix(node.right, prefix);
    }
  }

  List<String> _collectWords(TextNode node) {
    List<String> words = [];
    _inorderTraversal(node, words);
    return words;
  }

  void _inorderTraversal(TextNode? node, List<String> words) {
    if (node == null)  return;
    _inorderTraversal(node.left, words);
    words.add(node.word);
    _inorderTraversal(node.right, words);
  }
}

void main() {
  var bst = BinarySearchTree();
  bst.insert("hello");
  bst.insert("application");
  bst.insert("apple");
  bst.insert("house");

  print(bst.root);
  var results = bst.autocomplete("app");
  print(results); // Output: ["apple", "application"]
}
