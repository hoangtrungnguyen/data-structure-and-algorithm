void main() {
  List<num> list = [1, 2, 2, 2, 2, 4, 34, 54, 65, 123];
  // print('isSorted: ${list.isSorted()} - expect: true');
  print('binary search: ${list.binarySearch(2)} - expect: 1');
  print('binary search: ${list.binarySearch(5)} - expect: -1');

  print('isSorted: ${list.findRange(2)} - expect: Range(1,4)');
}

// CHALLENGE 1 - Binary Search as a Free Function
// In this chapter, you implemented binary search as an extension of List.
// Since binary search only works on sorted lists,
// exposing binarySearch for every list (including unsorted ones)
// opens it up to being misused.
// Your challenge is to implement binary search as a free function.
extension BinarySearch<E extends Comparable> on List<E> {
  bool _isSorted() {
    int index = 0;
    while (index < length - 1) {
      if (this[index].compareTo(this[index + 1]) > 0) {
        return false;
      }
      index++;
    }
    return true;
  }

  int binarySearch(E value) {
    if (!_isSorted()) {
      throw Exception('binary search is for sorted list only');
    }
    int start = 0;
    int end = length;
    int middle = ((start + end) / 2).floor();
    print('initial middle $middle');
    while (middle > start && middle < end) {
      if (this[middle].compareTo(value) == 0) {
        return middle;
      } else if (value.compareTo(this[middle]) < 0) {
        end = middle - 1;
      } else if (value.compareTo(this[middle]) > 0) {
        start = middle;
      }
      middle = ((start + end) / 2).floor();
    }
    return -1;
  }
}

//Challenge 3: Searching for a Range
// Write a function that searches a sorted list and finds the range of indices
// for a particular element.
// You can start by creating a class named Range that holds the start
// and end indices.
// For example:
// final list = [1, 2, 3, 3, 3, 4, 5, 5];
// final range = findRange(list, value: 3);
// findRange should return Range(2, 5)
// since those are the start and end indices for the value 3

class Range {
  int start;
  int end;

  Range(this.start, this.end);

  @override
  String toString() {
    return 'Range{start: $start, end: $end}';
  }
}

extension SearchingForRange<E extends Comparable> on List<E> {
  Range findRange(E value) {
    final foundIndex = binarySearch(value);
    print('foundIndex: $foundIndex');
    late int? start;
    late int? end;

    if (foundIndex > 0) {
      var lowerIndex = foundIndex - 1;
      var lower = this[lowerIndex];
      while (lower == value) {
        lowerIndex -= 1;
        lower = this[lowerIndex];
      }
      start = lowerIndex + 1;
    } else {
      start = foundIndex;
    }

    if (foundIndex < length - 1) {
      var upperIndex = foundIndex + 1;
      var upper = this[upperIndex];
      while (upper == value) {
        upperIndex += 1;
        upper = this[upperIndex];
      }
      end = upperIndex - 1;
    } else {
      end = foundIndex;
    }

    return Range(start, end);
  }
}
