
import 'package:data_structure_and_algorithm/dsa/19_quick_sort/swapper.dart';

void main() {
  final list = [8, 2, 2, 8, 9, 5, 9, 2, 8];
  print('start: $list');
  // var range = _dutchFlagPartition(list, 0, list.length - 1);
  // range = _dutchFlagPartition(list, 0,range.start - 1);
  // range = _dutchFlagPartition(list, range.end + 1,list.length - 1 );
  quickSortDutchFlag(0, list.length - 1, list);
  print('--- end ---');
  print(list);
}

void quickSortDutchFlag<E extends Comparable>(int low, int high, List<E> list){
  if(low >= high) return;
  final range = _dutchFlagPartition(list, low, high);
  quickSortDutchFlag(low, range.start - 1, list);
  quickSortDutchFlag(range.end + 1, high , list);
}

class PivotPartition {
  int start;
  int end;

  PivotPartition(this.start, this.end);
}

PivotPartition _dutchFlagPartition<E extends Comparable>(
    List<E> list, int low, int high) {

  final pivot = list[high];

  int smaller = low; //pivot
  int equal = low;
  int larger = high;

  while(equal <= larger){
    if(list[equal].compareTo(pivot) == 0){
      equal += 1;
    } else if(list[equal].compareTo(pivot) < 0 ){
      list.swap(equal, smaller);
      equal += 1;
      smaller += 1;
    } else {
      list.swap(equal, larger);
      larger -= 1;
    }

  }

  print('smaller: $smaller');
  print('larger: $larger');
  return PivotPartition(smaller, larger);
}

int _medianOfThree<E extends Comparable>(List<E> list, int low, int high) {
  int center = (low + high) ~/ 2;

  if (list[low].compareTo(list[center]) > 0) {
    list.swap(low, center);
  }
  if (list[low].compareTo(list[high]) > 0) {
    list.swap(low, high);
  }
  if (list[center].compareTo(list[high]) > 0) {
    list.swap(center, high);
  }

  return center;
}
