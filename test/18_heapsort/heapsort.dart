import 'package:data_structure_and_algorithm/dsa/18_heap-sort/heap_sort_desending.dart';
import 'package:test/test.dart';

void main() {
  group('heapsort descending', () {
    test("case 1", () {
      final list = [2, 1, 3, 4, 8];
      list.heapSortDescendingInPlace();
      print('final');
      print(list);
      expect(list, [8, 4, 3, 2, 1]);
    });
    test("case 2", () {
      final list = [2, 2, 1, 3, 4, 8];
      list.heapSortDescendingInPlace();
      print('final');
      print(list);
      expect(list, [8, 4, 3, 2, 2, 1]);
    });

    test("case 3", () {
      final list = [2];
      list.heapSortDescendingInPlace();
      print('final');
      print(list);
      expect(list, [2]);
    });

    test("case 4", () {
      final list = [1,1,1,1];
      list.heapSortDescendingInPlace();
      print('final');
      print(list);
      expect(list, [1,1,1,1]);
    });
  });
}
