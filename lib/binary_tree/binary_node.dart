class BinaryNode<T> {
  T value;

  BinaryNode<T>? leftChild;

  BinaryNode<T>? rightChild;

  BinaryNode(
    this.value, {
    this.leftChild,
    this.rightChild,
  });

  @override
  String toString() {
    return _diagram(this);
  }


  String _diagram(BinaryNode<T>? node,
      [String top = '', String root = '', String bottom = '']) {
    if (node == null) {
      return '$root null\n';
    }

    if (node.leftChild == null && node.rightChild == null) {
      return '$root ${node.value}\n';
    }

    final a = _diagram(
      node.rightChild,
      '$top ',
      '$top┌──',
      '$top│ ',
    );

    final b = '$root${node.value}\n';

    final c = _diagram(
      node.leftChild,
      '$bottom│ ',
      '$bottom└──',
      '$bottom ',
    );
    return '$a$b$c';
  }

  void traverseInOrder(void Function(T value) action) {
    leftChild?.traverseInOrder(action);
    action(value);
    rightChild?.traverseInOrder(action);
  }

  void traversePreOrder(void Function(T value) action) {
    action(value);
    leftChild?.traversePreOrder(action);
    rightChild?.traversePreOrder(action);
  }

  void traversePostOrder(void Function(T value) action) {
    leftChild?.traversePostOrder(action);
    rightChild?.traversePostOrder(action);
    action(value);
  }
}

class XBinaryTraversalAlgorithm<T> {
  void inOrderTraversal(BinaryNode<T>? node) {
    if (node == null) {
      return;
    }
    inOrderTraversal(node.leftChild);
    print(node.value.toString());
    inOrderTraversal(node.rightChild);
  }

  void preOrderTraversal(BinaryNode<T>? node) {
    if (node == null) {
      return;
    }
    print(node.value.toString());
    preOrderTraversal(node.leftChild);
    preOrderTraversal(node.rightChild);
  }

  void postOrderTraversal(BinaryNode<T>? node) {
    if (node == null) {
      return;
    }
    postOrderTraversal(node.leftChild);
    postOrderTraversal(node.rightChild);
    print(node.value.toString());
  }
}

extension Serializable<T> on BinaryNode<T> {
  void traversePreOrderWithNull(void Function(T? value) action) {
    action(value);
    if (leftChild == null) {
      action(null);
    } else {
      leftChild!.traversePreOrderWithNull(action);
    }
    if (rightChild == null) {
      action(null);
    } else {
      rightChild!.traversePreOrderWithNull(action);
    }
  }

  BinaryNode<T>? deserialize<T>(List<T?> list) {
    if (list.isEmpty) {
      return null;
    }

    final value = list.removeAt(0);
    if (value == null) return null;
    final node = BinaryNode<T>(value);
    node.leftChild = deserialize(list);
    node.rightChild = deserialize(list);
    return node;
  }
}

BinaryNode<int> createBinaryTree() {
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

void main() {
  final tree = createBinaryTree();
  print(tree);
  print("----------------");
  print("IN ORDER TRAVERSAL");
  tree.traverseInOrder((value) {
    print(value);
  });
  print("----------------");
  print("PRE ORDER TRAVERSAL");
  tree.traversePreOrder((value) {
    print(value);
  });
  print("----------------");
  print("POST ORDER TRAVERSAL");
  tree.traversePostOrder((value) {
    print(value);
  });
}
