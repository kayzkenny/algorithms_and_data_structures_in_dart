/// Extension on list to perform binary search
extension SortedList<E extends Comparable<dynamic>> on List<E> {
  /// Returns the index of the element in the list or -1 if not found
  int? binarySearch(E value, [int? start, int? end]) {
    final startIndex = start ?? 0;
    final endIndex = end ?? length;

    if (startIndex >= endIndex) {
      return null;
    }

    final size = endIndex - startIndex;
    final middle = startIndex + size ~/ 2;

    if (this[middle] == value) {
      return middle;
    } else if (value.compareTo(this[middle]) < 0) {
      return binarySearch(value, startIndex, middle);
    } else {
      return binarySearch(value, middle + 1, endIndex);
    }
  }
}
