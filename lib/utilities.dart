import 'dart:math';

List<int> randomIntArray({int size = 1000}){
  int arraySize = size;
  final random = Random(); // Create a Random object for generating random numbers

  List<int> randomIntArray = List.generate(arraySize, (_) => random.nextInt(1000)); // Generate 1000 random integers between 0 and 999

  return randomIntArray;
}