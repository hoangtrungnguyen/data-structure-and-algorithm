import 'package:data_structure_and_algorithm/dsa/15_basic_sorting_algorithm/selection_sort.dart';
import 'package:test/test.dart';

void main(){
  test('selection sort case 1', () {
    var list = [5];
    selectionSort(list);
    expect(list, [5]);
    print(list);
  });

  test('selection sort case 2', () {
    var list = [5, 2, 1, 7];
    selectionSort(list);
    expect(list, [1, 2, 5, 7]);
    print(list);
  });
}