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

  TreeNode<T>? depthFirstSearch(T value) {
    TreeNode<T>? found;
    if (this.value == value) {
      found = this;
      return found;
    }

    if (children.isEmpty) {
      if (this.value == value) {
        found = this;
        return found;
      }
    }

    for (final e in children) {
      e.forEachDepthFirst((e) {
        if (e.value == value) {
          found = e;
        }
      });
    }
    return found;
  }

  TreeNode? levelOrderSearch(T value) {
    TreeNode? result;
    forEachLevelOrder((node) {
      if (node.value == value) {
        result = node;
      }
    });
    return result;
  }

  @override
  String toString() {
    return value.toString();
  }
}

extension XTreeNode<T> on TreeNode<T> {
  void printInLevelOrder() {
    final List<List<T>> levels = [[]];
    levels[0] = [value];

    void helper(TreeNode<T> node, int level) {
      if (node.children.isEmpty) {
        return;
      }
      levels.add([]);
      level += 1;
      for (final e in node.children) {
        helper(e, level);
      }
      levels[level].addAll(node.children.map((e) => e.value));
    }

    helper(this, 0);
    print(levels.map((e) => '[${e.join(', ')}]').join('\n'));
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

  bitterLemon.add(TreeNode("bitter lemon1"));
  bitterLemon.add(TreeNode("bitter lemon2"));
  bitterLemon.add(TreeNode("bitter lemon3"));
  bitterLemon.add(TreeNode("bitter lemon4"));
  bitterLemon.add(TreeNode("bitter lemon5"));
  bitterLemon.add(TreeNode("bitter lemon6"));

  cold.add(milk);
  tree.forEachLevelOrder((node) {
    print(node.toString());
  });
  print("-------------");

  var start = DateTime.now();
  final result = tree.depthFirstSearch('cocoa');
  print(result);
  var end = DateTime.now();
  print(
      "depthFirstSearch ${end.microsecondsSinceEpoch - start.microsecondsSinceEpoch}");

  final result2 = tree.levelOrderSearch('beverages');
  print(result2);
  print("-------------");

  final treeInLevelOrder = printInLevelOrderInput();
  treeInLevelOrder.printInLevelOrder();
}

TreeNode printInLevelOrderInput() {
  final tree = TreeNode(15);
  final tree1 = TreeNode(1);
  tree1.children.addAll([
    TreeNode(1),
    TreeNode(5),
    TreeNode(0),
  ]);
  final tree17 = TreeNode(17);
  tree17.children.addAll([
    TreeNode(2),
  ]);
  final tree20 = TreeNode(20);
  tree20.children.addAll([
    TreeNode(5)
      ..children = [
        TreeNode(99)..children = [TreeNode(991)]
      ],
    TreeNode(7),
  ]);

  tree.children.addAll([
    tree1,
    tree17,
    tree20,
  ]);
  return tree;
}
