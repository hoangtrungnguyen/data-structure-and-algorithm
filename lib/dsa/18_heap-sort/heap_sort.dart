import 'package:data_structure_and_algorithm/dsa/heap_tree/heap.dart';


List<E> heapSort<E extends Comparable<dynamic>>(List<E> list){
  final heap = Heap<E>(
    elements: list.toList(),
    priority: Priority.min
  );

  final sorted = <E>[];
  while(!heap.isEmpty){
    final value = heap.remove();
    sorted.add(value!);
  }

  return sorted;
}


// IN-Place sorting
extension Heapsort<E extends Comparable<dynamic>> on List<E> {

  void heapSortInPlace(){
    if(isEmpty) return;
    //1 - heapify
    final start = length ~/ 2 - 1 ;
    for(var i = start; i >= 0; i --){
      _siftDown(start: i, end: length);
    }

    //2 -
    for( var end = length - 1; end > 0; end -- ){
      _swapValues(0, end);
      _siftDown(start: 0, end: end);
    }

  }

  int _leftChildIndex(int parentIndex){
    return 2 * parentIndex + 1;
  }

  int _rightChildIndex(int parentIndex){
    return 2 * parentIndex + 2;
  }

  void _swapValues(int indexA, int indexB){
    final temp = this[indexA];
    this[indexA] = this[indexB];
    this[indexB] = temp;
  }


  void _siftDown({required int start, required int end}){
    var parent = start;
    while(true) {
      final left = _leftChildIndex(parent);
      final right = _rightChildIndex(parent);
      var chosen = parent;

      if(left < end && this[left].compareTo(this[chosen]) >  0 ){
        chosen = left;
      }

      if(right < end && this[right].compareTo(this[chosen]) > 0){
        chosen = right;
      }

      if(chosen == parent) return;
      _swapValues(parent, chosen);
      parent = chosen;
    }


  }


}

