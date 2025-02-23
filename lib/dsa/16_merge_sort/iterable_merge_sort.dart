void main() {
  final result = _merge([0, 4, 5], [-1, 2]);
  print(result);

  print(iterableMergeSort([1, 2, -1, 2, -23, 4, 65, 23]));
}

List<E> iterableMergeSort<E extends Comparable<dynamic>>(List<E> list) {
  if (list.length < 2) return list;

  final middle = list.length ~/ 2;
  final left = iterableMergeSort(list.sublist(0, middle));
  final right = iterableMergeSort(list.sublist(middle));

  return _merge(left, right);
}

List<E> _merge<E extends Comparable<dynamic>>(
    Iterable<E> first, Iterable<E> second) {
  var result = <E>[];
  var firstIterator = first.iterator;
  var secondIterator = second.iterator;

  var firstHasValue = firstIterator.moveNext();
  var secondHasValue = secondIterator.moveNext();

  while (firstHasValue && secondHasValue) {
    final firstValue = firstIterator.current;
    final secondValue = secondIterator.current;

    if (firstValue.compareTo(secondValue) < 0) {
      result.add(firstValue);
      firstHasValue = firstIterator.moveNext();
    } else if (secondValue.compareTo(firstValue) < 0) {
      result.add(secondValue);
      secondHasValue = secondIterator.moveNext();
    } else {
      result.add(secondValue);
      result.add(firstValue);
      firstHasValue = firstIterator.moveNext();
      secondHasValue = secondIterator.moveNext();
    }
  }

  if (firstHasValue) {
    do {
      result.add(firstIterator.current);
    } while (firstIterator.moveNext());
  }

  if (secondHasValue) {
    do {
      result.add(secondIterator.current);
    } while (secondIterator.moveNext());
  }

  return result;
}
