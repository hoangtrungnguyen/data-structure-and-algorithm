import 'package:data_structure_and_algorithm/dsa/heap_tree/heap.dart';

extension FindNthMinValue<E extends Comparable> on List<E>{
  
  E findNthMinValueIndex(int k){
    final heap = Heap(elements: List.of(this), priority: Priority.min);
    E? value;
    for(int i = 0; i < k; i ++){
      value = heap.remove();
    }
    return value!;
  }
  
}
void main(){
  final integers = [3, 10, 18, 5, 21, 100];
  print(integers.findNthMinValueIndex( 3));
  //
  final heap = Heap(elements: [3, 10, 18, 5, 21, 100, -1, 2, 3], priority: Priority.min);

  // findNthMinValueIndex

}