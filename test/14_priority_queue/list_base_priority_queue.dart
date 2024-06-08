import 'package:data_structure_and_algorithm/14_priority_queue/list_base_priority_queue.dart';
import 'package:data_structure_and_algorithm/14_priority_queue/priority_queue.dart';
import 'package:test/test.dart';

void main() {
  group('constructor', () {
    test('case 1', () {
      final listQueue = ListBasePriorityQueue(elements: [4, 1, 5]);
      expect(listQueue.elements, [5, 4, 1]);
    });

    test('case 2', () {
      final listQueue =
          ListBasePriorityQueue(elements: [4, 1, 5], priority: Priority.min);
      expect(listQueue.elements, [1, 4, 5]);
    });
  });

  group('enqueue', () {
    test('case 1', () {
      final listQueue = ListBasePriorityQueue();
      listQueue.enqueue(2);
      listQueue.enqueue(5);
      listQueue.enqueue(1);

      expect(listQueue.elements, [5, 2, 1]);
    });

    test('case 2', () {
      final listQueue = ListBasePriorityQueue(priority: Priority.min);
      listQueue.enqueue(2);
      listQueue.enqueue(5);
      listQueue.enqueue(1);

      expect(listQueue.elements, [1, 2, 5]);
    });
  });
}
