/// Priority Level of the Heap
enum Priority {
  /// Max Priority
  max,

  /// Min Priority
  min,
}

// the reason for using Comparable<dynamic> here rather than Comparable<E> is
// because this makes int collections easier to create

/// Heap data structure
class Heap<E extends Comparable<dynamic>> {
  /// Creates a Heap
  Heap({List<E>? elements, this.priority = Priority.max}) {
    this.elements = (elements == null) ? [] : elements;
    _buildHeap();
  }

  void _buildHeap() {
    if (isEmpty) {
      return;
    }
    final start = elements.length ~/ 2 - 1;
    for (var i = start; i >= 0; i--) {
      _siftDown(i);
    }
  }

  /// The elements in the heap
  late final List<E> elements;

  /// Priority of the Heap
  final Priority priority;

  /// Returns true if the heap is empty
  bool get isEmpty => elements.isEmpty;

  /// Returns the number of elements in the heap
  int get size => elements.length;

  /// Returns the top element in the heap
  E? get peek => isEmpty ? null : elements.first;

  int _leftChildIndex(int parentIndex) {
    return (parentIndex * 2) + 1;
  }

  int _rightChildIndex(int parentIndex) {
    return (parentIndex * 2) + 2;
  }

  int _parentIndex(int childIndex) {
    return (childIndex - 1) ~/ 2;
  }

  bool _firstHasHigherPriority(E valueA, E valueB) {
    if (priority == Priority.max) {
      return valueA.compareTo(valueB) > 0;
    }

    return valueA.compareTo(valueB) < 0;
  }

  int _higherPriority(int indexA, int indexB) {
    if (indexA >= elements.length) {
      return indexB;
    }
    final valueA = elements[indexA];
    final valueB = elements[indexB];
    final isFirst = _firstHasHigherPriority(valueA, valueB);

    return isFirst ? indexA : indexB;
  }

  void _swapValues(int indexA, int indexB) {
    final temp = elements[indexA];
    elements[indexA] = elements[indexB];
    elements[indexB] = temp;
  }

  /// Inserts a new value into the heap
  void insert(E value) {
    elements.add(value);

    _siftUp(elements.length - 1);
  }

  void _siftUp(int index) {
    var child = index;
    var parent = _parentIndex(child);

    while (child > 0 && child == _higherPriority(child, parent)) {
      _swapValues(child, parent);
      child = parent;
      parent = _parentIndex(child);
    }
  }

  void _siftDown(int index) {
    var parent = index;
    while (true) {
      final left = _leftChildIndex(parent);
      final right = _rightChildIndex(parent);

      var chosen = _higherPriority(left, parent);

      chosen = _higherPriority(right, chosen);

      if (chosen == parent) {
        return;
      }

      _swapValues(parent, chosen);
      parent = chosen;
    }
  }

  /// Removes the top element from the heap
  E? remove() {
    if (isEmpty) {
      return null;
    }

    _swapValues(0, elements.length - 1);

    final value = elements.removeLast();

    _siftDown(0);

    return value;
  }

  /// Remove an element from the heap at the given [index]
  E? removeAt(int index) {
    final lastIndex = elements.length - 1;

    if (index < 0 || index > lastIndex) {
      return null;
    }

    if (index == lastIndex) {
      return elements.removeLast();
    }

    _swapValues(index, lastIndex);
    final value = elements.removeLast();

    _siftDown(index);
    _siftUp(index);

    return value;
  }

  /// Returns the index of the given [value] in the heap
  int indexOf(E value, {int index = 0}) {
    if (index >= elements.length) {
      return -1;
    }

    if (_firstHasHigherPriority(value, elements[index])) {
      return -1;
    }

    if (value == elements[index]) {
      return index;
    }

    final left = indexOf(value, index: _leftChildIndex(index));
    if (left != -1) {
      return left;
    }

    return indexOf(value, index: _rightChildIndex(index));
  }

  @override
  String toString() => elements.toString();
}
