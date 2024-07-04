import 'dart:math' as math;

import 'package:data_structure_and_algorithm/utilities.dart';

void main() {
  List<int> randomArray = randomIntArray();

  Stopwatch stopwatch = Stopwatch()..start();
  randomArray.radixSort();
  stopwatch.stop();
  Duration duration = stopwatch.elapsed;
  print("Time taken: ${duration.inMicroseconds} microseconds");
}

extension RadixSort on List<int> {
  List<int> radixSort() {
    int base = 10;
    var done = false;
    var place = 1;
    while(!done) {
      // print("---- ROUND $place ----");
      done = true;

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
          done = false;
        }

      }

      //increase the base from. 10 -> 100; 100 -> 1000
      place *= 10;
      // clear current list
      clear();
      //flatten elements in buckets into single list
      addAll(buckets.expand((element) => element));
    }

    return this;
  }
}
