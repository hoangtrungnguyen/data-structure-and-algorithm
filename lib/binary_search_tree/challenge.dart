import 'package:collection/equality.dart';
import 'package:data_structure_and_algorithm/binary_search_tree/binary_search_tree.dart' ;
import 'package:data_structure_and_algorithm/binary_tree/converter.dart';
import 'dart:collection';

//CHALLENGE 2 : Equality

bool isTwoBinaryTreesEqual(BinarySearchTree tree1, BinarySearchTree tree2 ) {
  final serializedTree1 = tree1.root?.serialize();
  final serializedTree2 = tree2.root?.serialize();
  Function eq = const ListEquality().equals;
  return eq(serializedTree1, serializedTree2);
}