// Copyright (c) 2022 Kehinde Akeredolu
// For full license & permission details, see LICENSE.

class Node<T> {
  Node({required this.value, this.next});

  /// The value of the node.
  T value;

  /// The next node in the list.
  Node<T>? next;
}

class CircularlyLinkedList<E> extends Iterable<E> {
  /// The tail of the list.
  Node<E>? tail;

  /// Returns true if the list is empty.
  @override
  bool get isEmpty => tail == null;

  /// rotate the first element to the back of the list
  void rotate() {
    if (!isEmpty) {
      // the old head becones the new tail
      tail = tail!.next;
    }
  }

  /// returns (but does not remove) the first element
  E? peek() {
    if (isEmpty) return null;
    return tail?.next?.value; // the head is *after* the tail
  }

  /// Adds an element to the front of the list.
  void push(E value) {
    if (isEmpty) {
      tail = Node<E>(value: value);
      tail!.next = tail; // link to itself circularly
    } else {
      Node<E> newest = Node<E>(value: value, next: tail!.next);
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

    Node<E> head = tail!.next!;

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
  String toString() => '[${join(', ')}]';
}

class _CircularlyLinkedListIterator<E> implements Iterator<E> {
  _CircularlyLinkedListIterator(CircularlyLinkedList<E> list) : _list = list;
  final CircularlyLinkedList<E> _list;
  Node<E>? _currentNode;
  bool _firstPass = true;

  @override
  E get current => _currentNode!.value;

  @override
  bool moveNext() {
    if (_list.isEmpty) return false;
    if (_firstPass) {
      _currentNode = _list.tail?.next;
      _firstPass = false;
    } else {
      _currentNode = _currentNode?.next;
    }
    return _currentNode != null;
  }
}
