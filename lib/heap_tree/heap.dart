import 'dart:developer';
part 'is_min_heap.dart';

enum Priority { max, min }

class Heap<E extends Comparable<dynamic>> {
  late List<E> elements;
  Priority priority;

  Heap({List<E>? elements, this.priority = Priority.max}) {
    this.elements = (elements == null) ? [] : elements;
    _buildHeap();
  }

  void _buildHeap(){
    if(isEmpty) return;
    final start = elements.length ~/2 -1;
    for(var i = start; i >= 0; i --){
      _siftDown(i);
    }
  }

  bool get isEmpty => elements.isEmpty;

  int get size => elements.length;

  E? get peek => isEmpty ? null : elements.first;

  int _leftChildIndex(int parentIndex) {
    return 2 * parentIndex + 1;
  }

  int _rightChildIndex(int parentIndex) {
    return 2 * parentIndex + 2;
  }

  int _parentIndex(int childIndex) {
    return (childIndex - 1) ~/ 2;
  }

  bool _firstHasHigherPriority(E valueA, E valueB) {
    if (priority == Priority.max) {
      return valueA.compareTo(valueB) > 0;
    }
    return valueA.compareTo(valueB) < 0;
  }

  int _higherPriority(int indexA, int indexB){
    if(indexA >= elements.length) return indexB;
    final valueA = elements[indexA];
    final valueB = elements[indexB];
    final isFirst = _firstHasHigherPriority(valueA, valueB);
    return isFirst ? indexA : indexB;
  }

  void _swapValues(int indexA, int indexB){
    final temp = elements[indexA];
    elements[indexA] = elements[indexB];
    elements[indexB] = temp;
  }

  void _siftUp(int index){
    int child = index;
    int parent = _parentIndex(child);
    while(child > 0 && _higherPriority(child, parent) == child){
        _swapValues(child, parent);
        child = parent;
        parent = _parentIndex(child);
    }
  }
  void _siftDown(int index){
    var parent = index;
    while(true){
      final leftIndex =_leftChildIndex(parent);
      final rightIndex = _rightChildIndex(parent);
      int chosen = _higherPriority(leftIndex, parent);
      chosen = _higherPriority(rightIndex, chosen);
      if(chosen == parent){
        return;
      }
      _swapValues(parent, chosen);
      print('index: $parent');
      print('  ${this.elements}');
      parent = chosen;
    }
  }

  void insert(E value){
    elements.add(value);
    int index = elements.length - 1;
    _siftUp(index);
  }

  E? remove(){
    if(isEmpty) return null;
    _swapValues(0, size - 1);
    final value = elements.removeLast();
    _siftDown(0);
    return value;
  }

  E? removeAt(int index){
    final lastIndex = size - 1 ;
    if(index < 0 || index > elements.length - 1) return null;
    if(lastIndex == index) return null;
    _swapValues(index, lastIndex);
    final value = elements.removeLast();
    _siftDown(index);
    _siftUp(index);
    return value;
  }

  int indexOf(E value, {int index = 0}){
    //1
    if(index < 0 || index >= size){
      return -1;
    }
    //2
    if(_firstHasHigherPriority(value, elements[index])){
      return -1;
    }
    //3
    if(value == elements[index]){
      return index;
    }
    //4
    // 4.a
    final left = indexOf(value, index:_leftChildIndex(index));
    // 4.b
    if(left != -1) return left;
    // 4.c
    return indexOf(value, index: _rightChildIndex(index));
  }

  //CHALLENGE 3
  void merge(List<E> list){
    elements.addAll(list);
    _buildHeap();
  }

}
