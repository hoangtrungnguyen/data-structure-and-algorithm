import 'dart:io';
import 'dart:math' as math;
//https://leetcode.com/problems/zigzag-conversion/description/

class Solution {
  String convert(String s, int numRows) {
    if(numRows == 1){
      return s;
    }
    int i = 0;
    int c = 0;
    List<String> matrix2 = List.generate(
        numRows, (index) => '');
    String result = '';
    while (c < s.length) {
      if (i == numRows && i > 1) {
        i -= 2;
        while (c < s.length && i >= 0) {
          final char = s[c];
          c ++;
          matrix2[i] += char;
          i--;
        }
        i+= 2;
      }

      if(c < s.length) {
        final char = s[c];
        c ++;
        matrix2[i] += char;
        i++;
      }
    }

    for (var row in matrix2) {
      result += row;
    }
    return result;
  }
}

void main() {

  print('result: ${Solution().convert('PAYPALISHIRING', 3)}');
  print('result: ${Solution().convert('PAYPALISHIRING', 2)}');
  print(Solution().convert('PAYPALISHIRING', 1));
  print(Solution().convert('PAYPALISHIRING', 4));
  print(Solution().convert('P', 4));
  print(Solution().convert('PAYPALISHIRINGANDFIGHTINGANDSHOOTING', 4));
  print(Solution().convert('PAYPALISHIRING', 10000));
}

// Function to print a matrix
void printMatrix(List<List<String>> matrix) {
  print('--- Matrix ---');
  for (var row in matrix) {
    for (var element in row) {
      stdout.write('$element '); // Print element followed by a space
    }
    print(''); // Move to the next line after each row
  }
}
