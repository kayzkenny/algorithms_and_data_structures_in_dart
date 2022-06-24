import 'package:algorithms_and_data_structures_in_dart/src/linked_list/circularly_linked_list.dart';
import 'package:test/test.dart';

void main() {
  group('circularly linked list ...', () {
    test('append, pop and peek on CircularlyLinkedList', () {
      final list = CircularlyLinkedList<String>();
      list.append('Ray');
      list.append('Brian');
      list.append('Eric');
      expect(list.pop(), 'Ray');
      expect(list.peek(), 'Brian');
      list.pop();
      list.pop();
      expect(list.isEmpty, true);
    });
  });
}
