import 'package:data_structure_and_algorithm/dsa/15_basic_sorting_algorithm/insertion_sort.dart';
import 'package:test/test.dart';

void main(){
  test('case 1', () {
    var list = [5];
    insertionSort(list);
    expect(list, [5]);
    print(list);
  });

  test('case 1', () {
    var list = [5, 2, 1, 7];
    insertionSort(list);
    expect(list, [1, 2, 5, 7]);
    print(list);
  });
}