import 'package:data_structure_and_algorithm/heap_tree/heap.dart';

class FindNthMinValue<E extends Comparable> {
  
  E findNthMinValueIndex(List<E> list, int k){
    final heap = Heap(elements: list, priority: Priority.min);
    E? value;
    for(int i = 0; i < k; i ++){
      value = heap.remove();
    }
    return value!;
  }
  
}
void main(){
  // final integers = [3, 10, 18, 5, 21, 100];
  // print(FindNthMinValue().findNthMinValueIndex(integers, 3));
  //
  final heap = Heap(elements: [3, 10, 18, 5, 21, 100, -1, 2, 3], priority: Priority.min);

}