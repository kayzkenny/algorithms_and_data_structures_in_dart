import 'trie_node.dart';

/// A trie.
class StringTrie {
  /// The root of the trie.
  TrieNode<int> root = TrieNode();

  /// Inserts a new [value] into the trie.
  void insert(String text) {
    // 1
    var current = root;

    // 2
    for (final codeUnit in text.codeUnits) {
      current.children[codeUnit] ??= TrieNode(
        key: codeUnit,
        parent: current,
      );
      current = current.children[codeUnit]!;
    }

    // 3
    current.isTerminating = true;
  }

  // You check every code unit to see if it’s in the tree.
  // When you reach the last one, it must be terminating.
  // If not, the collection wasn’t added, and what you’ve found is a
  // subset of a larger collection.
  /// Returns true if the [text] is found in the trie.
  bool contains(String text) {
    var current = root;
    for (final codeUnit in text.codeUnits) {
      final child = current.children[codeUnit];
      if (child == null) {
        return false;
      }
      current = child;
    }

    return current.isTerminating;
  }

  /// Removes a [text] from the trie.
  void remove(String text) {
    // 1
    var current = root;
    for (final codeUnit in text.codeUnits) {
      final child = current.children[codeUnit];
      if (child == null) {
        return;
      }
      current = child;
    }
    if (!current.isTerminating) {
      return;
    }
    // 2
    current.isTerminating = false;
    // 3
    while (current.parent != null &&
        current.children.isEmpty &&
        !current.isTerminating) {
      current.parent!.children[current.key!] = null;
      current = current.parent!;
    }
  }

  /// Returns a list of all the words in the trie.
  List<String> matchPrefix(String prefix) {
    // 1
    var current = root;
    for (final codeUnit in prefix.codeUnits) {
      final child = current.children[codeUnit];
      if (child == null) {
        return [];
      }
      current = child;
    }

    // 2 (to be implemented shortly)
    return _moreMatches(prefix, current);
  }

  List<String> _moreMatches(String prefix, TrieNode<int> node) {
    // 1
    final List<String> results = [];
    if (node.isTerminating) {
      results.add(prefix);
    }
    // 2
    for (final child in node.children.values) {
      final codeUnit = child!.key!;
      results.addAll(
        _moreMatches(
          '$prefix${String.fromCharCode(codeUnit)}',
          child,
        ),
      );
    }

    return results;
  }
}
