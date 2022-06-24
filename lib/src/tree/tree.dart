// Copyright (c) 2022 Razeware LLC
// For full license & permission details, see LICENSE.

import 'package:algorithms_and_data_structures_in_dart/src/queue/queue.dart';

class TreeNode<T> {
  TreeNode(this.value);
  T value;
  List<TreeNode<T>> children = [];

  /// adds the node as a child
  void add(TreeNode<T> child) {
    children.add(child);
  }

  /// starts at the root and visits nodes as deep as it can before backtracking.
  void forEachDepthFirst(void Function(TreeNode<T> node) performAction) {
    performAction(this);
    for (final child in children) {
      child.forEachDepthFirst(performAction);
    }
  }

  /// visit all of the nodes at an upper level before visiting any of the
  /// nodes at the next level down.
  void forEachLevelOrder(void Function(TreeNode<T> node) performAction) {
    final queue = QueueStack<TreeNode<T>>();
    performAction(this);
    children.forEach(queue.enqueue);
    var node = queue.dequeue();
    while (node != null) {
      performAction(node);
      node.children.forEach(queue.enqueue);
      node = queue.dequeue();
    }
  }

  /// traverse the tree and return the first node that matches the given value.
  TreeNode<T>? search(T value) {
    TreeNode<T>? result;
    forEachLevelOrder((node) {
      if (node.value == value) {
        result = node;
      }
    });
    return result;
  }
}
