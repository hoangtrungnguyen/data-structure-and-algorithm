import 'package:data_structure_and_algorithm/binary_search/rotate_sorted_array.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main(){
  group('rotate with temp array', () {

    test('rotate 0 time', (){
      final array = [1, 2, 3, 4, 5];
      final actual = array.rotateArrayTemp(0);
      expect(actual, [1,2,3,4,5]);
    });

    test('rotate odd times', (){
      final array = [1, 2, 3, 4, 5];
      final actual = array.rotateArrayTemp(3);
      expect(actual, [3,4,5,1,2]);
    });

    test('rotate even times', (){
      final array = [1, 2, 3, 4, 5];
      final actual = array.rotateArrayTemp(4);
      expect(actual, [2,3,4,5,1]);
    });

    test('rotate empty array', (){
      final array = <int>[];
      final actual = array.rotateArrayTemp(4);
      expect(actual, []);
    });
  });

  group('rotateReversal', (){
    test('rotate 0 time', (){
      final array = [1, 2, 3, 4, 5];
      final actual = array.rotateReversal(0);
      expect(actual, [1,2,3,4,5]);
    });

    test('rotate odd times', (){
      final array = [1, 2, 3, 4, 5];
      final actual = array.rotateReversal(3);
      expect(actual, [3,4,5,1,2]);
    });

    test('rotate even times', (){
      final array = [1, 2, 3, 4, 5];
      final actual = array.rotateReversal(4);
      expect(actual, [2,3,4,5,1]);
    });

    test('rotate empty array', (){
      final array = <int>[];
      final actual = array.rotateReversal(4);
      expect(actual, []);
    });
  });


  group('finding value in rotated sorted array',(){

  });


}