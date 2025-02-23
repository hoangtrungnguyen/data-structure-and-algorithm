import 'package:data_structure_and_algorithm/dsa/heap_tree/heap.dart';

class Person implements Comparable<Person> {
  String name;
  int age;
  bool isMilitary;

  Person({
    required this.name,
    required this.age,
    required this.isMilitary,
  });

  @override
  int compareTo(Person other) {
    if (other.isMilitary) return 1;
    return age - other.age;
  }
}

void main() {
  final person1 = Person(name: "John", age: 32, isMilitary: false);
  final person2 = Person(name: "Black Throne", age: 33, isMilitary: true);
  final person3 = Person(name: "Torigana", age: 12, isMilitary: true);

  final heap = Heap<Person>(elements: [
    person1,
    person2,
    person3,
  ]);


}
