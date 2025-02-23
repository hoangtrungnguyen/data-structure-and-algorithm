import 'package:data_structure_and_algorithm/dsa/queue/queue.dart';

void main() {
  final queue = QueueStack<String>();
  queue.enqueue('Ray');
  queue.enqueue('Brian');
  queue.enqueue('Eric');
  print(queue);
  queue.dequeue();
  print(queue);
  queue.peek;
  print(queue);
  queue.dequeue();
  print(queue);
  queue.dequeue();
  queue.dequeue();
  print(queue);
  queue.enqueue('Eric');
  queue.enqueue('Eric1');
  queue.enqueue('Eric2');
  queue.enqueue('Eric3');
  print(queue);
  queue.dequeue();
  print(queue);
}
