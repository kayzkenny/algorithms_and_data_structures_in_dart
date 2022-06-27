// Copyright (c) 2022 Razeware LLC
// For full license & permission details, see LICENSE.

import 'binary_node.dart';

class BinarySearchTree<E extends Comparable<dynamic>> {
  /// The root of the tree.
  BinaryNode<E>? root;

  void insert(E value) {
    root = _insertAt(root, value);
  }

  /// Inserts the [value] into the tree at the correct location.
  BinaryNode<E> _insertAt(BinaryNode<E>? node, E value) {
    // 1
    if (node == null) {
      return BinaryNode(value);
    }
    // 2
    if (value.compareTo(node.value) < 0) {
      node.leftChild = _insertAt(node.leftChild, value);
    } else {
      node.rightChild = _insertAt(node.rightChild, value);
    }
    // 3
    return node;
  }

  /// Returns true if the [value] is found in the tree
  bool contains(E value) {
    // 1
    var current = root;
    // 2
    while (current != null) {
      // 3
      if (current.value == value) {
        return true;
      }
      // 4
      if (value.compareTo(current.value) < 0) {
        current = current.leftChild;
      } else {
        current = current.rightChild;
      }
    }
    return false;
  }

  void remove(E value) {
    root = _remove(root, value);
  }

  /// Removes and returns the [node] with this [value] from the tree.
  BinaryNode<E>? _remove(BinaryNode<E>? node, E value) {
    if (node == null) return null;

    if (value == node.value) {
      // 1
      if (node.leftChild == null && node.rightChild == null) {
        return null;
      }
// 2
      if (node.leftChild == null) {
        return node.rightChild;
      }
      if (node.rightChild == null) {
        return node.leftChild;
      }
// 3
      node.value = node.rightChild!.min.value;
      node.rightChild = _remove(node.rightChild, node.value);
    } else if (value.compareTo(node.value) < 0) {
      node.leftChild = _remove(node.leftChild, value);
    } else {
      node.rightChild = _remove(node.rightChild, value);
    }
    return node;
  }

  @override
  String toString() => root.toString();
}

extension _MinFinder<E> on BinaryNode<E> {
  BinaryNode<E> get min => leftChild?.min ?? this;
}
