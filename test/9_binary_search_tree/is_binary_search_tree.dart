import 'package:data_structure_and_algorithm/dsa/binary_search_tree/binary_search_tree.dart';
import 'package:data_structure_and_algorithm/dsa/binary_search_tree/solution.dart';
import 'package:data_structure_and_algorithm/dsa/binary_tree/binary_node.dart';
import 'package:test/test.dart';

BinaryNode<int> _createNormal() {
  final zero = BinaryNode(0);
  final one = BinaryNode(1);
  final five = BinaryNode(5);
  final seven = BinaryNode(7);
  final eight = BinaryNode(8);
  final nine = BinaryNode(9);
  seven.leftChild = one;
  one.leftChild = zero;
  one.rightChild = five;
  seven.rightChild = nine;
  nine.leftChild = eight;
  return seven;
}

BinaryNode<int> _createNotBinaryTree() {
  final zero = BinaryNode(0);
  final one = BinaryNode(1);
  final five = BinaryNode(5);
  final seven = BinaryNode(7);
  final eight = BinaryNode(8);
  final three = BinaryNode(3);
  final nine = BinaryNode(9);
  seven.leftChild = one;
  one.leftChild = zero;
  one.rightChild = five;
  seven.rightChild = nine;
  nine.leftChild = three;
  return seven;
}

void main() {
  test('normal', () {
    final tree = _createNormal();
    final actual = tree.isBinarySearchTree();
    expect(actual, true);
  });

  test('empty', () {
    final actual = BinaryNode(1).isBinarySearchTree();
    expect(actual, true);
  });

  test('not a binary tree', () {
    final tree = _createNotBinaryTree();
    print(tree);
    final actual = tree.isBinarySearchTree();
    expect(actual, false);
  });
}
