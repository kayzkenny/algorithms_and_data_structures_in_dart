// Copyright (c) 2022 Razeware LLC
// For full license & permission details, see LICENSE.

import 'dart:math';

/// A node in a binary tree.
class BinaryNode<T> {
  /// Creates a new node with the given [value].
  BinaryNode(this.value);

  /// The value of the node.
  T value;

  /// The left child of the node.
  BinaryNode<T>? leftChild;

  /// The right child of the node.
  BinaryNode<T>? rightChild;

  /// Traverse the subtree in the following order
  ///
  /// If the current node has a left child, recursively visit this child first.
  /// Then visit the node itself.
  /// If the current node has a right child, recursively visit this child.
  void traverseInOrder(void Function(T value) action) {
    leftChild?.traverseInOrder(action);
    action(value);
    rightChild?.traverseInOrder(action);
  }

  /// Traverse the subtree in the following order
  ///
  /// Visit the current node first,
  /// then recursively visits the left and right child
  void traversePreOrder(void Function(T value) action) {
    action(value);
    leftChild?.traversePreOrder(action);
    rightChild?.traversePreOrder(action);
  }

  /// Visit the current node after the left and right child have been visited recursively
  void traversePostOrder(void Function(T value) action) {
    leftChild?.traversePostOrder(action);
    rightChild?.traversePostOrder(action);
    action(value);
  }

  @override
  String toString() {
    return _diagram(this);
  }

  String _diagram(
    BinaryNode<T>? node, [
    String top = '',
    String root = '',
    String bottom = '',
  ]) {
    if (node == null) {
      return '$root null\n';
    }
    if (node.leftChild == null && node.rightChild == null) {
      return '$root ${node.value}\n';
    }
    final a = _diagram(
      node.rightChild,
      '$top ',
      '$top┌──',
      '$top│ ',
    );
    final b = '$root${node.value}\n';
    final c = _diagram(
      node.leftChild,
      '$bottom│ ',
      '$bottom└──',
      '$bottom ',
    );

    return '$a$b$c';
  }
}

/// Returns the height of the tree.
int height(BinaryNode? node) {
  if (node == null) {
    return -1;
  }

  return 1 + max(height(node.leftChild), height(node.rightChild));
}
