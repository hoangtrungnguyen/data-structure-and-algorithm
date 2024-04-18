import 'package:data_structure_and_algorithm/dynamic_programming/longest_palindrome.dart';
import 'package:test/test.dart';

void main() {
  final solution = Solution();
  test('case 0', () {
    final case0 = solution.longestPalindrome('abcbe');
    expect(case0,'bcb');
  });

  test('case 1', () {
    final case1 = solution.longestPalindrome('abaa');
    expect(case1,'aba');
  });

  test('case 2', () {
    final actual = solution.longestPalindrome('abaaaaa');
    expect(actual,'aaaaa');
  });

  test('case 3', () {
    final actual = solution.longestPalindrome('abaaaccbbabbcc');
    expect(actual,'ccbbabbcc');
  });

  test('case 4', () {
    final actual = solution.longestPalindrome('abbaa');
    expect(actual,'abba');
  });

  test('case 5', () {
    final actual = solution.longestPalindrome('abbaaaaaaaab');
    expect(actual,'baaaaaaaab');
  });

  test('case 6', () {
    final actual = solution.longestPalindrome('abc');
    expect(actual,'a');
  });

  test('case 7', () {
    final actual = solution.longestPalindrome('cbbd');
    expect(actual,'bb');
  });

  test('case 8', () {
    final actual = solution.longestPalindrome('bb');
    expect(actual,'bb');
  });

  test('case 9', () {
    final actual = solution.longestPalindrome('abb');
    expect(actual,'bb');
  });

}
