// Copyright (c) 2022 Razeware LLC
// For full license & permission details, see LICENSE.

/// Node of a doubly linked list
class Node<T> {
  Node({required this.value, this.next, this.previous});

  /// The value of the node.
  T value;

  /// The next node in the list.
  Node<T>? next;

  /// The previous node in the list.
  Node<T>? previous;

  @override
  String toString() {
    return '$value';
  }
}

abstract class LinkedList<E> {
  /// The head of the list.
  Node<E>? head;

  /// The tail of the list.
  Node<E>? tail;

  /// Returns true if the list is empty.
  bool get isEmpty;

  /// Adds an element to the end of the list.
  void append(E value);

  /// Adds an element to the front of the list.
  void push(E value);

  /// Removes the first element from the list or null if the list is empty.
  E? pop();

  /// Returns the last element in the list or null if the list is empty.
  E? removeLast();
}

class DoublyLinkedList<E> extends Iterable<E> implements LinkedList<E> {
  @override
  Node<E>? head;

  @override
  Node<E>? tail;

  @override
  bool get isEmpty => head == null;

  @override
  void append(E value) {
    // convert the value to a node
    final newNode = Node(value: value, previous: tail);

    // update the pointers at the tail of the list
    if (isEmpty) {
      head = newNode;
    } else {
      tail!.next = newNode;
      // handle lists with only one element
      head?.next ??= newNode;
    }
    tail = newNode;
  }

  @override
  void push(E value) {
    // convert the value to a node
    final newNode = Node(value: value, next: head);

    // update the pointers at the tail of the list
    if (isEmpty) {
      tail = newNode;
    } else {
      head!.previous = newNode;
      // handle lists with only one element
      tail?.previous ??= newNode;
    }
    head = newNode;
  }

  @override
  E? pop() {
    // handle an empty list
    if (isEmpty) return null;

    // save the return value
    final value = head?.value;

    // handle a list of length one
    if (head?.next == null) {
      head = null;
      tail = null;
      return value;
    }

    // update the pointers
    head = head?.next;
    head?.previous = null;

    return value;
  }

  @override
  E? removeLast() {
    // delegate lists with one or zero items to pop
    if (tail?.previous == null) return pop();

    // save the return value
    final value = tail?.value;

    // update the pointers
    tail = tail?.previous;
    tail?.next = null;

    return value;
  }

  @override
  Iterator<E> get iterator => _LinkedListIterator(this);

  @override
  String toString() => '[${join(', ')}]';
}

class _LinkedListIterator<E> implements Iterator<E> {
  _LinkedListIterator(DoublyLinkedList<E> list) : _list = list;
  final DoublyLinkedList<E> _list;
  Node<E>? _currentNode;
  bool _firstPass = true;

  @override
  E get current => _currentNode!.value;

  @override
  bool moveNext() {
    if (_list.isEmpty) return false;
    if (_firstPass) {
      _currentNode = _list.head;
      _firstPass = false;
    } else {
      _currentNode = _currentNode?.next;
    }
    return _currentNode != null;
  }
}
