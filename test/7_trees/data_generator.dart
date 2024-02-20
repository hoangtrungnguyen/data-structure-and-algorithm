import 'package:data_structure_and_algorithm/tree/tree_node.dart';

class DataGenerator {
  static TreeNode<int> buildTree() {
    return TreeNode(15)
      ..children.addAll([
        TreeNode(1)
          ..children.addAll([
            TreeNode(1),
            TreeNode(5),
            TreeNode(0),
          ]),
        TreeNode(17)
          ..children.addAll([
            TreeNode(2),
          ]),
        TreeNode(20)
          ..children.addAll([
            TreeNode(5),
            TreeNode(7),
          ]),
      ]);
  }

}