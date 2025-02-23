import 'package:data_structure_and_algorithm/dsa/binary_search/min_max_in_nearly_sorted_array.dart';
import 'package:data_structure_and_algorithm/dsa/binary_search/rotate_sorted_array.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('rotate with temp array', () {
    test('rotate 0 time', () {
      final array = [1, 2, 3, 4, 5];
      final actual = array.rotateArrayTemp(0);
      expect(actual, [1, 2, 3, 4, 5]);
    });

    test('rotate odd times', () {
      final array = [1, 2, 3, 4, 5];
      final actual = array.rotateArrayTemp(3);
      expect(actual, [3, 4, 5, 1, 2]);
    });

    test('rotate even times', () {
      final array = [1, 2, 3, 4, 5];
      final actual = array.rotateArrayTemp(4);
      expect(actual, [2, 3, 4, 5, 1]);
    });

    test('rotate empty array', () {
      final array = <int>[];
      final actual = array.rotateArrayTemp(4);
      expect(actual, []);
    });
  });

  group('rotateReversal', () {
    test('rotate 0 time', () {
      final array = [1, 2, 3, 4, 5];
      final actual = array.rotateReversal(0);
      expect(actual, [1, 2, 3, 4, 5]);
    });

    test('rotate odd times', () {
      final array = [1, 2, 3, 4, 5];
      final actual = array.rotateReversal(3);
      expect(actual, [3, 4, 5, 1, 2]);
    });

    test('rotate even times', () {
      final array = [1, 2, 3, 4, 5];
      final actual = array.rotateReversal(4);
      expect(actual, [2, 3, 4, 5, 1]);
    });

    test('rotate empty array', () {
      final array = <int>[];
      final actual = array.rotateReversal(4);
      expect(actual, []);
    });
  });

  group('finding min value in rotated sorted array', () {
    test('find min odd rotation times', () {
      final array = [3, 4, 5, 1, 2];
      final actual = array.findMinimumInRotatedSortedArr();
      expect(actual, 1);
    });
    test("find min in even rotation times", () {
      final array = [2, 3, 4, 5, 1];
      final actual = array.findMinimumInRotatedSortedArr();
      expect(actual, 1);
    });


    test("multiple element have same value", () {
      final array = [1, 2, 2, 2, 3, 4, 5, 1];
      final actual = array.findMinimumInRotatedSortedArr();
      expect(actual, 1);
    });

    test("multiple element have same min value", () {
      final array = [-1, 0, 0, 2, 2, 2, 2, 3, 4, 5, -1];
      final actual = array.findMinimumInRotatedSortedArr();
      expect(actual, -1);
    });
  });

  group('finding max value in rotated sorted array', () {
    test('find min odd rotation times', () {
      final array = [3, 4, 5, 1, 2];
      final actual = array.findMaxInRotatedSortedArr();
      expect(actual, 5);
    });
    test("find min in even rotation times", () {
      final array = [2, 3, 4, 5, 1];
      final actual = array.findMaxInRotatedSortedArr();
      expect(actual, 5);
    });


    test("multiple element have same value", () {
      final array = [1, 2, 2, 2, 3, 4, 5, 1, 1, 1];
      final actual = array.findMaxInRotatedSortedArr();
      expect(actual, 5);
    });

    test("multiple element have same min value", () {
      final array = [-1, 0, 0, 2, 2, 2, 2, 3, 4, 5, -1];
      final actual = array.findMaxInRotatedSortedArr();
      expect(actual, 5);
    });
  });
}
