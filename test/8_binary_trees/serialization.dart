import 'package:data_structure_and_algorithm/binary_tree/challenges.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import 'binary_tree_generator.dart';

//https://photos.app.goo.gl/9Ht14BNsXsyaqQAf8
void main() {
  group("serialization", () {
    test("single node tree", () {
      final tree = BinaryTreeGenerator.singleNodeTree();
      final actual = serialize(tree);
      expect(actual, [15, null, null]);
    });

    test("normal tree", () {
      final normal = BinaryTreeGenerator.normalTree();
      final actual = serialize(normal);
      expect(actual,
          [15, 10, 5, null, null, 12, null, null, 25, 17, null, null, null]);
    });
  });

  group("deserialization", () {
    test("empty tree", () {
      final list = BinaryTreeGenerator.createSingleElementSerializedDataList();
      final actual = deserialize(list);
      expect(actual, BinaryTreeGenerator.singleNodeTree());
    });

    test("normal tree", () {
      final list = BinaryTreeGenerator.createSerializedDataList();
      final actual = deserialize(list);
      expect(actual, BinaryTreeGenerator.normalTree());
    });
  });
}
