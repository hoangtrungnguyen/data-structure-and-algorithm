import 'package:data_structure_and_algorithm/doubly_linked_list.dart';
import 'package:data_structure_and_algorithm/ring_buffer.dart';

abstract class Queue<E> {
  bool enqueue(E element);

  E? dequeue();

  bool get isEmpty;

  E? get peek;
}

class QueueList<E> implements Queue<E> {
  final _list = <E>[];

  @override
  E? dequeue() {
    if (isEmpty) return null;
    return _list.removeLast();
  }

  @override
  bool enqueue(E element) {
    _list.add(element);
    return true;
  }

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  E? get peek => _list.firstOrNull;
}

class QueueLinkedList<E> implements Queue<E> {
  final _list = DoublyLinkedList<E>();

  @override
  E? dequeue() {
    return _list.pop();
  }

  @override
  bool enqueue(E element) {
    _list.append(element);
    return true;
  }

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  E? get peek => _list.head?.value;
}

class QueueRingBuffer<E> implements Queue<E> {
  QueueRingBuffer(int length) : _ringBuffer = RingBuffer<E>(length);

  final RingBuffer<E> _ringBuffer;

  @override
  E? dequeue() {
    return _ringBuffer.read();
  }

  @override
  bool enqueue(E element) {
    if(_ringBuffer.isFull){
      return false;
    }
    _ringBuffer.write(element);
    return true;
  }

  @override
  bool get isEmpty => _ringBuffer.isEmpty;

  @override
  E? get peek => _ringBuffer.peek;
}
