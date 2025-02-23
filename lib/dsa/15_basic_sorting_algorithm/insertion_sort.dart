import 'package:collection/collection.dart';

void insertionSort<E extends Comparable<dynamic>>(List<E> list){
  for(int i = 0; i < list.length ; i ++){
    for(int j = i; j > 0 ; j -- ){
      if(list[j - 1].compareTo(list[j]) > 0){
        list.swap(j - 1, j);
      }  else {
        break;
      }
    }
  }
}

void insertionSortInRange<E extends Comparable<dynamic>>(List<E> list, int start, int end){
  for(int i = start; i <= end; i ++){
    for(int j = i; j > 0 ; j -- ){
      if(list[j - 1].compareTo(list[j]) > 0){
        list.swap(j - 1, j);
      }  else {
        break;
      }
    }
  }
}