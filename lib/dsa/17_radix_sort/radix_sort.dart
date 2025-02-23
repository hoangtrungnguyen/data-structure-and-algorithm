import 'dart:math' as math;

import 'package:data_structure_and_algorithm/utilities.dart';

void main() {
  print( 1234 ~/ 10);
  final list = [46, 500, 123, 1342225, 13, 999];
  list.radixSort();
  print(list);
}


///Sorting using LSD (least significant digit)
///Visualize the data to be sorted
///  13
// 1345
//  459
//   46
//  500
//  999
extension RadixSort on List<int> {
  void radixSort() {
    int base = 10;
    var done = length;
    var place = 1;
    while( done > 0) {
      // print("---- ROUND $place ----");
      done = 0;

      final buckets = List.generate(base, (index) => <int>[], growable: false);
      for (final number in this) {
        // ROUND 1
        // remainingPart: 192 ~/ 1 -> 192
        // digit: 192 % 10 = 2
        // ROUND 2
        // remainingPart: 192 ~/ 10 -> 19
        // digit: 19 % 10 = 9
        final remainingPart =  number ~/ place;
        final digit = remainingPart % base;
        //add the number to desirable index
        buckets[digit].add(number);
        // If there is any remaining part larger than zero,
        // which means we haven't loop through all the digits
        if(remainingPart ~/ base > 0){
          done += 1;
        }

      }

      //increase the base from. 10 -> 100; 100 -> 1000
      place *= 10;
      // clear current list
      clear();
      //flatten elements in buckets into single list
      addAll(buckets.expand((element) => element));
    }
  }
}


extension Digits on int {
  static const _base = 10;
  // count how many digits are there in the number
  int digits() {
    var count = 0;
    var number = this;
    while(number != 0){
      count += 1;
      number ~/= _base;
    }
    return count;
  }

  int? digitAt(int position){
    if( position >= digits()) {
      return null;
    }

    var number = this;
    // EXAMPLE
    // position = 0
    // 1234 ~/ 10 = 123
    // 123 ~/ 10 = 12
    // 12 ~/ 10 = 1
    // 1 ~/ 10 = 0 -> break here and return 1
    while( number ~/ math.pow(_base, position + 1) != 0){
      number ~/= _base;
    }

    return number % _base;
  }
}

/// Sort by Most Significant Digit (MSD)
/// Visualize the data to be sorted
/// 431
/// 123
/// 1
/// 33
extension MsdRadixSort on List<int> {

  //get the number of digit of the biggest number in the list
  int maxDigits() {
    if(isEmpty) return 0;
    // comparing two digits next to each other then get a the bigger number.
    // Therefore, we can get the maximum number in the array.
    return reduce(math.max).digits();
  }


  void lexicographicalSort(){
    final sorted = _msdRadixSorted(this, 0);
    clear();
    addAll(sorted);
  }

  List<int> _msdRadixSorted(List<int> list, int position) {
    if(list.length < 2 || position >= list.maxDigits()){
      return list;
    }

    final buckets = List.generate(10, (_) => <int>[]);

    // store values that have fewer digit than current position
    // EXAMPLE:
    // The data
    // [38, 13, 13432, 23, 812]
    // The bucket after recursive the depth level 2
    // The priority bucket in depth level 2: [13]
    var priorityBucket = <int>[];

    for(var number in list){
      // choose digit of the number at position
      final digit = number.digitAt(position);
      // if there is no digit at position. We add the number
      // to the priority bucket
      if(digit == null){
        priorityBucket.add(number);
        continue;
      }
      //add the number to the bucket list
      buckets[digit].add(number);
    }

    final bucketOrder = buckets.reduce((result, bucket){
      if(bucket.isEmpty) return result;
      // The data: [33, 421, 125, 124, 12, 1433]
      // Recursive depth level 0th:
      // The position is 0
      // The buckets will look like this:
      //  - 1: [125, 124, 12, 1433]
      //  - 2: []
      //  - 3: [33]
      //  - 4: [421]
      //  ... (other bucket)
      // * The priority bucket: [] (empty)
      // Recursive depth level 1st:
      // Here we we have the list to be sorted: [125, 124, 12, 1433], [33], [421]
      // In this level, we move to the next position in the number which is 1
      // Here, we consider the first group only cause it has more than 2 elements.
      // The buckets will look like this:
      //  - 1: []
      //  - 2: [125, 124, 12]
      //  - 3: []
      //  - 4: [1433]
      // * The priority bucket: [] (empty)
      // Recursive depth level 2nd:
      // The list to be sorted at this level: [125, 124] and [1433].
      // We will consider the first group  in this level.
      // We also move to the next position which is 2
      // The buckets list:
      //  - 1: []
      //  - 2: []
      //  - 3: []
      //  - 4: [124]
      //  - 5: [125]
      // Because the is no element at the position 2 of the number '12'.
      // Therefore, we will add the number '12' the the priority bucket.
      // * The priority bucket: [12].
      //---
      // After reaching the base condition, we will move back to each level
      // then combine all the elements in to a single list.
      final sorted = _msdRadixSorted(bucket, position + 1);
      return result..addAll(sorted);
    });

    return priorityBucket..addAll(bucketOrder);
  }
}