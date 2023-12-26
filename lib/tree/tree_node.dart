import 'package:data_structure_and_algorithm/queue/queue.dart';

class TreeNode<T> {
  TreeNode(this.value);

  T value;

  List<TreeNode<T>> children = [];

  void add(TreeNode<T> child) {
    children.add(child);
  }

  void forEachDepthFirst(void Function(TreeNode<T> node) performAction) {
    if (children.isEmpty) {
      performAction(this);
      return;
    }
    for (final e in children) {
      e.forEachDepthFirst(performAction);
    }
  }

  void forEachLevelOrder(void Function(TreeNode<T> node) performAction) {
    final queue = QueueStack<TreeNode<T>>();
    performAction(this);
    children.forEach(queue.enqueue);
    var node = queue.dequeue();
    while (node != null) {
      performAction(node);
      node.children.forEach(queue.enqueue);
      node = queue.dequeue();
    }
  }

  @override
  String toString() {
    return value.toString();
  }
}

void main() {
  final tree = TreeNode('beverages');
  final hot = TreeNode('hot');
  final cold = TreeNode('cold');
  final tea = TreeNode('tea');
  final coffee = TreeNode('coffee');
  final chocolate = TreeNode('cocoa');
  final blackTea = TreeNode('black');
  final greenTea = TreeNode('green');
  final chaiTea = TreeNode('chai');
  final soda = TreeNode('soda');
  final milk = TreeNode('milk');
  final gingerAle = TreeNode('ginger ale');
  final bitterLemon = TreeNode('bitter lemon');
  tree.add(hot);
  tree.add(cold);

  hot.add(tea);
  tea.add(blackTea);
  tea.add(greenTea);
  tea.add(chaiTea);
  hot.add(coffee);
  hot.add(chocolate);

  cold.add(soda);
  soda.add(gingerAle);
  soda.add(bitterLemon);

  cold.add(milk);

  //
  // tree.forEachDepthFirst((node) {
  //   print(node.toString());
  // });

  tree.forEachLevelOrder((node) {
    print(node.toString());
  });
}
