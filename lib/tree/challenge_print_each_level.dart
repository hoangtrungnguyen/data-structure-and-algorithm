import 'package:data_structure_and_algorithm/queue/queue.dart';

import 'tree_node.dart';

void main(){
  challengeOne();
}

void challengeOne() {
  final tree = buildTree();
  printEachLevel(tree);
}

TreeNode<int> buildTree() {
  return TreeNode(15)
    ..children.addAll([
      TreeNode(1)
        ..children.addAll([
          TreeNode(1),
          TreeNode(5),
          TreeNode(0),
        ]),
      TreeNode(17)
        ..children.addAll([
          TreeNode(2),
        ]),
      TreeNode(20)
        ..children.addAll([
          TreeNode(5),
          TreeNode(7),
        ]),
    ]);
}

void printEachLevel<T>(TreeNode<T> tree) {
  final result = StringBuffer();
// 1
  var queue = QueueStack<TreeNode<T>>();
  var nodesLeftInCurrentLevel = 0;
  queue.enqueue(tree);
// 2
  while (!queue.isEmpty) {
// 3
    nodesLeftInCurrentLevel = queue.length;
// 4
    while (nodesLeftInCurrentLevel > 0) {
      final node = queue.dequeue();
      if (node == null) break;
      result.write('${node.value} ');
      for (var element in node.children) {
        queue.enqueue(element);
      }
      nodesLeftInCurrentLevel -= 1;
    }
// 5
    result.write('\n');
  }
  print(result);
}


