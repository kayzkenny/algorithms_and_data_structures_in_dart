import 'swap.dart';

/// Bubble sort is a simple sorting algorithm that repeatedly steps through the
/// list to be sorted, compares each pair of adjacent items and swaps them if
/// they are in the wrong order. The pass through the list is repeated until no
/// swaps are needed, which indicates that the list is sorted.
void bubbleSort<E extends Comparable<dynamic>>(List<E> list) {
  /// The outer for loop counts the passes. A single pass bubbles the largest
  /// value to the end of the collection. Every pass needs to compare one less
  /// value than in the previous pass, so you shorten the list by one with each pass.
  for (var end = list.length - 1; end > 0; end--) {
    var swapped = false;

    /// The inner for loop handles the work of a single pass. It moves through the
    /// indices, comparing adjacent values and swapping them if the first value is
    /// larger than the second.
    for (var current = 0; current < end; current++) {
      if (list[current].compareTo(list[current + 1]) > 0) {
        list.swap(current, current + 1);
        swapped = true;
      }
    }

    /// If no values were swapped during a pass, the collection must be sorted and
    /// you can exit early.
    if (!swapped) {
      return;
    }
  }
}
