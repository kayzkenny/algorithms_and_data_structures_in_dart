import 'package:algorithms_and_data_structures_in_dart/src/tree/tree.dart';
import 'package:test/test.dart';

void main() {
  TreeNode<int> buildTree() {
    return TreeNode(15)
      ..children.addAll([
        TreeNode(1)
          ..children.addAll([
            TreeNode(1),
            TreeNode(5),
            TreeNode(0),
          ]),
        TreeNode(17)
          ..children.addAll([
            TreeNode(2),
          ]),
        TreeNode(20)
          ..children.addAll([
            TreeNode(5),
            TreeNode(7),
          ]),
      ]);
  }

  group('tree ...', () {
    test('searching the tree for a value that does not exist return null', () {
      final tree = buildTree();
      expect(tree.search(21), null);
    });
  });
}
