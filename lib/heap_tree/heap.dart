enum Priority { max, min }

class Heap<E extends Comparable<dynamic>> {
  late List<E> elements;
  Priority priority;

  Heap({List<E>? elements, this.priority = Priority.max}) {
    this.elements = (elements == null) ? [] : elements;
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

  void insert(E value){
    elements.add(value);
    int index = elements.length - 1;
    _siftUp(index);
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

  E? remove(){
    if(isEmpty) return null;
    _swapValues(0, size - 1);
    final value = elements.removeLast();
    _siftDown(0);
    return value;
  }

  void _siftDown(int index){
    var parent = index;
    while(true){
      int leftIndex =_leftChildIndex(index);
      int rightIndex = _rightChildIndex(index);
      int chosen = _higherPriority(index, leftIndex);
      chosen = _higherPriority(chosen, rightIndex);
      if(chosen == parent){
        return;
      }
      _swapValues(parent, chosen);
      parent = chosen;
    }
  }
}
