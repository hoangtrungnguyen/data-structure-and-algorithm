import 'package:collection/collection.dart';

void bubbleSort<E extends Comparable<dynamic>>(List<E> list){
  for(int i = 0; i < list.length - 1; i ++){
    var swapped = false;
   for(int j = 0; j < list.length - 1; j ++){
     if(list[j].compareTo(list[j + 1]) > 0){
       list.swap(j, j + 1);
       swapped = true;
     }
   }
   if(!swapped) return;
  }
}
