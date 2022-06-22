import 'package:algorithms_and_data_structures_in_dart/src/queue/queue.dart';
import 'package:test/test.dart';

void main() {
  group('queue ...', () {
    test('enqueue and dequeue on QueueList', () {
      final queue = QueueList<String>();
      queue.enqueue('Ray');
      queue.enqueue('Brian');
      queue.enqueue('Eric');
      expect(queue.dequeue(), 'Ray');
      expect(queue.peek, 'Brian');
    });

    test('enqueue and dequeue on QueueStack', () {
      final queue = QueueStack<String>();
      queue.enqueue('Ray');
      queue.enqueue('Brian');
      queue.enqueue('Eric');
      expect(queue.dequeue(), 'Ray');
      expect(queue.peek, 'Brian');
    });

    test('enqueue and dequeue on QueueLinkedList', () {
      final queue = QueueLinkedList<String>();
      queue.enqueue('Ray');
      queue.enqueue('Brian');
      queue.enqueue('Eric');
      expect(queue.dequeue(), 'Ray');
      expect(queue.peek, 'Brian');
    });
  });
}
