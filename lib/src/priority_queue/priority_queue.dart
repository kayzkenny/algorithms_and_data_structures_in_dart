// 1
import 'package:algorithms_and_data_structures_in_dart/src/heap/heap.dart';
import 'package:algorithms_and_data_structures_in_dart/src/queue/queue.dart';

// export 'heap.dart' show Priority;

// 2
class PriorityQueue<E extends Comparable<dynamic>> implements Queue<E> {
  PriorityQueue({
    List<E>? elements,
    Priority priority = Priority.max,
  }) {
    // 3
    _heap = Heap<E>(elements: elements, priority: priority);
  }

  late Heap<E> _heap;

  @override
  bool get isEmpty => _heap.isEmpty;

  @override
  E? get peek => _heap.peek;

// 1
  @override
  bool enqueue(E element) {
    _heap.insert(element);
    return true;
  }

// 2
  @override
  E? dequeue() => _heap.remove();
}
