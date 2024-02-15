import 'package:data_structure_and_algorithm/binary_search_tree/binary_search_tree.dart';
import 'package:data_structure_and_algorithm/binary_tree/binary_node.dart';
import 'package:data_structure_and_algorithm/binary_tree/challenges.dart';

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
  // print(binarySearchTree.contains(-1));
  print('---- After remove ----');
  print('remove: 4');
  binarySearchTree.remove(4);
  print(binarySearchTree.toString());
  print('remove: 8');
  binarySearchTree.remove(8);
  print(binarySearchTree.toString());
  print('------------');
  binarySearchTree.insert(23);
  binarySearchTree.insert(21);
  binarySearchTree.insert(26);
  binarySearchTree.insert(28);

  print('---- before remove: 3 ----');
  print(binarySearchTree.toString());
  binarySearchTree.remove(3);

  print('Final: ------------>');
  print(binarySearchTree.toString());

  print("--======================--");
  final tree2 = BinaryNode(2);

  BinarySearchTree binarySearchTree2 = BinarySearchTree();

  binarySearchTree2.insert(1);
  binarySearchTree2.insert(3);
  binarySearchTree2.insert(44);
  binarySearchTree2.insert(2);
  binarySearchTree2.insert(4);
  binarySearchTree2.insert(8);
  binarySearchTree2.insert(-1);
  binarySearchTree2.insert(-2);

  print(binarySearchTree2.toString());
  // print(binarySearchTree2.contains(-1));
  print('---- After remove ----');
  print('remove: 4');
  binarySearchTree2.remove(4);
  print(binarySearchTree2.toString());
  print('remove: 8');
  binarySearchTree2.remove(8);
  print(binarySearchTree2.toString());
  print('------------');
  binarySearchTree2.insert(23);
  binarySearchTree2.insert(21);
  binarySearchTree2.insert(26);
  binarySearchTree2.insert(28);

  print('---- before remove: 3 ----');
  print(binarySearchTree2.toString());
  binarySearchTree2.remove(3);

  print('Final: ------------>');
  print(binarySearchTree2.toString());

  print('=============');
  print(binarySearchTree == binarySearchTree2);
  print('\n');
  print('\n');
  print('\n');
  print("CHALLENGE: ");
  print('\n');
  print('1 - Is Binary Search Tree');
  print('${binarySearchTree2.root?.isBinarySearchTree()}');

  print('${SerializeTreeCases.normal().isBinarySearchTree()}');
  print('${SerializeTreeCases.unBalanceTree().isBinarySearchTree()}');
  print('${SerializeTreeCases.single().isBinarySearchTree()}');

  print('Expect: false. Actual: ${IsBinarySearchTreeGenerator.misCase.isBinarySearchTree()}');

}
