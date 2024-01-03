import 'dart:math' as math;

import 'package:data_structure_and_algorithm/binary_tree/binary_node.dart';

void main() {
  // getHeight(createBinaryTree());
  // print(serialize(SerializeTreeCases.normal()).map((e) => e.toString()).join(', '));
  print(deserialize(DeserializeTreeCases.normal()).toString());
}

// 1. Height of the tree
void getHeight<T>(BinaryNode<T> tree) {
  int helper(BinaryNode<T>? node) {
    if (node == null) {
      return 0;
    }
    final leftHeight = 1 + helper(node.leftChild);
    final rightHeight = 1 + helper(node.rightChild);
    return math.max(leftHeight, rightHeight);
  }

  print(helper(tree));
}

// 2. Serialization
List<T?> serialize<T>(BinaryNode<T> tree) {
  List<T?> data = [];
  void helper(BinaryNode<T>? tree) {
    data.add(tree?.value);
    if (tree == null) {
      return;
    }
    helper(tree.leftChild);
    helper(tree.rightChild);
  }

  helper(tree);
  return data;
}

class _Holder {
  bool addedLeft = false;
  bool addedRight = false;
  BinaryNode? node;

  _Holder({
    this.node,
  });

  @override
  String toString() {
    return '_Holder{addedLeft: $addedLeft, addedRight: $addedRight, node: $node}';
  }
}

// Think about Pre-Order Traversal
BinaryNode<T>? deserialize<T>(List<T?> data) {
  if (data.isEmpty) {
    return null;
  }
  final value = data.removeAt(0);
  if (value == null) {
    return null;
  }
  BinaryNode<T> node = BinaryNode<T>(value);
  node.leftChild = deserialize(data);
  node.rightChild = deserialize(data);
  return node;
}

BinaryNode<int> createBinaryTree() {
  final zero = BinaryNode(0);
  final one = BinaryNode(1);
  final five = BinaryNode(5);
  final seven = BinaryNode(7);
  final eight = BinaryNode(8);
  final nine = BinaryNode(9);
  final a1 = BinaryNode(12);
  final a2 = BinaryNode(122);
  a1.leftChild = a2;
  final a3 = BinaryNode(152);
  a2.leftChild = a3;
  final a4 = BinaryNode(22);
  a3.leftChild = a4;
  final a5 = BinaryNode(52);
  a4.leftChild = a5;
  seven.leftChild = one;
  one.leftChild = zero;
  one.rightChild = five;
  seven.rightChild = nine;
  nine.leftChild = eight;
  eight.leftChild = a2;
  nine.rightChild = a1;
  print(seven);
  return seven;
}

class DeserializeTreeCases {
  static List<int?> normal() {
    return [15, 10, 5, null, null, 12, null, null, 25, 17, null, null, null];
  }
}

class SerializeTreeCases {
  static BinaryNode<int> normal() {
    final root = BinaryNode<int>(15);
    final node10 = BinaryNode(10);
    root.leftChild = node10;
    node10.leftChild = BinaryNode(5);
    node10.rightChild = BinaryNode(12);
    final node25 = BinaryNode(25);
    root.rightChild = node25;
    node25.leftChild = BinaryNode(17);
    return root;
  }

  static BinaryNode<int> single() {
    final root = BinaryNode<int>(15);
    return root;
  }
}


