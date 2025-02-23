
import 'package:data_structure_and_algorithm/dsa/binary_search_tree/auto_complete/auto_complete.dart';
import 'package:test/test.dart';

void main(){
  test("Insert words", (){
    final tree = AutoCompletionBinarySearchTree();
    tree.insert("word");
    tree.insert("word2");
    tree.insert("word3");
    tree.insert("word4");
    tree.insert("word5");
    print(tree);
  });
}