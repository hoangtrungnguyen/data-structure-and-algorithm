
import 'priority_queue.dart';

void main(){
  var priorityQueue = PriorityQueue(
    elements: [1, 12, 3, 4, 1, 6, 8, 7],
  );
  while(!priorityQueue.isEmpty){
    print(priorityQueue.dequeue());
  }



}