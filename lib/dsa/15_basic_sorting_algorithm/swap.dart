extension SwappableList<E> on List<E>{
  void swap(int indexA, int indexB){
    final temp = this[indexB];
    this[indexB] = this[indexA];
    this[indexA] = temp;
  }
}