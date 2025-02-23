import 'package:data_structure_and_algorithm/dsa/binary_search_tree/challenge.dart';
import 'package:test/test.dart';

void main() {

  test("Normal case", (){
    final result = isSubArray([1, null, 2, 3], [null, 2]);
    expect(result, true);
  });

  test("Ab-normal case", (){
    final result = isSubArray([1, null, 2, 3], [3, 2]);
    expect(result, false);
  });

  test("Empty sub-array", (){
    final result = isSubArray([1, null, 2, 3], <int?>[]);
    expect(result, true);
  });

  test("Sub-array at head", (){
    final result = isSubArray([1, null, 2, 3], <int?>[1, null]);
    expect(result, true);
  });


  test("Sub-array at tail", (){
    final result = isSubArray([1, null, 2, 3], <int?>[2, 3]);
    expect(result, true);
  });

}