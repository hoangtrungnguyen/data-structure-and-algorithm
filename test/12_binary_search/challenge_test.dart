import 'package:data_structure_and_algorithm/binary_search/list_base_binary_search.dart';
import 'package:test/test.dart';

void main() {
  group('recursive style binary search', () {
    test('normal', () {
      final sortedList = <int>[-2, 0, 1, 2, 4, 6, 7, 9];
      final index = sortedList.whileLoopBinarySearch(2);
      expect(index, 3);
    });

    test('Not in the list. Lower than bound limit', () {
      final sortedList = <int>[-2, 0, 1, 2, 4, 6, 7, 9];
      final index = sortedList.whileLoopBinarySearch(-12);
      expect(index, -1);
    });

    test('Not in the list. Upper than bound limit', () {
      final sortedList = <int>[-2, 0, 1, 2, 4, 6, 7, 9];
      final index = sortedList.whileLoopBinarySearch(12);
      expect(index, -1);
    });

    test('Not in the list. Inside bound limit', () {
      final sortedList = <int>[-2, 0, 1, 2, 4, 6, 7, 9];
      final index = sortedList.whileLoopBinarySearch(5);
      expect(index, -1);
    });

    test("Un-sorted list", () {});
  });

  group('while loop binary search', () {
    test('normal', () {
      final sortedList = <int>[-2, 0, 1, 2, 4, 6, 7, 9];
      final index = sortedList.recursiveBinarySearch(2);
      expect(index, 3);
    });

    test('Not in the list. Lower than bound limit', () {
      final sortedList = <int>[-2, 0, 1, 2, 4, 6, 7, 9];
      final index = sortedList.recursiveBinarySearch(-12);
      expect(index, -1);
    });

    test('Not in the list. Upper than bound limit', () {
      final sortedList = <int>[-2, 0, 1, 2, 4, 6, 7, 9];
      final index = sortedList.recursiveBinarySearch(12);
      expect(index, -1);
    });

    test('Not in the list. Inside bound limit', () {
      final sortedList = <int>[-2, 0, 1, 2, 4, 6, 7, 9];
      final index = sortedList.recursiveBinarySearch(5);
      expect(index, -1);
    });

    test("Un-sorted list", () {});
  });

  group('get range', () {
    test("Range start and stop at a same index. Example: Range(2,2)", () {
      final sortedList = <int>[-2, 0, 1, 2, 4, 6, 7, 9];
      final actual = sortedList.findRange(1);
      expect(actual, Range(2, 2));
    });

    test("Range start and stop at the middle of the list. Range(2,4)", () {
      final sortedList = <int>[-2, 0, 1, 1, 1, 1, 2, 4, 6, 7, 9];
      final actual = sortedList.findRange(1);
      expect(actual, Range(2, 5));
    });

    test("Not found", () {
      final sortedList = <int>[1, 1, 1, 1, 2, 4, 6, 7, 9];
      final actual = sortedList.findRange(12);
      expect(actual, null);
    });

    test('Range start from index 0', () {
      final sortedList = <int>[1, 1, 1, 1, 2, 4, 6, 7, 9];
      final actual = sortedList.findRange(1);
      expect(actual, Range(0, 3));
    });

    test('Range end at index length - 1', () {
      final sortedList = <int>[1, 2, 3, 4, 5, 7, 7, 7, 7];
      final actual = sortedList.findRange(7);
      expect(actual, Range(5, 8));
    });
  });

  group('get range using two recursive binary search', (){
    test("Range start and stop at a same index. Example: Range(2,2)", () {
      final sortedList = <int>[-2, 0, 1, 2, 4, 6, 7, 9];
      final actual = sortedList.getRange2(1);
      expect(actual, Range(2, 2));
    });

    test("Range start and stop at the middle of the list. Range(2,4)", () {
      final sortedList = <int>[-2, 0, 1, 1, 1, 1, 2, 4, 6, 7, 9];
      final actual = sortedList.getRange2(1);
      expect(actual, Range(2, 5));
    });

    test("Not found", () {
      final sortedList = <int>[1, 1, 1, 1, 2, 4, 6, 7, 9];
      final actual = sortedList.getRange2(12);
      expect(actual, null);
    });

    test('Range start from index 0', () {
      final sortedList = <int>[1, 1, 1, 1, 2, 4, 6, 7, 9];
      final actual = sortedList.getRange2(1);
      expect(actual, Range(0, 3));
    });

    test('Range end at index length - 1', () {
      final sortedList = <int>[1, 2, 3, 4, 5, 7, 7, 7, 7];
      final actual = sortedList.getRange2(7);
      expect(actual, Range(5, 8));
    });
  });
}
