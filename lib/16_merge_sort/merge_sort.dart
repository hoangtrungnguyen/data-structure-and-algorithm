

void main() {
  final result = _merge([0, 4, 5], [-1, 2]);
  print(result);

  print(mergeSort([1, 2, -1, 2, -23, 4, 65, 23]));
}

List<E> mergeSort<E extends Comparable<dynamic>>(List<E> list) {
  if (list.length < 2) return list;

  final middle = list.length ~/ 2;
  final left = mergeSort(list.sublist(0, middle));
  final right = mergeSort(list.sublist(middle));

  return _merge(left, right);
}

// assume both lists are sorted
List<E> _merge<E extends Comparable<dynamic>>(List<E> listA, List<E> listB) {
  int indexA = 0;
  int indexB = 0;
  final result = <E>[];

  while (indexA < listA.length && indexB < listB.length) {
    if (listA[indexA].compareTo(listB[indexB]) < 0) {
      result.add(listA[indexA]);
      indexA++;
    } else if (listB[indexB].compareTo(listA[indexA]) < 0) {
      result.add(listB[indexB]);
      indexB++;
    } else {
      result.add(listA[indexA]);
      result.add(listB[indexB]);
      indexA++;
      indexB++;
    }
  }
  if (indexA < listA.length) {
    result.addAll(listA.getRange(indexB, listA.length));
  }

  if (indexB < listB.length) {
    result.addAll(listB.getRange(indexB, listB.length));
  }

  return result;
}
