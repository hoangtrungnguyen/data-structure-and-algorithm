import 'binary_search_tree.dart';

void main () {
  BinarySearchTree binarySearchTree = BinarySearchTree();

  binarySearchTree.insert(1);
  binarySearchTree.insert(3);
  binarySearchTree.insert(44);
  binarySearchTree.insert(2);
  binarySearchTree.insert(4);
  binarySearchTree.insert(8);
  binarySearchTree.insert(-1);
  binarySearchTree.insert(-2);
  binarySearchTree.insert(-2);
  binarySearchTree.insert(-2);

  print(binarySearchTree.toString());
}