// Copyright (c) 2022 Razeware LLC
// For full license & permission details, see LICENSE.

class Stack<E> {
  Stack() : _storage = <E>[];

  /// Constructs a stack with the given elements.
  Stack.of(Iterable<E> elements) : _storage = List<E>.of(elements);

  final List<E> _storage;

  /// Pushes an element onto the top of the stack.
  void push(E element) => _storage.add(element);

  /// remove and return the top element or null if the stack is empty.
  E? pop() {
    if (isEmpty) return null;
    return _storage.removeLast();
  }

  /// return the top element without removing it or null if the stack is empty.
  E? get peek {
    if (isEmpty) return null;
    return _storage.last;
  }

  /// Returns true if the stack is empty.
  bool get isEmpty => _storage.isEmpty;

  /// Returns true if the stack is not empty.
  bool get isNotEmpty => !isEmpty;

  @override
  String toString() {
    return '--- Top ---\n'
        '${_storage.reversed.join('\n')}'
        '\n-----------';
  }
}
