import 'package:data_structure_and_algorithm/dsa/binary_search_tree/binary_search_tree.dart';
import 'package:data_structure_and_algorithm/dsa/binary_tree/binary_node.dart';



class TreeGenerator{

  static BinaryNode<int> createBinaryTree() {
    final zero = BinaryNode(0);
    final one = BinaryNode(1);
    final five = BinaryNode(5);
    final seven = BinaryNode(7);
    final eight = BinaryNode(8);
    final nine = BinaryNode(9);
    seven.leftChild = one;
    one.leftChild = zero;
    one.rightChild = five;
    seven.rightChild = nine;
    nine.leftChild = eight;
    return seven;
  }


  static BinarySearchTree createBinarySearchTree(){

    BinarySearchTree binarySearchTree = BinarySearchTree();
    binarySearchTree.insert(1);
    binarySearchTree.insert(3);
    binarySearchTree.insert(44);
    binarySearchTree.insert(2);
    binarySearchTree.insert(4);
    binarySearchTree.insert(8);
    binarySearchTree.insert(-1);
    binarySearchTree.insert(-2);

    return binarySearchTree;
  }

static BinarySearchTree createBinarySearchTree2(){

    BinarySearchTree binarySearchTree = BinarySearchTree();
    binarySearchTree.insert(1);
    binarySearchTree.insert(3);
    binarySearchTree.insert(42);
    binarySearchTree.insert(2);
    binarySearchTree.insert(4);
    binarySearchTree.insert(8);
    binarySearchTree.insert(-1);
    binarySearchTree.insert(-2);

    return binarySearchTree;
  }


}