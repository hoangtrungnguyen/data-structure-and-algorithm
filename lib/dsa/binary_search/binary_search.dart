extension SortedLis<E extends Comparable<dynamic>> on List<E> {
  int? binarySearch(E value, [int? start, int? end]) {

    end = end ?? length;
    start = start ?? 0;
    if (start >= end) {
      return -1;
    }

    final middleIndex = ((start + end)/ 2).floor();
    final middleValue = this[middleIndex];
    print('start:$start - end:$end');
    print('middle index: $middleIndex');
    print('middle value: $middleValue');
    if (value.compareTo(middleValue) < 0) {
      return binarySearch(value, start, middleIndex);
    } else if (value.compareTo(middleValue) > 0) {
      return binarySearch(value, middleIndex + 1, end );
    } else {
      return middleIndex;
    }
  }
}
