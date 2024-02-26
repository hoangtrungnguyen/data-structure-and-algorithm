
import 'dart:math';

import 'package:data_structure_and_algorithm/avl_tree/avl_node.dart';
import 'package:data_structure_and_algorithm/avl_tree/avl_tree.dart';
import 'package:data_structure_and_algorithm/avl_tree/challenge/number_of_leaves.dart';
import 'package:test/test.dart';

import 'generator.dart';

void main() {
  test("perfect balance tree", (){
    AvlTree<num>? initial = AVLGenerator.generateBalancedTree([-1 , 1, 2,]);
    print(initial);
    final actual = initial.root?.countLeaves();
    expect(actual, 2);
  });

  test("perfect balance tree 2", (){
    AvlTree<num>? initial = AVLGenerator.generateBalancedTree([-1 , 1, 2, 3 ,4, 5, 6]);
    print(initial);
    final actual = initial.root?.countLeaves();
    expect(actual, 4);
  });


  test("good balance tree", (){
    AvlTree<num>? initial = AVLGenerator.generateBalancedTree([1, 5, 3, 6, 8, 7]);
    print(initial);
    final actual = initial.root?.countLeaves();
    expect(actual, 3);
  });

  test("5 digits", (){
    AvlTree<num>? initial = AVLGenerator.generateBalancedTree([1, 5, 3, 8, 7]);
    print(initial);
    final actual = initial.root?.countLeaves();
    expect(actual, 3);
  });

  test("6 digits", (){
    AvlTree<num>? initial = AVLGenerator.generateBalancedTree([1, 5, 3, 8, 7, -23]);
    print(initial);
    final actual = initial.root?.countLeaves();
    expect(actual, 3);
  });


  test("7 digits", (){
    AvlTree<num>? initial = AVLGenerator.generateBalancedTree([1, 5, 3, 8, 7, 9, 12]);
    print(initial);
    final actual = initial.root?.countLeaves();
    expect(actual, 3);
  });

  test("8 digits", (){
    AvlTree<num>? initial = AVLGenerator.generateBalancedTree([1, 5, 3, 8, 7, 9, 12, -2]);
    print(initial);
    final actual = initial.root?.countLeaves();
    expect(actual, 3);
  });

  test("9 digits", (){
    AvlTree<num>? initial = AVLGenerator.generateBalancedTree([1, 5, 3, 8, 7, 9, 12, -2, -6]);
    print(initial);
    final actual = initial.root?.countLeaves();
    expect(actual, 4);
  });

  test("10 digits", (){
    print("10 digits");
    AvlTree<num>? initial = AVLGenerator.generateBalancedTree([1, 5, 3, 8, 7, 9, 12, -2, -6]);
    print(initial);
    final actual = initial.root?.countLeaves();
    expect(actual, 5);
  });

  test("16 digits", (){
    print("16 digits");
    AvlTree<num>? initial = AVLGenerator.generateBalancedTree([1, 5, 3, 8, 7, 9, 12, -2, -6, -23, 123, 43, 89, 45, -90]);
    print(initial);
    final actual = initial.root?.countLeaves();
    expect(actual, 6);
  });
}