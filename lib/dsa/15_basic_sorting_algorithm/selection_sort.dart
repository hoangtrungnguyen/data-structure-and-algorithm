import 'package:collection/collection.dart';

void selectionSort<E extends Comparable<dynamic>>(List<E> list) {
  for (int i = 0; i < list.length; i++) {
    var lowestValueIndex = i;
    for (int j = i + 1; j < list.length; j++) {
      if (list[j].compareTo(list[i]) < 0) {
        lowestValueIndex = j;
      }
    }
    if (lowestValueIndex != i) {
      list.swap(i, lowestValueIndex);
    }
  }
}
