import 'package:data_structure_and_algorithm/dsa/binary_search_tree/binary_search_tree.dart';
import 'package:data_structure_and_algorithm/dsa/binary_tree/binary_node.dart';

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

    return _isBinaryTree(node.leftChild,
            maxValue: node.value, minValue: minValue) &&
        _isBinaryTree(
          node.rightChild,
          maxValue: maxValue,
          minValue: node.value,
        );
  }

  // Attempt 2 - 2024/02/22 - CHALLENGE 2: Are tress equal ?
  bool treesEquals(BinarySearchTree<E> first, BinarySearchTree<E> second) {
    // traversal synchronous in both trees
    return _treesEquals(first.root, second.root);
  }

  bool _treesEquals(BinaryNode<E>? first, BinaryNode<E>? second) {
    if (first == null && second == null) {
      return true;
    }
    if (first == null || second == null) return false;
    if (first.value != second.value) return false;

    return _treesEquals(first.leftChild, second.leftChild) &&
        _treesEquals(first.rightChild, second.rightChild);
  }

}

extension Subtree<E> on BinarySearchTree {

  // Attempt 3 - 2024/02/22 - CHALLENGE 3: Is a sub-tree ?
  bool containsSubtree(BinarySearchTree subtree) {

    Set set = <E>{};
    root?.traversePreOrder((value) {
      set.add(value);
    });

    bool isEqual = true;

    subtree.root?.traversePreOrder((value) {
      isEqual = isEqual && set.contains(value);
    });

    return isEqual;
  }
}