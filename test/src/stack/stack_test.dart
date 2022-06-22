// Copyright (c) 2022 Kehinde Akeredolu
// For full license & permission details, see LICENSE.

import 'package:test/test.dart';
import 'package:algorithms_and_data_structures_in_dart/src/stack/stack.dart';

void main() {
  test('Stack Operations', () {
    final stack = Stack<int>();
    stack.push(1);
    stack.push(2);
    stack.push(3);
    expect(stack.isNotEmpty, true);
    expect(stack.peek, 3);
    expect(stack.pop(), 3);
    expect(stack.pop(), 2);
    expect(stack.pop(), 1);
    expect(stack.pop(), null);
    expect(stack.isEmpty, true);
  });
}
