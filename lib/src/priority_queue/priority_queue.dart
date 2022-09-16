import 'package:algorithms_and_data_structures_in_dart/src/heap/heap.dart';
import 'package:algorithms_and_data_structures_in_dart/src/queue/queue.dart';

/// A [PriorityQueue] is a queue that orders its elements according to a
/// [Priority] function.
class PriorityQueue<E extends Comparable<dynamic>> implements Queue<E> {
  /// Creates a [PriorityQueue] with the given [elements] and [priority].
  PriorityQueue({
    List<E>? elements,
    Priority priority = Priority.max,
  }) {
    _heap = Heap<E>(elements: elements, priority: priority);
  }

  late Heap<E> _heap;

  @override
  bool get isEmpty => _heap.isEmpty;

  @override
  E? get peek => _heap.peek;

  @override
  bool enqueue(E element) {
    _heap.insert(element);

    return true;
  }

  @override
  E? dequeue() => _heap.remove();
}
