import 'package:data_structure_and_algorithm/dsa/16_merge_sort/merge_sort.dart';
import 'package:data_structure_and_algorithm/dsa/17_radix_sort/radix_sort.dart';
import 'package:data_structure_and_algorithm/utilities.dart';

void main(){
  print('RADIX SORT');
  List<int> randomArray = randomIntArray(size: 1000000);
  Stopwatch stopwatch = Stopwatch()..start();
  randomArray.radixSort();
  stopwatch.stop();
  Duration duration = stopwatch.elapsed;
  print("Time taken: ${duration.inMicroseconds} microseconds");
  print('end radix sort');

  print('MERGE SORT');
  List<int> randomArray2 = randomIntArray(size: 1000000);
  // print('randomArray2: $randomArray2');
  Stopwatch stopwatch2 = Stopwatch()..start();
  final result = mergeSort(randomArray2);
  stopwatch2.stop();
  Duration duration2 = stopwatch2.elapsed;
  print("Time taken: ${duration2.inMicroseconds} microseconds");
  print('end radix sort');

}
