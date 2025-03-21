// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.
import 'dart:math' as math;

import 'package:data_structure_and_algorithm/dsa/avl_tree/traversable_binary_node.dart';

class AvlNode<T> extends TraversableBinaryNode {
  AvlNode(this.value);

  @override
  T value;
  @override
  AvlNode<T>? leftChild;
  @override
  AvlNode<T>? rightChild;

  @override
  void traverseInOrder(void Function(T value) action) {
    leftChild?.traverseInOrder(action);
    action(value);
    rightChild?.traverseInOrder(action);
  }

  @override
  void traversePreOrder(void Function(T value) action) {
    action(value);
    leftChild?.traversePreOrder(action);
    rightChild?.traversePreOrder(action);
  }

  @override
  void traversePostOrder(void Function(T value) action) {
    leftChild?.traversePostOrder(action);
    rightChild?.traversePostOrder(action);
    action(value);
  }

  @override
  String toString() {
    return _diagram(this);
  }

  String _diagram(
    AvlNode<T>? node, [
    String top = '',
    String root = '',
    String bottom = '',
  ]) {
    if (node == null) {
      return '$root null\n';
    }
    if (node.leftChild == null && node.rightChild == null) {
      return '$root ${node.value}\n';
    }
    final a = _diagram(node.rightChild, '$top ', '$top┌──', '$top│ ');
    final b = '$root${node.value}\n';
    final c = _diagram(node.leftChild, '$bottom│ ', '$bottom└──', '$bottom ');
    return '$a$b$c';
  }

  int get balanceFactor => leftHeight - rightHeight;

  int get leftHeight => this.leftChild?.height ?? -1;

  int get rightHeight => this.rightChild?.height ?? -1;

  int height = 0;

}


int getAVLHeight<T>(AvlNode<T>? node) {
  if (node == null) {
    return 0;
  }
  final leftHeight = 1 + getAVLHeight(node.leftChild);
  final rightHeight = 1 + getAVLHeight(node.rightChild);
  return math.max(leftHeight, rightHeight);
}
