// Copyright (c) 2022 Razeware LLC
// For full license & permission details, see LICENSE.

/// A ring buffer is a fixed size queue.
/// When the buffer is full, adding a new element will overwrite the oldest element.
/// This implementation uses a [List] to store the elements.
/// The [List] is initialized with a fixed size.
class RingBuffer<E> {
  /// Creates a ring buffer with the given [size].
  RingBuffer(int length) : _list = List.filled(length, null);

  /// The list of elements in the ring buffer.
  final List<E?> _list;

  /// The index of the next available slot in the queue.
  int _writeIndex = 0;

  /// The index of the front of the queue.
  int _readIndex = 0;

  /// The number of elements in the ring buffer.
  int _size = 0;

  /// Returns true if the ring buffer is full.
  bool get isFull => _size == _list.length;

  /// Returns true if the ring buffer is empty.
  bool get isEmpty => _size == 0;

  /// Adds an element to the ring buffer
  void write(E element) {
    if (isFull) {
      throw Exception('Buffer is full');
    }
    _list[_writeIndex] = element;
    _writeIndex = _advance(_writeIndex);
    _size++;
  }

  /// Advances the read index.
  int _advance(int index) {
    return (index == _list.length - 1) ? 0 : index + 1;
  }

  /// Dequeues an element from the ring buffer.
  E? read() {
    if (isEmpty) {
      return null;
    }
    final element = _list[_readIndex];
    _readIndex = _advance(_readIndex);
    _size--;

    return element;
  }

  /// Return but does not remove the front element of the ring buffer.
  E? get peek => isEmpty ? null : _list[_readIndex];

  @override
  String toString() {
    final text = StringBuffer();
    text.write('[');
    int index = _readIndex;
    while (index != _writeIndex) {
      if (index != _readIndex) {
        text.write(', ');
      }
      text.write(_list[index % _list.length]);
      index++;
    }
    text.write(']');

    return text.toString();
  }
}
