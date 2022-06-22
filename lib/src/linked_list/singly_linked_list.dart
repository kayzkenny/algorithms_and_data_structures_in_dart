// Copyright (c) 2022 Razeware LLC
// For full license & permission details, see LICENSE.

/// Node of a singly linked list
class Node<T> {
  Node({required this.value, this.next});

  /// The value of the node.
  T value;

  /// The next node in the list.
  Node<T>? next;

  @override
  String toString() {
    if (next == null) return '$value';
    return '$value -> ${next.toString()}';
  }
}

class SinglyLinkedList<E> extends Iterable<E> {
  /// The head of the list.
  Node<E>? head;

  /// The tail of the list.
  Node<E>? tail;

  /// Adds a value to the front of the list.
  void push(E value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }

  /// Adds a value at the end of the list
  void append(E value) {
    if (isEmpty) {
      push(value);
      return;
    }
    tail!.next = Node(value: value);
    tail = tail!.next;
  }

  /// Returns the node at the given index or null if the index is out of bounds.
  Node<E>? nodeAt(int index) {
    var currentNode = head;
    var currentIndex = 0;
    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex += 1;
    }
    return currentNode;
  }

  /// Adds a value after a particular node in the list
  Node<E> insertAfter(Node<E> node, E value) {
    if (tail == node) {
      append(value);
      return tail!;
    }
    node.next = Node(value: value, next: node.next);
    return node.next!;
  }

  /// Removes and return the node at the front of the list
  /// or null if the list is empty.
  E? pop() {
    final value = head?.value;
    head = head?.next;
    if (isEmpty) {
      tail = null;
    }
    return value;
  }

  /// Removes and return the node at the end of the list
  /// or null if the list is empty.
  E? removeLast() {
    if (head?.next == null) return pop();

    var current = head;
    while (current!.next != tail) {
      current = current.next;
    }

    final value = tail?.value;
    tail = current;
    tail?.next = null;
    return value;
  }

  /// Removes and returns the node after the given node
  /// or null if the given node is the last node.
  E? removeAfter(Node<E> node) {
    final value = node.next?.value;
    if (node.next == tail) {
      tail = node;
    }
    node.next = node.next?.next;
    return value;
  }

  @override
  bool get isEmpty => head == null;

  @override
  Iterator<E> get iterator => _LinkedListIterator(this);

  @override
  String toString() {
    if (isEmpty) return 'Empty list';
    return head.toString();
  }
}

class _LinkedListIterator<E> implements Iterator<E> {
  _LinkedListIterator(SinglyLinkedList<E> list) : _list = list;
  final SinglyLinkedList<E> _list;

  /// The current node in the list.
  Node<E>? _currentNode;

  @override
  E get current => _currentNode!.value;

  bool _firstPass = true;

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
