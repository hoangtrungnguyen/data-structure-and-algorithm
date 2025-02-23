class SplayTreeNode<K, V> {
  K key;
  V value;
  SplayTreeNode<K, V>? left, right;
  SplayTreeNode(this.key, this.value);
}

class SplayTreeMap<K, V extends Comparable<dynamic>>  {
  SplayTreeNode<K, V>? root;

  void insert(K key, V value) {
    root = _insert(root, key, value);
    root = _splay(root, key); // Splay the inserted node to the top
  }

  SplayTreeNode<K, V>? _insert(SplayTreeNode<K, V>? node, K key, V value) {
    // ... (Recursive insertion logic similar to a regular BST)
    root ??= SplayTreeNode(key, value);
    void helper(SplayTreeNode? node, K key, V value) {
      if (node == null) return;
      if (value.compareTo(node.value) < 0) {
        helper(node.left, key, value);
        node.left ??= SplayTreeNode(key, value);
      } else if (value.compareTo(node.value) > 0) {
        helper(node.right, key, value);
        node.right ??= SplayTreeNode(key, value);
      } else {
        return;
      }
    }

    helper(root, key, value);

    return root;
  }

  SplayTreeNode<K, V>? _splay(SplayTreeNode<K, V>? node, K key) {
    // ... (Splaying logic - involves zig, zig-zig, zig-zag rotations)
  }

// ... (lookup, delete, other tree operations)
}
