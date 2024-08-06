import 'package:data_structure_and_algorithm/19_quick_sort/swapper.dart';
import 'package:data_structure_and_algorithm/stack/stack.dart';

void main() {
  print('case 1');
  final list = [8, 2, 10, 0, 9, 18, 9, -1, 5];
  quicksortIterateLomuto(list, 0, list.length - 1);
  print(list);
  print('case 2');
  final list2 = [2,2,2,1,1];
  quicksortIterateLomuto(list2, 0, list2.length - 1);
  print(list2);
  print('case 3');
  final list3 = [1,1];
  quicksortIterateLomuto(list3, 0, list3.length - 1);
  print(list3);
}

class Range {
  int start;
  int end;

  Range(this.start, this.end);
}

void quicksortIterateLomuto<E extends Comparable<dynamic>>(
    List<E> list, int low, int high) {
  final stackPivot = Stack<Range>();

  final pivotIndex = _pivotIndex(low, high, list);
  stackPivot.push(Range(0, pivotIndex));
  stackPivot.push(Range(pivotIndex + 1, list.length));
  // print('pivot: $pivotIndex');
  // print('round 1 : $list');

  while (!stackPivot.isEmpty) {
    final range = stackPivot.pop()!;
    if (range.start == range.end) {
      continue;
    } else {
      if(range.start > range.end){
        continue;
      }
      final newPivot = _pivotIndex(range.start , range.end - 1, list);
      if (newPivot >= range.start || newPivot <= range.end) {
        stackPivot.push(Range(range.start, newPivot - 1));
        stackPivot.push(Range(newPivot + 1, range.end));
      }
    }
  }
}

int _pivotIndex<E extends Comparable<dynamic>>(
    int low, int high, List<E> list) {
  var pivotValue = list[high];
  var pivotIndex = low;
  for (int i = low; i < high; i++) {
    if (list[i].compareTo(pivotValue) <= 0) {
      list.swap(i, pivotIndex);
      pivotIndex += 1;
    }
  }
  list.swap(pivotIndex, high);
  return pivotIndex;
}
