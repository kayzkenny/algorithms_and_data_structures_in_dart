// Copyright (c) 2022 Kehinde Akeredolu
// For full license & permission details, see LICENSE.

/// A node in a [CircularlyLinkedList].
class Node<T> {
  /// The value stored in this node.
  Node({required this.value, this.next});

  /// The value of the node.
  T value;

  /// The next node in the list.
  Node<T>? next;
}

/// A circularly linked list.
class CircularlyLinkedList<E> extends Iterable<E> {
  /// The tail of the list.
  Node<E>? tail;

  /// Number of nodes in the list
  int size = 0;

  /// Returns true if the list is empty.
  @override
  bool get isEmpty => tail == null;

  /// Returns (but does not remove) the first element of the list (or null if empty)

  E? getFirst() {
    // returns (but does not remove) the first element
    if (isEmpty) {
      return null;
    }

    return tail!.next!.value; // the head is *after* the tail
  }

  /// Returns (but does not remove) the last element of the list  (or null if empty)
  E? getLast() {
    if (isEmpty) {
      return null;
    }

    return tail!.value;
  }

  /// rotate the first element to the back of the list
  void rotate() {
    if (!isEmpty) {
      // the old head becones the new tail
      tail = tail!.next;
    }
  }

  /// returns (but does not remove) the first element
  E? peek() {
    if (isEmpty) {
      return null;
    }

    return tail?.next?.value; // the head is *after* the tail
  }

  /// Adds an element to the front of the list.
  void push(E value) {
    if (isEmpty) {
      tail = Node<E>(value: value);
      tail!.next = tail; // link to itself circularly
    } else {
      final Node<E> newest = Node<E>(value: value, next: tail!.next);
      tail!.next = newest;
    }
  }

  /// Adds an element to the end of the list.
  void append(E value) {
    push(value);
    tail = tail!.next; // now new element becomes the tail
  }

  /// Removes and returns the first element from the list or null if the list is empty.
  E? pop() {
    if (isEmpty) {
      return null;
    }

    final Node<E> head = tail!.next!;

    if (head == tail) {
      tail = null; // must be the only node left
    } else {
      tail!.next = head.next!; // removes "head" from the list
    }

    return head.value;
  }

  @override
  Iterator<E> get iterator => _CircularlyLinkedListIterator(this);

  @override
  String toString() {
    if (tail == null) {
      return '()';
    }
    final StringBuffer sb = StringBuffer();
    sb.write('(');
    Node<E> walk = tail!;
    do {
      walk = walk.next!;
      sb.write(walk.value);
      if (walk != tail) {
        sb.write(', ');
      }
    } while (walk != tail);
    sb.write(')');

    return sb.toString();
  }
}

/// An iterator for a [CircularlyLinkedList].
class _CircularlyLinkedListIterator<E> implements Iterator<E> {
  _CircularlyLinkedListIterator(CircularlyLinkedList<E> list) : _list = list;
  final CircularlyLinkedList<E> _list;
  Node<E>? _currentNode;
  bool _firstPass = true;

  @override
  E get current => _currentNode!.value;

  @override
  bool moveNext() {
    if (_list.isEmpty) {
      return false;
    }
    if (_firstPass) {
      _currentNode = _list.tail?.next;
      _firstPass = false;
    } else {
      _currentNode = _currentNode?.next;
    }

    return _currentNode != _list.tail;
  }
}
