import 'package:data_structure_and_algorithm/binary_search_tree/binary_search_tree.dart';
import 'package:data_structure_and_algorithm/binary_tree/binary_node.dart';

void main() {
  final tree = BinaryNode(2);

  BinarySearchTree binarySearchTree = BinarySearchTree();

  binarySearchTree.insert(1);
  binarySearchTree.insert(3);
  binarySearchTree.insert(44);
  binarySearchTree.insert(2);
  binarySearchTree.insert(4);
  binarySearchTree.insert(8);
  binarySearchTree.insert(-1);
  binarySearchTree.insert(-2);

  print(binarySearchTree.toString());
}
