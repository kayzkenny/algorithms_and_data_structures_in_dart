import 'package:algorithms_and_data_structures_in_dart/src/queue/queue.dart';
import 'package:test/test.dart';

void main() {
  group('ring buffer ...', () {
    test('enqueue and dequeue on QueueRingBuffer', () {
      final queue = QueueRingBuffer<String>(10);
      queue.enqueue('Ray');
      queue.enqueue('Brian');
      queue.enqueue('Eric');
      expect(queue.dequeue(), 'Ray');
      expect(queue.peek, 'Brian');
    });
  });
}
