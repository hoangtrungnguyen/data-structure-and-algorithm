import 'package:data_structure_and_algorithm/binary_search_tree/binary_search_tree.dart';
import 'package:data_structure_and_algorithm/binary_tree/binary_node.dart';
import 'package:data_structure_and_algorithm/binary_tree/challenges.dart';
import 'package:data_structure_and_algorithm/binary_tree/converter.dart';
import 'package:data_structure_and_algorithm/tree/tree_node.dart';

import 'challenge.dart';

void main(){

  print('${SerializeTreeCases.normal()}');
  final subTree = BinaryNode(10);
  subTree.leftChild  = BinaryNode(5);
  subTree.rightChild  = BinaryNode(12);
  print('SubTree');
  print('$subTree');

  final result = isSubArray(SerializeTreeCases.normal().serialize(), subTree.serialize());

  print(result);

}