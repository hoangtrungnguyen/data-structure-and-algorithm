import 'package:data_structure_and_algorithm/binary_tree/binary_node.dart';

class BinarySearchTree<E extends Comparable<dynamic>> {
  BinaryNode<E>? root;

  void insert(E value) {
    root ??= BinaryNode(value);
    void helper(BinaryNode<E>? node, E value) {
      if (node == null) return;
      if (node.value.compareTo(value) < 0) {
        helper(node.leftChild, value);
        node.leftChild ??= BinaryNode(value);
      } else if (node.value.compareTo(value) > 0) {
        helper(node.rightChild, value);
        node.rightChild ??= BinaryNode(value);
      } else {
        return;
      }
    }

    helper(root, value);
  }


  @override
  String toString() => root.toString();
}
