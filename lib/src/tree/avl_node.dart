// Copyright (c) 2022 Razeware LLC
// For full license & permission details, see LICENSE.

/// A node in an AVL tree.
class AvlNode<T> {
  /// Creates a new node with the given [value].
  AvlNode(this.value);

  /// The value stored in this node.
  T value;

  /// The left child of this node.
  AvlNode<T>? leftChild;

  /// The right child of this node.
  AvlNode<T>? rightChild;

  /// The height of this node.
  int height = 0;

  /// The balance factor of this node.
  int get balanceFactor => leftHeight - rightHeight;

  /// The height of the left subtree.
  int get leftHeight => leftChild?.height ?? -1;

  /// The height of the right subtree.
  int get rightHeight => rightChild?.height ?? -1;

  /// Traverse the tree in order.
  void traverseInOrder(void Function(T value) action) {
    leftChild?.traverseInOrder(action);
    action(value);
    rightChild?.traverseInOrder(action);
  }

  /// Traverse the tree in pre-order.
  void traversePreOrder(void Function(T value) action) {
    action(value);
    leftChild?.traversePreOrder(action);
    rightChild?.traversePreOrder(action);
  }

  /// Traverse the tree in post-order.
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
    AvlNode<T>? node, [
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
    final a = _diagram(node.rightChild, '$top ', '$top┌──', '$top│ ');
    final b = '$root${node.value}\n';
    final c = _diagram(node.leftChild, '$bottom│ ', '$bottom└──', '$bottom ');

    return '$a$b$c';
  }
}
