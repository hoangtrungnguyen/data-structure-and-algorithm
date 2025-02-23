import 'package:data_structure_and_algorithm/dsa/binary_search_tree/binary_search_tree.dart';
import 'package:data_structure_and_algorithm/dsa/binary_search_tree/challenge.dart';
import 'package:data_structure_and_algorithm/dsa/binary_tree/binary_node.dart';
import 'package:data_structure_and_algorithm/dsa/binary_tree/challenges.dart';
import 'package:data_structure_and_algorithm/dsa/binary_tree/converter.dart';
import 'package:data_structure_and_algorithm/dsa/tree/tree_node.dart';
import 'package:test/test.dart';

import 'tree_generator.dart';

void main(){

  test("Empty subtree", (){
    final rootTree = BinarySearchTree();
    final subTree = null;
  });

  test("Identical trees" ,() {
    final rootTree = TreeGenerator.createBinarySearchTree();
    final subTree = TreeGenerator.createBinarySearchTree().root!;
    final isSubTree = subTree.isSubTreeOf(rootTree);
    expect(true, isSubTree);
  });

  test("Is a Sub-Tree", (){
    final root = BinarySearchTree.root(SerializeTreeCases.normal());
    final subTree = BinaryNode(10);
    subTree.leftChild  = BinaryNode(5);
    subTree.rightChild  = BinaryNode(12);

    final result = subTree.isSubTreeOf(root);
    expect(result, true);
  });

  test("Is not a Sub-Tree", (){
    final root = BinarySearchTree.root(SerializeTreeCases.normal());
    final subTree = BinaryNode(10);
    subTree.leftChild  = BinaryNode(2);
    subTree.rightChild  = BinaryNode(12);

    final result = subTree.isSubTreeOf(root);
    expect(result, false);
  });


}