import 'package:data_structure_and_algorithm/heap_tree/heap.dart';
import 'package:test/test.dart';

void main() {

  group('constructor', () {
    test("normal", () {
      var heap = Heap(elements: [1, 12, 3, 4, 1, 6, 8, 7]);

      expect(heap.elements, [12, 7, 8, 4, 1, 6, 3, 1]);

      while (!heap.isEmpty) {
        print(heap.remove());
      }

    });
  });
  group('insert', () {
    test('normal', () {
      final heap = Heap(priority: Priority.max);
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
      heap.insert(2);
      heap.insert(1);
      expect(heap.elements, [10, 8, 6, 5, 4, 3, 2, 1]);
      heap.insert(7);
      expect(heap.elements, [10, 8, 7, 6, 5, 4, 3, 2, 1]);
    });
  });

  group('indexOf', () {
    test('found', () {});

    test('not found', () {});
  });

  group('mean heap', () {
    test('ok', () {
      final actual = [1, 2, 3].isMeanHeap();
      expect(actual, true);
    });

    test('not okay', () {
      final actual = [4, 2, 3].isMeanHeap();
      expect(actual, false);
    });

    test('not okay', () {
      final actual = [1, 2, 3, 3].isMeanHeap();
      expect(actual, true);
    });
  });
}
