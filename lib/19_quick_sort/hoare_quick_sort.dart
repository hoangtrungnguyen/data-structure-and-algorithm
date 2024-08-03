import 'package:data_structure_and_algorithm/19_quick_sort/swapper.dart';

void main() {

    final list =  [8, 2,  10, 0, 9, 18, 9, -1, 5 ];
    // int pivotIndex = _partitionHoare(0, list.length - 1, list);
    // // expect: 3
    // print('pivotIndex: $pivotIndex');
    // print('expect all values to the left of the pivot index will be smaller');
    // print(list);

    quickSortHoare(list, 0, list.length - 1);
    print(list);

}

void quickSortHoare<E extends Comparable<dynamic>>(List<E> list, int low, int high){
  if(low >= high) return;
  final leftHigh = _partitionHoare(low, high, list);
  quickSortHoare(list, low, leftHigh);
  quickSortHoare(list, leftHigh + 1, high);
}

/// Hoare partition always chooses the first element
int _partitionHoare<E extends Comparable<dynamic>>(int low, int high, List<E> list){

  var pivotValue = list[low];
  var left = low - 1;
  var right = high + 1 ;

  // int round = 0;
  while(true){
    // print('--- round: $round ---');
    // print('pivotValue $pivotValue');

    do{
      left += 1;
    }while(
     list[left].compareTo(pivotValue) < 0
    );

    do{
      right -= 1;
    } while(list[right].compareTo(pivotValue) > 0);

    if(left < right){
      list.swap(right, left);
    } else {
      return right;
    }
    // round += 1;
  }



}