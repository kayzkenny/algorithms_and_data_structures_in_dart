// Copyright (c) 2022 Razeware LLC
// For full license & permission details, see LICENSE.

import '../linked_list/doubly_linked_list.dart';
import 'ring_buffer.dart';

/// The abstract [Queue] class.
abstract class Queue<E> {
  /// Adds an element to the end of the queue.
  bool enqueue(E element);

  /// Removes and returns the first element in the queue or null if the queue is empty.
  E? dequeue();

  /// Returns tue if the queue is empty.
  bool get isEmpty;

  /// Returns the first element in the queue or null if the queue is empty.
  E? get peek;
}

/// A [Queue] implemented using a [List].
class QueueList<E> implements Queue<E> {
  final _list = <E>[];

  @override
  bool enqueue(E element) {
    _list.add(element);

    return true;
  }

  @override
  E? dequeue() => isEmpty ? null : _list.removeAt(0);

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  E? get peek => isEmpty ? null : _list.first;

  @override
  String toString() => _list.toString();
}

/// A [Queue] implemented using a [DoublyLinkedList].
class QueueLinkedList<E> implements Queue<E> {
  final _list = DoublyLinkedList<E>();

  @override
  bool enqueue(E element) {
    _list.append(element);

    return true;
  }

  @override
  E? dequeue() => _list.pop();

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  E? get peek => _list.head?.value;

  @override
  String toString() => _list.toString();
}

/// A [Queue] implemented using a [RingBuffer].
class QueueRingBuffer<E> implements Queue<E> {
  /// Creates a [QueueRingBuffer] with the given [capacity].
  QueueRingBuffer(int length) : _ringBuffer = RingBuffer<E>(length);

  final RingBuffer<E> _ringBuffer;

  @override
  bool enqueue(E element) {
    if (_ringBuffer.isFull) {
      return false;
    }
    _ringBuffer.write(element);

    return true;
  }

  @override
  E? dequeue() => _ringBuffer.read();

  @override
  bool get isEmpty => _ringBuffer.isEmpty;

  @override
  E? get peek => _ringBuffer.peek;

  @override
  String toString() => _ringBuffer.toString();
}

/// A [Queue] implemented using two Stacks.
class QueueStack<E> implements Queue<E> {
  final _leftStack = <E>[];
  final _rightStack = <E>[];

  @override
  bool enqueue(E element) {
    _rightStack.add(element);

    return true;
  }

  @override
  E? dequeue() {
    if (_leftStack.isEmpty) {
      _leftStack.addAll(_rightStack.reversed);
      _rightStack.clear();
    }
    if (_leftStack.isEmpty) {
      return null;
    }

    return _leftStack.removeLast();
  }

  @override
  bool get isEmpty => _leftStack.isEmpty && _rightStack.isEmpty;

  @override
  E? get peek => _leftStack.isNotEmpty ? _leftStack.last : _rightStack.first;

  @override
  String toString() {
    final combined = [
      ..._leftStack.reversed,
      ..._rightStack,
    ].join(', ');

    return '[$combined]';
  }
}
