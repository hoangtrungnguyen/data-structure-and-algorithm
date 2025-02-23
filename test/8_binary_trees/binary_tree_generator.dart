import 'package:data_structure_and_algorithm/dsa/binary_tree/binary_node.dart';

class BinaryTreeGenerator {
  static BinaryNode<int> createBinaryTree() {
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
    return seven;
  }


  static BinaryNode<int> normalTree() {
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

  static BinaryNode<int> unBalanceTree() {
    final root = BinaryNode<int>(15);
    final node10 = BinaryNode(27);
    root.leftChild = node10;
    node10.leftChild = BinaryNode(5);
    node10.rightChild = BinaryNode(12);
    final node25 = BinaryNode(25);
    root.rightChild = node25;
    node25.leftChild = BinaryNode(17);
    return root;
  }

  static BinaryNode<int> singleNodeTree() {
    final root = BinaryNode<int>(15);
    return root;
  }

  static List<int?> createSerializedDataList(){
    return [15, 10, 5, null, null, 12, null, null, 25, 17, null, null,
      null];
  }

  static List<int?> createSingleElementSerializedDataList(){
    return [15, null, null];
  }

}