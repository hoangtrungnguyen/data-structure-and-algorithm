import 'package:collection/collection.dart';
import 'package:data_structure_and_algorithm/dsa/binary_search_tree/binary_search_tree.dart';
import 'package:data_structure_and_algorithm/dsa/binary_tree/binary_node.dart';
import 'package:data_structure_and_algorithm/dsa/binary_tree/converter.dart';

//CHALLENGE 1: Is Binary Search Tree
extension Checker<E extends Comparable<dynamic>> on BinarySearchTree<E> {
  bool isBST() {
    return _isBST(root);
  }

  bool _isBST(BinaryNode<E>? node, {E? minValue, E? maxValue}) {
    if (node == null) return true;
    // smaller than zero indicates node.value appear before minValue therefore invalid
    if (minValue != null && node.value.compareTo(minValue) < 0) {
      return false;
    } else if (maxValue != null && node.value.compareTo(maxValue) >= 0) {
      return false;
    }
    // parsing max here cause it is the max value of the whole sub tree
    return _isBST(node.leftChild, minValue: minValue, maxValue: node.value) &&
        // after base case from the left branch, we change the minvalue. Notice, the minvalue is now the max value of the left branch.
        _isBST(node.rightChild, minValue: node.value, maxValue: maxValue);
  }
}

//CHALLENGE 2 : Equality
bool isTwoBinaryTreesEqual(BinarySearchTree tree1, BinarySearchTree tree2) {
  final serializedTree1 = tree1.root?.serialize();
  final serializedTree2 = tree2.root?.serialize();
  Function eq = const ListEquality().equals;
  return eq(serializedTree1, serializedTree2);
}

// CHALLENGE 3: Is it a Subtree ?
// Note:
//   - 2024/02/22: This implementation is suitable for random tree rather than
//   binary search tree. Because binary search trees have distinct elements.
//   Therefore I don't have to check it's elements order.
extension XIsASubtree<E extends Comparable<dynamic>> on BinaryNode<E> {
  bool isSubTreeOf(BinarySearchTree<E>? tree) {
    final rootArray = tree?.root?.serialize() ?? [];
    final otherArray = serialize() ?? <E?>[];
    return isSubArray(rootArray, otherArray);
  }
}

bool isSubArray<E extends Comparable<dynamic>>(
    List<E?> rootArray, List<E?> otherArray) {
  if (otherArray.isEmpty) {
    return true;
  }
  if (otherArray.length > rootArray.length) {
    return false;
  }
  final otherLength = otherArray.length;

  int i = 0;
  while (i < rootArray.length) {
    if (rootArray.length - i < otherLength) return false;
    if (rootArray[i] != otherArray[0]) {
      i++;
      continue;
    }
    int j = 0;
    while (j < otherLength) {
      if (rootArray[i + j] != otherArray[j]) {
        break;
      }
      j++;
    }
    if (j >= otherLength) {
      return true;
    }

    i++;
  }

  return false;
}
