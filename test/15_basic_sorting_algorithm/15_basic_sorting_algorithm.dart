import 'package:test/test.dart';

import 'bubble_sort.dart' as bubble_sort;
import 'selection_sort.dart' as selection_sort;

void main() {

  group('basic sorting algorithm', () {
    group('bubble sort', (){
      bubble_sort.main();
    });

    group('selection sort', (){
      selection_sort.main();
    });

  });
}
