import 'package:collection/collection.dart';
import 'package:data_structure_and_algorithm/binary_search_tree/binary_search_tree.dart';
import 'package:data_structure_and_algorithm/binary_tree/binary_node.dart';
import 'package:data_structure_and_algorithm/binary_tree/converter.dart';

//CHALLENGE 2 : Equality

bool isTwoBinaryTreesEqual(BinarySearchTree tree1, BinarySearchTree tree2) {
  final serializedTree1 = tree1.root?.serialize();
  final serializedTree2 = tree2.root?.serialize();
  Function eq = const ListEquality().equals;
  return eq(serializedTree1, serializedTree2);
}

// CHALLENGE 3: Is it a Subtree ?
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
