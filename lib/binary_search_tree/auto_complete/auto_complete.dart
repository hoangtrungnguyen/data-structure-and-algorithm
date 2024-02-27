import 'dart:math' as math;

class TextNode {
  String word;
  TextNode? left;
  TextNode? right;

  TextNode(this.word);

  int get balanceFactor => leftHeight - rightHeight;

  int get leftHeight => left?.height ?? -1;

  int get rightHeight => right?.height ?? -1;

  int height = 0;

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

    final b =
        '$root${node.word}\n';

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
    } else if (word.compareTo(node.word) > 0) {
      node.right = _insertHelper(node.right, word);
    }
    final balancedNode = balanced(node);
    balancedNode.height =
        1 + math.max(balancedNode.leftHeight, balancedNode.rightHeight);
    return balancedNode;
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
    } else if (prefix.compareTo(node.word) > 0) {
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
    if (node == null) return;
    _inorderTraversal(node.left, words);
    words.add(node.word);
    _inorderTraversal(node.right, words);
  }

  @override
  String toString() {
    return '$root';
  }

  TextNode leftRotate(TextNode node) {
    final pivot = node.right!;
    node.right = pivot.left;
    pivot.left = node;

    node.height = 1 + math.max(node.leftHeight, node.rightHeight);
    pivot.height = 1 + math.max(pivot.leftHeight, node.rightHeight);
    return pivot;
  }

  TextNode rightRotate(TextNode node) {
    final pivot = node.left!;
    node.left = pivot.right;
    pivot.right = node;

    node.height = 1 + math.max(node.leftHeight, node.rightHeight);
    pivot.height = 1 + math.max(pivot.leftHeight, node.rightHeight);
    return pivot;
  }

  TextNode rightLeftRotate(TextNode node) {
    if (node.right == null) return node;
    node.right = rightRotate(node.right!);
    return leftRotate(node);
  }

  TextNode leftRightRotate(TextNode node) {
    if (node.left == null) return node;
    node.left = leftRotate(node.left!);
    return rightRotate(node);
  }

  TextNode balanced(TextNode node) {
    switch (node.balanceFactor) {
      case 2:
        final left = node.left;
        if (left != null && left.balanceFactor == -1) {
          return leftRightRotate(node);
        } else {
          return rightRotate(node);
        }
      case -2:
        final right = node.right;
        if (right != null && right.balanceFactor == 1) {
          return rightLeftRotate(node);
        } else {
          return leftRotate(node);
        }
      default:
        return node;
    }
  }
}

void main() {
  var bst = AutoCompletionBinarySearchTree();
  bst.insert('5');
  bst.insert('8');
  bst.insert('0');
  bst.insert('9');
  bst.insert('32');
  bst.insert("1");
  bst.insert("13");
  bst.insert("12");
  bst.insert("43");
  bst.insert("76");
  bst.insert("46");
  print(bst);

}
