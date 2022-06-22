import 'package:algorithms_and_data_structures_in_dart/src/linked_list/doubly_linked_list.dart';
import 'package:test/test.dart';

void main() {
  group('doubly linked list ...', () {
    test('node next and prev reference', () {
      final node1 = Node(value: 1);
      final node3 = Node(value: 3);
      final node2 = Node(value: 2, previous: node1, next: node3);
      expect(node2.previous, node1);
      expect(node2.next, node3);
    });

    test('append, push and pop on DoublyLinkedList', () {
      final list = DoublyLinkedList<String>();
      list.append('Ray');
      list.append('Brian');
      list.append('Eric');
      list.push('John');
      expect(list.pop(), 'John');
      expect(list.removeLast(), 'Eric');
    });
  });
}
