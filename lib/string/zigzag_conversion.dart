import 'dart:io';
import 'dart:math' as math;
//https://leetcode.com/problems/zigzag-conversion/description/

class Solution {
  String convert(String s, int numRows) {
    if(numRows == 1){
      return s;
    }
    int i = 0;
    int j = 0;
    List<String> chars = s.split('');
    List<List<String>> matrix = List.generate(
        numRows, (index) => List.generate((s.length / 2).ceil(), (index) => ''));
    String result = '';
    while (chars.isNotEmpty) {
      if (i == numRows && i > 1) {
        i -= 2;

        while (chars.isNotEmpty && i >= 0) {
          j += 1;
          final char = chars.removeAt(0);
          matrix[i][j] = char;
          i--;
        }
        i+= 2;
      }


      if (chars.isEmpty) {
        break;
      }
      // print('\n${chars[i]}');
      final char = chars.removeAt(0);
      matrix[i][j] = char;
      i++;
    }

    for (var row in matrix) {
      for (var element in row) {
        if(element.isNotEmpty) {
          result += element;
        }
      }
    }
    printMatrix(matrix);

    return result;
  }
}

void main() {

  print('result: ${Solution().convert('PAYPALISHIRING', 3)}');
  print('result: ${Solution().convert('PAYPALISHIRING', 2)}');
  print(Solution().convert('PAYPALISHIRING', 1));
  print(Solution().convert('PAYPALISHIRING', 4));
  print(Solution().convert('P', 4));
  // print(Solution().convert('PAYPALISHIRING', 10000));
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
