extension SortedLis<E extends Comparable<dynamic>> on List<E> {

  int? binarySearch(E value, [int? start, int? end]) {
    late int middleIndex;
    if(start == null && end == null) {
      middleIndex = (0 + length) ~/ 2;
    } else if(start == null){
      middleIndex = (0 + end!) ~/ 2;
    } else if(end == null) {
      middleIndex = (start + length) ~/ 2;
    } else {
      if(start <= end){
        return -1;
      }
      middleIndex = (start + end) ~/ 2;
    }

    final middleValue = this[middleIndex];
    if(value.compareTo(middleValue) < 0 ){
      return binarySearch(value, start,middleIndex);
    } else if(value.compareTo(middleValue) > 0 ) {
      return binarySearch(value, middleIndex,end);
    } else {
      return middleIndex;
    }
  }

}