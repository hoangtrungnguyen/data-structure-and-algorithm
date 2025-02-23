import 'package:data_structure_and_algorithm/dsa/15_basic_sorting_algorithm/insertion_sort.dart';
import 'package:data_structure_and_algorithm/dsa/19_quick_sort/swapper.dart';
import 'package:data_structure_and_algorithm/dsa/stack/stack.dart';

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
  print('---- OPTIMIZE ---');
  var list_0 = [8, 2, 10, 0, 9, 18, 9, -1, 5];
  quicksortIterateLomutoOptimize(list_0, 0, list_0.length - 1);
  print(list_0);
  print('case 2');
  list_0 = [2,2,2,1,1];
  quicksortIterateLomutoOptimize(list_0, 0, list_0.length - 1);
  print(list_0);
  print('case 3');
   list_0 = [1,1];
  quicksortIterateLomutoOptimize(list_0, 0, list_0.length - 1);
  print(list_0);
}

class Range {
  int start;
  int end;

  Range(this.start, this.end);
}

void quicksortIterateLomuto<E extends Comparable<dynamic>>(
    List<E> list, int low, int high) {
  //1
  final stackPivot = Stack<Range>();

  //2
  final pivotIndex = _pivotIndex(low, high, list);
  //2.1
  stackPivot.push(Range(0, pivotIndex));
  //2.2
  stackPivot.push(Range(pivotIndex + 1, list.length));
  // print('pivot: $pivotIndex');
  // print('round 1 : $list');

  //3
  while (!stackPivot.isEmpty) {
    //3.1
    final range = stackPivot.pop()!;
    //3.2
    if (range.start >= range.end) {
      continue;
    } else {
      //3.3 find newest pivot
      final newPivot = _pivotIndex(range.start , range.end - 1, list);
      //3.4 push new ranges if startIndex < endIndex
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


// optimize code from Gemini:
// https://g.co/gemini/share/284eea24cdc0
void quicksortIterateLomutoOptimize<E extends Comparable<dynamic>>(List<E> list, int low, int high) {
  final stackPivot = Stack<Range>();
  stackPivot.push(Range(low, high));

  while (!stackPivot.isEmpty) {
    final range = stackPivot.pop()!;

    if (range.end - range.start <= 10) {
      insertionSortInRange(list, range.start, range.end); // Use insertion sort for small ranges
      continue;
    }

    final pivotIndex = _pivotIndex(range.start, range.end - 1, list); // Inline

    // Tail call optimization
    if (pivotIndex - range.start < range.end - pivotIndex) {
      stackPivot.push(Range(pivotIndex + 1, range.end));
      high = pivotIndex - 1; // Continue with the smaller partition
    } else {
      stackPivot.push(Range(range.start, pivotIndex - 1));
      low = pivotIndex + 1;
    }
  }
}