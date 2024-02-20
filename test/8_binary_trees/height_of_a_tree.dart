
import 'package:data_structure_and_algorithm/binary_tree/binary_node.dart';
import 'package:data_structure_and_algorithm/binary_tree/challenges.dart';
import 'package:test/test.dart';

import 'binary_tree_generator.dart';

void main(){
  test("normal", (){
    final tree = BinaryTreeGenerator.createBinaryTree();
    final height = getHeight(tree);
    expect(height, 7);
  });

  test("empty", (){
    final tree = BinaryNode(0);
    final height = getHeight(tree);
    expect(height, 1);
  });

}