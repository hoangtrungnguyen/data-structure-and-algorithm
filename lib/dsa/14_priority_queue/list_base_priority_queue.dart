import 'package:data_structure_and_algorithm/dsa/heap_tree/heap.dart';
import 'dart:math' as math;

import 'package:data_structure_and_algorithm/dsa/queue/queue.dart';


class ListBasePriorityQueue<E extends Comparable<dynamic>> extends Queue<E> {
  late List<E> elements;
  Priority priority;

  ListBasePriorityQueue({List<E>? elements, this.priority = Priority.max}) {
    if(elements == null){
      this.elements = [];
      return;
    }
    if(elements.isNotEmpty){
      this.elements = [];
      for(var e in elements){
        enqueue(e);
      }
    }

  }

  @override
  E? dequeue() {
    if(isEmpty) return null;
    return elements.removeLast();
  }

  @override
  bool enqueue(E element) {
    if(isEmpty) {
      elements.add(element);
      return true;
    }
    if(priority == Priority.min){
      var index = elements.indexWhere((e) => e.compareTo(element) > 0);
      if(index < 0) index = elements.length;
      elements.insert(index, element);
    } else {
      var index = elements.indexWhere((e) => e.compareTo(element) < 0);
      if(index < 0) index = elements.length;
      elements.insert(index, element);
    }
    return true;
  }

  @override
  bool get isEmpty => elements.isEmpty;

  @override
  E? get peek => elements.firstOrNull;

}