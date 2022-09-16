import 'swap.dart';

void bubbleSort<E extends Comparable<dynamic>>(List<E> list) {
  // 1
  /// The outer for loop counts the passes. A single pass bubbles the largest
  /// value to the end of the collection. Every pass needs to compare one less
  /// value than in the previous pass, so you shorten the list by one with each pass.
  for (var end = list.length - 1; end > 0; end--) {
    var swapped = false;
    // 2
    /// The inner for loop handles the work of a single pass. It moves through the
    /// indices, comparing adjacent values and swapping them if the first value is
    /// larger than the second.
    for (var current = 0; current < end; current++) {
      if (list[current].compareTo(list[current + 1]) > 0) {
        list.swap(current, current + 1);
        swapped = true;
      }
    }
    // 3
    /// If no values were swapped during a pass, the collection must be sorted and
    /// you can exit early.
    if (!swapped) return;
  }
}
