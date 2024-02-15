import 'package:data_structure_and_algorithm/binary_tree/binary_node.dart';

extension BinaryNodeConverter<T> on BinaryNode<T> {

  List<T?> serialize() {
    final list = <T?>[];
    traversePreOrderWithNull((value) {
      list.add(value);
    });
    return list;
  }

}