import 'dart:developer';
import 'dart:math';


void main() {
  print(decimalToBinary(19));
  print(decimalToBinary(10));
}
String decimalToBinary(int num) {
  //param: num
//
// upper = 0
// i = 0
//
// while num > upper:
// 	upper = 2^i
// 	i += 1
//
// result = []
// while i >= 0:
// 	if num > upper:
// 		result.insertLast(1)
// 		num = num - upper
// 		i -= 1
// 	else
// 		i -= 1
// 		result.insertLast(0)
//

  int upper = 0;
  int i = 1;
  while (num > upper) {
    upper = pow(2, i).toInt();
    i += 1;
  }
  i -= 1;

  print('upper $upper');
  print('i $i');

  final result = [];
  int data = num;
  while( i > 0){
    if(data >= upper){
      result.insert(0, 1);
      data = data - upper;
      i -= 1;
    } else {
      i -= 1;
      result.insert(0,0);
      upper  = pow(2, i).toInt();
    }
  }


  return '$result';
}
