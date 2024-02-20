import 'package:data_structure_and_algorithm/avl_tree/avl_node.dart';
import 'package:data_structure_and_algorithm/avl_tree/avl_tree.dart';
import 'package:test/scaffolding.dart';

import 'generator.dart';

void main(){

  group('Left Rotation', () {
    test('Normal case', (){
      AvlNode<int>? initial = AVLGenerator.buildTree([5, 3, 8, 7]);

      final tree = AvlTree<num>();
      tree.root = initial;


      AvlNode<int>? expected = AVLGenerator.buildTree([7, 5, 8, 3]);


    });

    test('Rotation at Root', (){

    });

    test('Balance Factor Correction', (){

    });

    test('Subtree Preservation', (){

    });
  });

  group('Right Rotation', () {

  });
}