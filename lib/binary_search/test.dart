import 'package:data_structure_and_algorithm/binary_search/binary_search.dart';

void main() {
  List<num> sortedArray = [1, 2, 3, 4, 5];
  List<num> sortedArray2 = [0, 1, 2, 3, 4, 5];
  final middleIndex = sortedArray.binarySearch(1);
  print('${middleIndex!}');
  final middleIndex2 = sortedArray2.binarySearch(2);
  print('${middleIndex2!}');

  final list = [1, 5, 15, 17, 19, 22, 24, 31, 105, 150];
  var search31 = list.indexOf(31);
  var binarySearch31 = list.binarySearch(31);
  print('indexOf: $search31');
  print('binarySearch: $binarySearch31');

  search31 = list.indexOf(1);
  binarySearch31 = list.binarySearch(1);
  print('indexOf: $search31');
  print('binarySearch: $binarySearch31');

  search31 = list.indexOf(32);
  binarySearch31 = list.binarySearch(32);
  print('indexOf: $search31');
  print('binarySearch: $binarySearch31');


}
