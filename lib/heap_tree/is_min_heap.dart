part of 'heap.dart';

extension IsMeanHeap<E extends Comparable<dynamic>> on List<E> {
  bool isMeanHeap() {
    if (isEmpty) return false;
    return _isMeanHeap(first);
  }

  bool _isMeanHeap(E value, {int index = 0}) {
    if (index >= length) {
      return true;
    }
    final left = _leftChildIndex(index);
    if (left < length && _firstHasHigherPriority(this[left], value)) {
      return false;
    }

    final right = _rightChildIndex(index);
    if (right < length && _firstHasHigherPriority(this[right], value)) {
      return false;
    }

    return _isMeanHeap(value, index: _leftChildIndex(index)) &&
        _isMeanHeap(value, index: _rightChildIndex(index));
  }

  int _leftChildIndex(int parentIndex) {
    return 2 * parentIndex + 1;
  }

  int _rightChildIndex(int parentIndex) {
    return 2 * parentIndex + 2;
  }

  bool _firstHasHigherPriority(E valueA, E valueB) {
    return valueA.compareTo(valueB) < 0;
  }
}

bool isMinHeap2<E extends Comparable<dynamic>>(List<E> elements) {
  // 1
  if (elements.isEmpty) return true;
  // 2
  final start = elements.length ~/ 2 - 1;
  for (var i = start; i >= 0; i--) {
    // 3
    final left = 2 * i + 1;
    final right = 2 * i + 2;
    // 4
    if (elements[left].compareTo(elements[i]) < 0) {
      return false;
    }
    // 5
    if (right < elements.length && elements[right].compareTo(elements[i]) < 0) {
      return false;
    }
  }
  // 6
  return true;
}
