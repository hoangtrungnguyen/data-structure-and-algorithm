import 'package:data_structure_and_algorithm/heap_tree/heap.dart';
import 'package:test/test.dart';

void main() {
  group('insert', () {
    test('normal', () {
      final heap = Heap(elements: [10, 3, 4], priority: Priority.max);
      heap.insert(8);
      heap.insert(6);
      heap.insert(5);
      heap.insert(4);
      heap.insert(3);
      heap.insert(2);
      heap.insert(1);
      expect(heap.elements, [8, 6, 5, 4, 3, 2, 1]);
    });
    test('normal', () {
      final heap = Heap(elements: [10, 3, 4], priority: Priority.max);
      heap.insert(8);
      heap.insert(6);
      heap.insert(5);
      heap.insert(4);
      heap.insert(3);
      heap.insert(2);
      heap.insert(1);
      expect(heap.elements, [8, 6, 5, 4, 3, 2, 1]);
      heap.insert(7);
      expect(heap.elements, [8, 7, 6, 5, 4, 3, 2, 1]);
    });
  });
}
