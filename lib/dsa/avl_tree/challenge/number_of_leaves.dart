import 'package:data_structure_and_algorithm/dsa/avl_tree/avl_node.dart';

// Ex 1: How many leaves in a binary tree
extension LeaveCounter on AvlNode {

  int countLeaves(){
    return _countLeaves(this);
  }

  int _countLeaves(AvlNode? node){
    if(node == null) return 0;
    if(node.leftChild == null && node.rightChild == null){
      return 1;
    }
    return _countLeaves(node.leftChild) + _countLeaves(node.rightChild);
  }

}

// Ex 2: How many leaves in a perfect balanced tree.
// int countLeaves(AvlNode node ){
//   node.
// }


void main(){

}

