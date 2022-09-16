extension SortedList<E extends Comparable<dynamic>> on List<E> {
  int? binarySearch(E value, [int? start, int? end]) {
    // 1
    final startIndex = start ?? 0;
    final endIndex = end ?? length;
    // 2
    if (startIndex >= endIndex) {
      return null;
    }
    // 3
    final size = endIndex - startIndex;
    final middle = startIndex + size ~/ 2;
    // 4
    if (this[middle] == value) {
      return middle;
      // 5
    } else if (value.compareTo(this[middle]) < 0) {
      return binarySearch(value, startIndex, middle);
    } else {
      return binarySearch(value, middle + 1, endIndex);
    }
  }
}
