import 'package:data_structure_and_algorithm/dsa/binary_search_tree/binary_search_tree.dart';
import 'package:data_structure_and_algorithm/dsa/binary_search_tree/solution.dart';
import 'package:data_structure_and_algorithm/dsa/binary_tree/binary_node.dart';
import 'package:test/test.dart';

import '../tree_generator.dart';

void main(){
  test("identical tree" ,(){
    final tree = BinarySearchTree()..root= TreeGenerator.createBinaryTree();
    final actual = tree.containsSubtree(tree);
    expect(actual, true);
  });

  test("is sub tree: normal case" ,(){
    final tree = BinarySearchTree()..root= TreeGenerator.createBinaryTree();
    final subtree = BinaryNode(1);
    subtree.leftChild = BinaryNode(0);
    subtree.rightChild = BinaryNode(5);
    final actual = tree.containsSubtree(tree);
    expect(actual, true);
  });

  test("empty tree" ,(){
    final tree = BinarySearchTree()..root= TreeGenerator.createBinaryTree();
    final actual = tree.containsSubtree(BinarySearchTree());
    expect(actual, true);
  });
}