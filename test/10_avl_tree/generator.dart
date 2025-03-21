// Helper function to build trees easily
import 'package:data_structure_and_algorithm/dsa/avl_tree/avl_node.dart';
import 'package:data_structure_and_algorithm/dsa/avl_tree/avl_tree.dart';
import 'package:data_structure_and_algorithm/dsa/queue/queue.dart';

class AVLGenerator {
  static AvlNode<int>? buildTree(List<int> values) {
    if (values.isEmpty) return null;
    AvlNode<int>? root = AvlNode(values[0]);
    Queue<AvlNode<int>?> q =
        QueueStack(); // Using a queue for level-order insertion
    q.enqueue(root);

    for (int i = 1; i < values.length; i++) {
      AvlNode<int>? current = q.dequeue();
      current?.leftChild = AvlNode(values[i]);
      q.enqueue(current?.leftChild);

      // Advance index to skip potential null right child
      if (i + 1 < values.length) {
        current?.rightChild = AvlNode(values[i + 1]);
        q.enqueue(current?.rightChild);
        i++;
      }
    }
    return root;
  }

  // Usage:
  static AvlTree<num> generateBalancedTree(List<int> values) {
    AvlTree<num> tree = AvlTree<num>();
    for (int value in values) {
      tree.insert(value);
    }

    return tree;
  }
}
