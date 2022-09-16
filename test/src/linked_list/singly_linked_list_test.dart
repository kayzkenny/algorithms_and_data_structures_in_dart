// Copyright (c) 2022 Kehinde Akeredolu
// For full license & permission details, see LICENSE.

import 'package:algorithms_and_data_structures_in_dart/src/linked_list/singly_linked_list.dart';
import 'package:test/test.dart';

void main() {
  group('singly linked list ...', () {
    test('node next reference', () {
      final node3 = Node(value: 3);
      final node2 = Node(value: 2, next: node3);
      final node1 = Node(value: 1, next: node2);
      expect(node1.next, node2);
      expect(node2.next, node3);
    });

    test('push, append, pop and removeLast', () {
      final list = SinglyLinkedList<int>();
      list.push(1);
      list.append(2);
      list.append(3);
      expect(list.isNotEmpty, true);
      expect(list.pop(), 1);
      expect(list.pop(), 2);
      expect(list.removeLast(), 3);
      expect(list.pop(), null);
      expect(list.isEmpty, true);
    });

    test('inserts a node after a given node', () {
      final list = SinglyLinkedList<int>();
      list.push(3);
      list.push(2);
      list.push(1);
      final middleNode = list.nodeAt(1)!;
      list.insertAfter(middleNode, 42);
      expect(list.nodeAt(2)!.value, 42);
    });

    test('removes the node after a given node', () {
      final list = SinglyLinkedList<int>();
      list.push(3);
      list.push(2);
      list.push(1);
      final middleNode = list.nodeAt(1)!;
      list.removeAfter(middleNode);
      expect(list.nodeAt(1)!.value, 2);
    });

    test('the list is iterable', () {
      final list = SinglyLinkedList<int>();
      list.push(3);
      list.push(2);
      list.push(1);
      expect(list.toList(), [1, 2, 3]);
    });
  });
}
