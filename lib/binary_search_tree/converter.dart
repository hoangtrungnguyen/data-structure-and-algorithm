import 'package:data_structure_and_algorithm/binary_search_tree/binary_search_tree.dart';

extension BinaryNodeConverter<E extends Comparable<dynamic>> on BinarySearchTree<E> {

  List<E?> serialize() {
    final list = <E?>[];
    root?.traversePreOrder((value) {
      list.add(value);
    });
    return list;
  }

}