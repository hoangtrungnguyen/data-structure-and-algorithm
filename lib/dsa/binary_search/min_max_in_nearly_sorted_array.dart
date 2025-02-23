extension FindingMinValueInNearlyRotatedArray<T extends Comparable<dynamic>>
    on List<T> {
  T findMinimumInRotatedSortedArr() {
    int upper = length - 1;
    int lower = 0;
    while (lower < upper) {
      int middle = lower + (upper - lower) ~/ 2;

      if (middle < upper && this[middle].compareTo(this[middle + 1]) > 0) {
        return this[middle + 1];
      }

      if (middle > lower && this[middle].compareTo(this[middle - 1]) < 0) {
        return this[middle];
      }

      if (this[middle].compareTo(this[lower]) > 0) {
        lower = middle + 1;
      } else {
        upper = middle - 1;
      }
    }
    return this[0];
  }
}

extension FindingMaxValueInNearlyRotatedArray<T extends Comparable<dynamic>>
    on List<T> {
  T findMaxInRotatedSortedArr() {
    return _helper(0, length - 1);
  }

  T _helper(int left, int right) {
    if (left == right) {
      return this[right];
    }
    int mid = left + (right - left) ~/ 2;
    // Base case
    if (mid < right && this[mid].compareTo(this[mid + 1]) > 0) {
      return this[mid];
    }

    if (this[right].compareTo(this[mid]) < 0) {
      return _helper(mid + 1, right);
    } else {
      return _helper(left, mid);
    }
  }
}
