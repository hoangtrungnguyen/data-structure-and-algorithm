class TrieNode<T> {
  T? key;

  TrieNode<T>? parent;

  //We use map here to accelerate the insert.
  // Because, inserting in an array can take O(n)
  // but it takes O(1) with the map
  //
  Map<T, TrieNode<T>?> children = {};

  //From the book:is last element of the children.
  //If children is an array, this variable is not necessary.
  bool isTerminating = false;

  TrieNode({
    this.key,
    this.parent,
  });
}
