void main(){
  final list = [8, 2, 10, 0, 9, 18, 9, -1, 5];
  final sorted = quicksortNaive(list);
  print(sorted);

}


List<E> quicksortNaive<E extends Comparable<dynamic>>( List<E> list) {
  if(list.length <= 2){
    return list;
  }
  final pivot = list[0];
  final smallerValues = list.where((e) => e.compareTo(pivot) < 0).toList();
  final biggerValues = list.where((element) => element.compareTo(pivot) > 0).toList();

  // final result = <E>[];
  // result.addAll(quicksortNaive(smallerValues));
  // result.add(pivot);
  // result.addAll(quicksortNaive(biggerValues));
  // return result;

  return [
   ...quicksortNaive(smallerValues),
    pivot,
    ...quicksortNaive(biggerValues)
  ];
}

