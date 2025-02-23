import 'package:data_structure_and_algorithm/dsa/tree/challenge_print_each_level.dart';
import 'package:test/test.dart';

import 'data_generator.dart';

void main() {
  test("Normal Tree", () {
    final tree = DataGenerator.buildTree();
    final text = printEachLevel(tree);
    expect( text, "15 \n"
        "1 17 20 \n"
        "1 5 0 2 5 7 \n");
  });
}
