void main() {
  final list = [8,3,1,2,4,5,18, 9];
  quicksortLomuto(list, 0, list.length - 1);
  print(list);
}

extension Swappable<E> on List<E> {
  void swap(int indexA, int indexB) {
    if (indexA == indexB) return;
    final temp = this[indexA];
    this[indexA] = this[indexB];
    this[indexB] = temp;
  }
}

void quicksortLomuto<E extends Comparable<dynamic>>(
    List<E> list, int low, int high) {
  if (low >= high) {
    return;
  }
  final pivotIndex = _pivotIndex(low, high, list);
  quicksortLomuto(list, low, pivotIndex - 1);
  quicksortLomuto(list, pivotIndex + 1, high);
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
