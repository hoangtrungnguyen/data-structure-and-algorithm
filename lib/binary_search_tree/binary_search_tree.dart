import 'dart:ffi';

import 'package:data_structure_and_algorithm/binary_tree/binary_node.dart';

class BinarySearchTree<E extends Comparable<dynamic>> {
  BinaryNode<E>? root;

  void insert(E value) {
    root ??= BinaryNode(value);
    void helper(BinaryNode<E>? node, E value) {
      if (node == null) return;
      if (value.compareTo(node.value) < 0) {
        helper(node.leftChild, value);
        node.leftChild ??= BinaryNode(value);
      } else if (value.compareTo(node.value) > 0) {
        helper(node.rightChild, value);
        node.rightChild ??= BinaryNode(value);
      } else {
        return;
      }
    }

    helper(root, value);
  }

  bool contains(E value) {
    var node = root;
    while (node != null) {
      if (node.value == value) {
        return true;
      }
      if (value.compareTo(node.value) < 0) {
        node = node.leftChild;
      } else {
        node = node.rightChild;
      }
    }
    return false;
  }

  void remove(E value) {
    BinaryNode<E>? helper(BinaryNode<E>? node, E value) {
      if (node == null) {
        return node;
      }
      if (node.value == value) {
        //1. Mot trong hai node con bi null
        if (node.leftChild == null || node.rightChild == null) {
          return node.leftChild ?? node.rightChild;
          //2. ca hai null
        } else if (node.leftChild == null && node.rightChild == null) {
          return null;
        } else {
          node.value = node.rightChild!.min.value;
          node.rightChild = helper(node.rightChild, node.value);
          return node;
        }
      } else if (value.compareTo(node.value) < 0) {
        node.leftChild = helper(node.leftChild, value);
        return node;
      } else {
        node.rightChild = helper(node.rightChild, value);
        return node;
      }
    }

    root = helper(root, value);
  }

  // BinaryNode<E> _remove(BinaryNode<E> node, E value){
  //
  // }

  void remove2(E value) {
    root = _remove2(root, value);
  }

  BinaryNode<E>? _remove2(BinaryNode<E>? node, E value) {
    if (node == null) return null;

    if (value == node.value) {
      node.value = node.rightChild!.min.value;
      node.rightChild = _remove2(node.rightChild, node.value);
    } else if (value.compareTo(node.value) < 0) {
      node.leftChild = _remove2(node.leftChild, value);
    } else {
      node.rightChild = _remove2(node.rightChild, value);
    }

    return node;
  }

  @override
  String toString() => root.toString();
}

extension _MinFinder<E extends Comparable> on BinaryNode<E> {
  BinaryNode<E> get min => leftChild?.min ?? this;
}

extension IsBinarySearchTree<E extends Comparable> on BinaryNode<E> {
  bool isBinarySearchTree() {
    bool helper(BinaryNode<E>? node, {E? min}) {
      if (node == null) return true;

      if (node.leftChild == null && node.rightChild == null) return true;

      if (node.leftChild != null &&
          node.leftChild!.value.compareTo(node.value) > 0) {
        return false;
      }

      if (node.rightChild != null &&
          node.rightChild!.value.compareTo(node.value) < 0) {
        return false;
      }

      return helper(node.leftChild, ) && helper(node.rightChild);
    }

    return helper(this, min: value);
  }
}

class IsBinarySearchTreeGenerator {
  static BinaryNode<int> get normalBST {
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

  static BinaryNode<int> get singleBST {
    final root = BinaryNode<int>(15);
    return root;
  }

  static BinaryNode<int> get misCase {
    final root = BinaryNode<int>(5);
    final node7 = BinaryNode(7);
    final node6 = BinaryNode(6);
    final node8 = BinaryNode(8);
    node7.leftChild = node6;
    node7.rightChild = node8;

    root.rightChild = node7;

    final node4 = BinaryNode(4);
    root.leftChild = node4;
    final node3 = BinaryNode(3);
    final node2 = BinaryNode(2);
    final node23 = BinaryNode(23);
    node4.leftChild = node3;
    node3.leftChild = node2;
    node4.rightChild = node23;

    return root;
  }
}
