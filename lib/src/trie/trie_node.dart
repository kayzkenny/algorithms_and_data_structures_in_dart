/// Trie Node
class TrieNode<T> {
  /// Creates a trie node.
  TrieNode({this.key, this.parent});

  /// The key of this node.
  T? key;

  /// The parent of this node.
  TrieNode<T>? parent;

  /// The children of this node.
  Map<T, TrieNode<T>?> children = {};

  /// Whether this node is terminating.
  bool isTerminating = false;
}
