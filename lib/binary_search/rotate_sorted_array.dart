import 'package:data_structure_and_algorithm/binary_search/min_max_in_nearly_sorted_array.dart';

extension Rotate<T extends Comparable<dynamic>> on List<T> {
  List<T> rotateArrayTemp(int k) {
    if (k == 0) return this;
    final l = length;
    List<T?> tempArr = List.generate(l, (index) => null, growable: false);
    for (int i = 0; i < l; i++) {
      int newIndex = (l + (k % l) + i) % l;
      tempArr[newIndex] = this[i];
    }
    return tempArr.whereType<T>().toList();
  }

  List<T> rotateReversal(int k) {
    List<T> arr = this;
    void reverse(List<T> list, int start, int end) {
      while (start < end) {
        T temp = list[start];
        list[start] = list[end];
        list[end] = temp;
        start = start + 1;
        end = end - 1;
      }
    }

    final n = length;
    if (n == 0) return arr;
    int r = n - k % n;
    print('r $r');
    if (r < 0) {
      r = r + n;
    }

    reverse(arr, 0, r - 1);
    reverse(arr, r, n - 1);
    reverse(arr, 0, n - 1);
    return arr;
  }
}

void main() {
  final array = [1, 2, 3, 4, 5];
  final actual = array.rotateReversal(3);
  print('rotated $actual');
  final min = actual.findMinimumInRotatedSortedArr();
  print('min: $min');
}
