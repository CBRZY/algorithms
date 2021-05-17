/// Quicksort
///
/// [elementArr] - List of elements that you want to sort in ascending order
///
// TODO: Add option to sort ascending/descending
List<T> quicksort<T extends Comparable>(List<T> elementArr) {
  if (elementArr.length <= 1) {
    return elementArr;
  }

  List<T> smallerSubArr = [];
  int pivotIndex;
  T pivot;
  List<T> largerSubArr = [];

  // Choose a pivot point at random
  pivotIndex = elementArr.length ~/ 2;
  pivot = elementArr[pivotIndex];

  /// Loop through [elementArr]
  /// Add values less than [pivot] to [smallerSubArr]
  /// Add values greater than [pivot] to [largerSubArr]
  for (int i = 0; i < elementArr.length; i++) {
    if (i == pivotIndex) {
      continue;
    }

    if (elementArr[i].compareTo(pivot) <= 0) {
      smallerSubArr.add(elementArr[i]);
    } else {
      largerSubArr.add(elementArr[i]);
    }
  }

  return [...quicksort(smallerSubArr), pivot, ...quicksort(largerSubArr)];
}
