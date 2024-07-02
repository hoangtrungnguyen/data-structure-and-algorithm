import 'dart:math';

import 'package:data_structure_and_algorithm/5_linked_list/linked_list.dart';
import 'package:test/test.dart';

void main() {
  group('insertAfter', (){
    test('at middle',(){
      final node1 = Node(value: 1);
      final node2 = Node(value: 2);
      final node3 = Node(value: 3);
      node1.next = node2;
      node2.next = node3;
      LinkedList list = LinkedList<int>(head: node1, tail: node3);
      print('Before: $list');
      list.insertAfterIndex(1, 43);
      print('After: $list');
      expect(node2.next?.value, 43);
    });

  });
  group('nodeAt', () {

    test('empty list', () {
      final linkedList = LinkedList();
      final result = linkedList.nodeAt(1);
      expect(result, null);
    });

    test('index bigger than length', () {

      final node1 = Node(value: 1);
      final node2 = Node(value: 2);
      final node3 = Node(value: 3);
      node1.next = node2;
      node2.next = node3;
      LinkedList linkedList = LinkedList(head: node1, tail: node3);

      final result = linkedList.nodeAt(4);
      expect(result, null);
    });

    test('node at middle', () {

      final node1 = Node(value: 1);
      final node2 = Node(value: 2);
      final node3 = Node(value: 3);
      node1.next = node2;
      node2.next = node3;
      LinkedList linkedList = LinkedList(head: node1, tail: node3);

      final result = linkedList.nodeAt(1);
      expect(result, node2 );
    });
  });

  group("removeLast", (){
      test("empty list", (){
        LinkedList linkedList = LinkedList();
        expect(linkedList.removeLast(), null);
      });

      test("length == 1", (){
        final node1 = Node(value: 1);
        LinkedList linkedList = LinkedList(head: node1, tail: node1);
        expect(linkedList.removeLast(), 1);
        expect(linkedList.head, null);
        expect(linkedList.tail, null);
      });

      test("other cases", (){

        final node1 = Node(value: 1);
        final node2 = Node(value: 2);
        final node3 = Node(value: 3);
        node1.next = node2;
        node2.next = node3;
        LinkedList linkedList = LinkedList(head: node1, tail: node3);

        expect(linkedList.removeLast(), 3);
        expect(linkedList.tail, node2);
      });
  });

  group('removeAfter', (){
    final testNode = Node(value: 1);


    test('empty list', (){
      LinkedList linkedList = LinkedList();
      expect(linkedList.removeAfter(testNode), null);
    });

    test('node does not exist', (){
      final node1 = Node(value: 1);
      final node2 = Node(value: 2);
      final node3 = Node(value: 3);
      node1.next = node2;
      node2.next = node3;
      LinkedList linkedList = LinkedList<int>(head: node1, tail: node3);
      final result = linkedList.removeAfter(Node<int>(value: 4));
      expect(result, null);
      expect(linkedList.tail, node3);
    });

    test("next node is a tail node", (){
      final node1 = Node(value: 1);
      final node2 = Node(value: 2);
      final node3 = Node(value: 3);
      node1.next = node2;
      node2.next = node3;
      LinkedList linkedList = LinkedList<int>(head: node1, tail: node3);
      final value = linkedList.removeAfter(node2);
      expect(value, 3);
      expect(linkedList.tail, node2);
      print(linkedList);
    });

    test('other cases', (){
      final node1 = Node(value: 1);
      final node2 = Node(value: 2);
      final node3 = Node(value: 3);
      final node4 = Node(value: 4);
      node1.next = node2;
      node2.next = node3;
      node3.next = node4;
      LinkedList linkedList = LinkedList<int>(head: node1, tail: node4);
      final result = linkedList.removeAfter(node2);
      expect(linkedList.tail, node4);
      expect(result, 3);
      print(linkedList);
    });

  });


  group("remove all", (){

    test('one element', (){
      final node1 = Node(value: 1);
      final node2 = Node(value: 2);
      final node3 = Node(value: 3);
      final node4 = Node(value: 4);
      node1.next = node2;
      node2.next = node3;
      node3.next = node4;
      LinkedList linkedList = LinkedList<int>(head: node1, tail: node4);
      print('Before $linkedList');
      linkedList.removeAll(2);
      print('After $linkedList');
      expect(linkedList.length, 3);
    });

    test('multiple elements at head', () {
      LinkedList linkedList = LinkedList<int>();
      linkedList.push(4);
      linkedList.push(3);
      linkedList.push(2);
      linkedList.push(1);
      linkedList.push(1);
      linkedList.push(1);
      print('Before $linkedList');
      linkedList.removeAll(1);
      print('After $linkedList');
      expect(linkedList.length, 3);
      expect(linkedList.head?.value, 2);
      expect(linkedList.tail?.value, 4);
    });

    test('elements at random place', () {
      LinkedList linkedList = LinkedList<int>();
      linkedList.push(4);
      linkedList.push(1);
      linkedList.push(4);
      linkedList.push(1);
      linkedList.push(3);
      linkedList.push(2);
      linkedList.push(1);
      linkedList.push(1);
      print('Before $linkedList');
      linkedList.removeAll(1);
      print('After $linkedList');
      expect(linkedList.length, 4);
      expect(linkedList.tail?.value, 4);
      expect(linkedList.head?.value, 2);
    });

    test('multiple elements at tail', () {
      LinkedList linkedList = LinkedList<int>();
      linkedList.push(1);
      linkedList.push(1);
      linkedList.push(1);
      linkedList.push(3);
      linkedList.push(2);
      print('Before $linkedList');
      linkedList.removeAll(1);
      print('After $linkedList');
      expect(linkedList.length, 2);
      expect(linkedList.tail?.value, 3);
    });


    test('multiple elements in the middle', (){
      LinkedList linkedList = LinkedList<int>();
      linkedList.push(1);
      linkedList.push(2);
      linkedList.push(3);
      linkedList.push(3);
      linkedList.push(3);
      linkedList.push(4);
      linkedList.push(5);
      linkedList.removeAll(3);
      expect(linkedList.length, 4);
    });

    test('none element', (){
      LinkedList linkedList = LinkedList<int>();
      linkedList.push(1);
      linkedList.push(1);
      linkedList.push(2);
      linkedList.push(3);
      linkedList.push(3);
      linkedList.push(3);
      linkedList.push(4);
      linkedList.push(5);
      linkedList.removeAll(12);
      expect(linkedList.length, 8);
    });

  });

  group("find middle", (){

    final int middleValue = 18;

    test("Empty", (){
      final list = LinkedList<int>();
      final found = list.findMiddle();
      expect(found, null);
    });

    test("odd number", (){
      final list = LinkedList<int>();
      list.push(2);
      list.push(2);
      list.push(middleValue);
      list.push(3);
      list.push(3);
      final found = list.findMiddle();
      expect(found?.value, middleValue);
    });

    test("even number", (){
      final list = LinkedList<int>();
      list.push(2);
      list.push(3);
      list.push(middleValue);
      list.push(3);
      final found = list.findMiddle();
      expect(found?.value, middleValue);
    });
  });

}
