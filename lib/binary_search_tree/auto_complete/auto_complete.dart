import 'package:data_structure_and_algorithm/binary_tree/binary_node.dart';

import 'dart:convert';
import 'dart:io';

class TextNode {

  String word;
  TextNode? left;
  TextNode? right;

  TextNode(this.word);

  @override
  String toString() {
    return _diagram(this);
  }


  String _diagram(TextNode? node,
      [String top = '', String root = '', String bottom = '']) {
    if (node == null) {
      return '$root null\n';
    }

    if (node.left == null && node.right == null) {
      return '$root ${node.word}\n';
    }

    final a = _diagram(
      node.right,
      '$top ',
      '$top┌──',
      '$top│ ',
    );

    final b = '$root${node.word}\n';

    final c = _diagram(
      node.left,
      '$bottom│ ',
      '$bottom└──',
      '$bottom ',
    );
    return '$a$b$c';
  }
}


class AutoCompletionBinarySearchTree {
  TextNode? root;

  void insert(String word) {
    root = _insertHelper(root, word);
  }

  TextNode? _insertHelper(TextNode? node, String word) {
    if (node == null) return TextNode(word);
    if (word.compareTo(node.word) < 0) {
      node.left = _insertHelper(node.left, word);
    } else if(word.compareTo(node.word) > 0) {
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
    } else if(prefix.compareTo(node.word) > 0){
      return _findNodeWithPrefix(node.right, prefix);
    }
    return node;
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
  @override
  String toString() {
    return '$root';
  }
}

void main() {
  var bst = AutoCompletionBinarySearchTree();
  bst.insert("hello");
  bst.insert("boss");
  bst.insert("ant");
  bst.insert("ant1");
  bst.insert("ant2");
  bst.insert("ant3");
  print(bst);

  // while(true){
  //   print("Enter your key search: ");
  //   var line = stdin.readLineSync(encoding: utf8);
  //   if(line == 'exit'){
  //     exit(0);
  //   }
  //   final result = bst.autocomplete(line!);
  //   print("suggestion");
  //   print(result);
  //   print('');
  // }

}
