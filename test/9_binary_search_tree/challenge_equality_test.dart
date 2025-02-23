import 'package:data_structure_and_algorithm/dsa/binary_search_tree/binary_search_tree.dart';
import 'package:data_structure_and_algorithm/dsa/binary_search_tree/challenge.dart';
import 'package:test/test.dart';

import 'tree_generator.dart';

void main(){
  test("Normal",(){
    final tree1  = TreeGenerator.createBinarySearchTree();
    final tree2  = TreeGenerator.createBinarySearchTree();
    final isOk = isTwoBinaryTreesEqual(tree1, tree2);
    expect(isOk, true);
  });

  test("Two empty binary trees", (){
    final tree1  = BinarySearchTree();
    final tree2  = BinarySearchTree();
    final isOk = isTwoBinaryTreesEqual(tree1, tree2);
    expect(isOk, true);
  });


  test("Two binary trees are not equal", (){
    final tree1  = TreeGenerator.createBinarySearchTree();
    final tree2  = TreeGenerator.createBinarySearchTree2 ();
    final isOk = isTwoBinaryTreesEqual(tree1, tree2);
    expect(isOk, false);
  });



}