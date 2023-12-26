class Node<T> {
  T? value;
  Node<T>? next;

  Node({
    this.value,
    this.next,
  });

  @override
  String toString() {
    if (next == null) return '$value -> null';
    return '$value -> ${next.toString()}';
  }
}

class LinkedList<E> extends Iterable<E> {
  Node<E>? head;
  Node<E>? tail;

  @override
  bool get isEmpty => head == null;

  @override
  String toString() {
    if (isEmpty) return "Empty List";
    return head.toString();
  }

  void push(E value) {
    final node = Node(value: value, next: head);
    head = node;
    tail ??= head;
  }

  void append(E value) {
    if (isEmpty) {
      push(value);
      return;
    }
    tail!.next = Node(value: value);
    tail = tail!.next;
  }

  Node<E>? nodeAt(int index) {
    var currentIndex = 0;
    var currentNode = head;
    while (currentIndex < index && currentNode != null) {
      currentNode = currentNode.next;
      currentIndex++;
    }
    return currentIndex == index ? currentNode : null;
  }

  bool insertAfterIndex(int index, E value) {
    final found = nodeAt(index);
    if (found == null) return false;
    Node<E>? next = found.next;
    found.next = Node<E>(value: value, next: next);
    return true;
  }

  Node<E> insertAfter(Node<E> node, E value) {
    node.next = Node(value: value, next: node.next);
    return node.next!;
  }

  E? pop() {
    final value = head?.value;
    head = head?.next;
    if (isEmpty) {
      tail = null;
    }
    return value;
  }

  E? removeLast() {
    if (isEmpty) return null;
    final value = tail!.value;
    var current = head;
    while (current?.next != tail) {
      current = current?.next;
    }

    current?.next = null;
    tail = current;
    return value;
  }

  E? removeAfter(Node<E> node) {
    if (isEmpty) return null;
    final value = node.next?.value;
    final next = node.next?.next;
    final nextNodeIsATail = node.next == tail;
    node.next = next;
    if (nextNodeIsATail) {
      tail = node;
    }
    return value;
  }

  E? removeAfterIndex(int index) {
    final node = nodeAt(index);
    if (node == null) return null;
    return removeAfter(node);
  }

  LinkedList({
    this.head,
    this.tail,
  });

  @override
  Iterator<E> get iterator {
    return _LinkedListIterator(this);
  }

  void removeAll(E value) {
    var current = head;
    while (current?.value == value) {
      pop();
      current = head;
    }
    while (current != null) {
      if (current.next?.value == value) {
        removeAfter(current);
      } else {
        current = current.next;
      }
    }
  }

  Node<E>? findMiddle() {
    var slowCursor = head;
    var fastCursor = head;
    while (fastCursor?.next?.next != null) {
      slowCursor = slowCursor?.next;
      fastCursor = fastCursor?.next?.next;
    }
    return slowCursor;
  }

  @override
  int get length {
    int count = 0;
    var current = head;
    while (current != null) {
      count += 1;
      current = current.next;
    }
    return count;
  }
}

class _LinkedListIterator<E> implements Iterator<E> {
  _LinkedListIterator(LinkedList<E> list) : _list = list {}

  final LinkedList<E> _list;
  Node<E>? cursor;

  @override
  E get current => cursor!.value!;

  bool isInitial = true;

  @override
  bool moveNext() {
    if (_list.isEmpty) return false;
    if (isInitial) {
      cursor = _list.head;
      isInitial = false;
      return true;
    } else {
      cursor = cursor?.next;
      return cursor != null;
    }
  }
}

extension ReversedLinkedList<T> on LinkedList<T> {
  Node<T>? reverse() {
    tail = head;
    var prev = head;
    var current = head?.next;
    prev?.next = null;
    print("current: $current");
    while (current != null) {
      var holder =  current.next;
      current.next = prev;
      prev = current;
      current = holder;
    }

    head = prev;
    return head;
  }
}

void main() {
  final node1 = Node(value: 1);
  final node2 = Node(value: 2);
  final node3 = Node(value: 3);

  node1.next = node2;
  node2.next = node3;
  // print(node1);

  final list = LinkedList(head: node1, tail: node3);
  //
  // for (final element in list) {
  //   print(element);
  // }
  //
  // final found = list.nodeAt(1);
  // print(found);
  // print(node2);
  // print(found == node2);

  print("--- Before reverse ---");
  print(list);
  Node? head = list.reverse();
  // print(list);
  print("Head $head");
  print("--- After reverse ---");
}
