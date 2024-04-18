class Solution {

  String longestPalindrome(String s) {
    final length = s.length;
    int maxLength = 0;
    String longestPalindrome = s[0];

    for (int i = 1; i < length - 1; i++) {
      int lower = i - 1;
      int upper = i + 1;
      String result = s[i];
      while (s[lower] == s[upper]) {
        result = '${s[lower]}$result${s[upper]}';
        // print('odd - result: $result');
        if (result.length >= maxLength) {
          longestPalindrome = result;
          maxLength = result.length;
        }
        lower -= 1;
        upper += 1;
        if (lower < 0 || upper >= length) {
          break;
        }
      }
    }
    //even length Palindrome
    for (int i = 1; i < length; i += 1) {
      // print('i = $i ---');
      String mid = '${s[i - 1]}${s[i]}';

      if (mid[0] != mid[1]) {
        continue;
      }

      if (mid[0] == mid[1]) {
        if (mid.length > maxLength) {
          longestPalindrome = mid;
          maxLength = 2;
        }
      }

      int lower = i - 2;
      int upper = i + 1;

      if (lower < 0 || upper >= length) {
        continue;
      }
      String result = mid;
      while (s[lower] == s[upper]) {
        result = '${s[lower]}$result${s[upper]}';

        if (result.length >= maxLength) {
          longestPalindrome = result;
          maxLength = result.length;
        }
        lower -= 1;
        upper += 1;
        if (lower < 0 || upper >= length) {
          break;
        }
      }
    }

    return longestPalindrome;
  }
  // String longestPalindrome(String s) {
  //   final length = s.length;
  //   int maxLength = 0;
  //   String longestPalindrome = s[0];
  //
  //
  //   for (int i = 1; i < length ; i++) {
  //     int lower = i - 1;
  //     int upper = i + 1;
  //     if (lower < 0 || upper >= length) {
  //       continue;
  //     }
  //
  //     String result = s[i];
  //     while (s[lower] == s[upper]) {
  //       result = '${s[lower]}$result${s[upper]}';
  //       // print('odd - result: $result');
  //       if (result.length >= maxLength) {
  //         longestPalindrome = result;
  //         maxLength = result.length;
  //       }
  //       lower -= 1;
  //       upper += 1;
  //       if (lower < 0 || upper >= length) {
  //         break;
  //       }
  //     }
  //
  //     lower = i - 2;
  //     upper = i + 1;
  //
  //     result = '${s[i - 1]}${s[i]}';
  //
  //     if (result[0] == result[1] && maxLength < 2) {
  //       longestPalindrome = result;
  //       maxLength = 2;
  //     }
  //
  //     if (lower < 0 || upper >= length || s[i - 1] != s[i]) {
  //       continue;
  //     }
  //
  //     while (s[lower] == s[upper]) {
  //       result = '${s[lower]}$result${s[upper]}';
  //       if (result.length >= maxLength) {
  //         longestPalindrome = result;
  //         maxLength = result.length;
  //       }
  //       lower -= 1;
  //       upper += 1;
  //       if (lower < 0 || upper >= length) {
  //         break;
  //       }
  //     }
  //   }
  //
  //   return longestPalindrome;
  // }
}

void main() {
  print("ODD");
  print('case 0');
  final case0 = Solution().longestPalindrome('abcbe');
  // print("actual: $case0, expect: bcb");
  //
  // print('case 1');
  // final case1 = Solution().longestPalindrome('abaa');
  // print("actual: $case1, expect: aba");
  //
  // print('case 2');
  // final case2 = Solution().longestPalindrome('abaaaaa');
  // print("actual: $case2, expect: aaaaa");
  // print('case 3');
  // final case3 = Solution().longestPalindrome('abaaaccbbabbcc');
  // print("actual: $case3, expect: abaaaccbbabbcc");
  // print('----');
  // print('EVEN');
  // print('case 4');
  // final case4 = Solution().longestPalindrome('abbaa');
  // print("actual: $case4, expect: abba");
  // print('case 4_2');
  // final case4_2 = Solution().longestPalindrome('abbaaaaaaaab');
  // print("actual: $case4_2, expect: baaaaaaaab");
  //
  // print('---');
  // print('ABNORMAL cases');
  // final case5 = Solution().longestPalindrome('abc');
  // print(case5);
}
