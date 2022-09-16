class TrieNode<T> {
  TrieNode({this.key, this.parent});

  // 1
  T? key;

  // 2
  TrieNode<T>? parent;

  // 3
  Map<T, TrieNode<T>?> children = {};

  // 4
  bool isTerminating = false;
}
