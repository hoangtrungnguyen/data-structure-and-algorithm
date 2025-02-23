// void main() {
//   List<num> list = [1, 2, 2, 2, 2, 4, 34, 54, 65, 123];
//   // print('isSorted: ${list.isSorted()} - expect: true');
//   print('binary search: ${list.binarySearch(2)} - expect: 1');
//   print('binary search: ${list.binarySearch(5)} - expect: -1');
//
//   print('isSorted: ${list.findRange(2)} - expect: Range(1,4)');
// }

// CHALLENGE 1 - Binary Search as a Free Function
// In this chapter, you implemented binary search as an extension of List.
// Since binary search only works on sorted lists,
// exposing binarySearch for every list (including unsorted ones)
// opens it up to being misused.
// Your challenge is to implement binary search as a free function.
extension BinarySearchWhileLoopStyle<E extends Comparable> on List<E> {
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

  int whileLoopBinarySearch(E value) {
    if (!_isSorted()) {
      throw Exception('binary search is for sorted list only');
    }
    int start = 0;
    int end = length;
    while (start < end) {
      final middle = ((start + end) / 2).floor();
      if (this[middle].compareTo(value) == 0) {
        return middle;
      } else if (value.compareTo(this[middle]) < 0) {
        end = middle;
      } else if (value.compareTo(this[middle]) > 0) {
        start = middle + 1;
      }
    }
    return -1;
  }
}

extension BinarySearchRecursiveStyle<E extends Comparable> on List<E> {
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

  int recursiveBinarySearch(E value) {
    if (!_isSorted()) {
      throw Exception('binary search is for sorted list only');
    }

    final l = length;
    return _recursiveBinarySearch(value);
  }

  int _recursiveBinarySearch(E value, [int? start, int? end]) {
    end = end ?? length;
    start = start ?? 0;
    if (start >= end) {
      return -1;
    }

    final middleIndex = ((start + end) / 2).floor();
    final middleValue = this[middleIndex];
    print('start:$start - end:$end');
    print('middle index: $middleIndex');
    print('middle value: $middleValue');
    if (value.compareTo(middleValue) < 0) {
      return _recursiveBinarySearch(value, start, middleIndex);
    } else if (value.compareTo(middleValue) > 0) {
      return _recursiveBinarySearch(value, middleIndex + 1, end);
    } else {
      return middleIndex;
    }
  }
}

//region Challenge 3: Searching for a Range
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Range &&
          runtimeType == other.runtimeType &&
          start == other.start &&
          end == other.end;

  @override
  int get hashCode => start.hashCode ^ end.hashCode;
}

extension SearchingForRange<E extends Comparable> on List<E> {
  Range? findRange(E value) {
    final foundIndex = whileLoopBinarySearch(value);
    print('foundIndex: $foundIndex');
    if (foundIndex == -1) return null;
    late int? start;
    late int? end;

    if (foundIndex > 0) {
      var lowerIndex = foundIndex - 1;
      var lower = this[lowerIndex];
      while (lower == value && lowerIndex >= 0) {
        lowerIndex -= 1;
        if (lowerIndex < 0) break;
        lower = this[lowerIndex];
      }
      start = lowerIndex + 1;
    } else {
      start = foundIndex;
    }

    if (foundIndex < length - 1) {
      var upperIndex = foundIndex + 1;
      var upper = this[upperIndex];
      while (upper == value && upperIndex <= length) {
        upperIndex += 1;
        if (upperIndex >= length) break;
        upper = this[upperIndex];
      }
      end = upperIndex - 1;
    } else {
      end = foundIndex;
    }

    return Range(start, end);
  }
}

/// Binary search for start index and end index.
///
/// ## Find startIndex
/// example: (found index is the element at the middle in the image below):
/// [ ... , 1, 2, 2, ... ] is valid
/// [ ... , 2, 2, 2, ... ] is invalid
/// [ ... , 1, 2, 2, ... ] is invalid
/// ## Find endIndex
/// [ ... , 2, 2, 3, ... ] is valid
/// [ ... , 2, 2, 2, ... ] is invalid
/// [ ... , 1, 2, 2, ... ] is invalid
///
extension SearchingForRangeUseBinarySearch<E extends Comparable> on List<E> {
  //TODO: Implement this
  int _startIndex(E value, [int? start, int? end]) {
    end = end ?? length;
    start = start ?? 0;
    if (start >= end) {
      return -1;
    }

    final middleIndex = ((start + end) / 2).floor();
    final middleValue = this[middleIndex];
    if (value.compareTo(middleValue) < 0) {
      return _startIndex(value, start, middleIndex);
    } else if (value.compareTo(middleValue) > 0) {
      return _startIndex(value, middleIndex + 1, end);
    } else {
      if (middleIndex > 0 && this[middleIndex - 1] == middleValue) {
        return _startIndex(value, start, middleIndex);
      }
      return middleIndex;
    }
  }

  int _endIndex(E value, [int? start, int? end]) {
    end = end ?? length;
    start = start ?? 0;
    if (start >= end) {
      return -1;
    }

    final middleIndex = ((start + end) / 2).floor();
    final middleValue = this[middleIndex];
    if (value.compareTo(middleValue) < 0) {
      return _endIndex(value, start, middleIndex);
    } else if (value.compareTo(middleValue) > 0) {
      return _endIndex(value, middleIndex + 1, end);
    } else {
      if (middleIndex < length - 1 && this[middleIndex + 1] == middleValue) {
        return _endIndex(value, middleIndex, end);
      }
      return middleIndex;
    }
  }

  Range? getRange2(E value, [int? start, int? end]) {
    final startIndex = _startIndex(value, start, end);
    final endIndex = _endIndex(value, start, end);
    return (startIndex == -1 || endIndex == -1)
        ? null
        : Range(startIndex, endIndex);
  }
}

// end region
