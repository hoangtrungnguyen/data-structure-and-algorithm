import 'package:data_structure_and_algorithm/binary_tree/binary_node.dart';

extension Checker<E extends Comparable<dynamic>> on BinaryNode<E> {
  bool isBinarySearchTree() {
    return _isBinaryTree(this);
  }

  bool _isBinaryTree(BinaryNode<E>? node, {E? minValue, E? maxValue}) {
    if (node == null) return true;
    if (minValue != null && node.value.compareTo(minValue) < 0) {
      return false;
    }
    if (maxValue != null && node.value.compareTo(maxValue) > 0) {
      return false;
    }

    return _isBinaryTree(node.leftChild, maxValue: node.value, minValue: minValue) &&
        _isBinaryTree(node.rightChild, maxValue: maxValue, minValue: node.value, );
  }
}
