import 'package:test/test.dart';

//priority = MIN
void main(){

  test('test 1', (){
    final sample = [1,2,3];
    final element = 4;
    var index = sample.indexWhere((e) => e.compareTo(element) > 0);
    if(index < 0) index = sample.length;
    expect(index, 3);
    sample.insert(index, element);
    expect(sample.last, 4);
  });

  test('test 1', (){
    final sample = [1,2,7];
    final element = 4;
    var index = sample.indexWhere((e) => e.compareTo(element) > 0);
    if(index < 0) index = sample.length;
    expect(index, 2);
    sample.insert(index, element);
    expect(sample.last, 7);
  });
}