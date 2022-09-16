/// Extension on list to swap two elements at given indices
extension SwappableList<E> on List<E> {
  /// Swaps two elements at given indices
  void swap(int indexA, int indexB) {
    final temp = this[indexA];
    this[indexA] = this[indexB];
    this[indexB] = temp;
  }
}
