/// Binary Search
/// 
/// Iterative search method
/// 
/// [listToSearch] - List of ordered items to search through
/// 
/// [itemToFind] - The item you are looking for
Map<String, int> search<T extends Comparable>(List<T> listToSearch, T itemToFind) {
  int foundAtIndex = -1;
  int guesses = 0;

  int low = 0;
  int high = listToSearch.length - 1;

  while(low <= high) {
    guesses++;
    /// [mid] - index to search at - half way between [low] and [high] position, rounded down
    int mid = (high + low) ~/ 2;
    if (itemToFind.compareTo(listToSearch[mid]) == 0) {
      /// If [itemToFind] has been found, set [foundAtIndex] and break loop to return map with index and total amount of operations
      foundAtIndex = mid;
      break;
    } else if (itemToFind.compareTo(listToSearch[mid]) < 0) {
      /// If [itemToFind] is less than item in [listToSearch] at current searching index [mid], modify [high] position to 1 less than current searching index
      high = mid - 1;
    } else if (itemToFind.compareTo(listToSearch[mid]) > 0) {
      /// If [itemToFind] is more than item in [listToSearch] at current searching index [mid], modify [low] position to 1 more than current searching index
      low = mid + 1;
    }
  }

  return <String, int>{
    'index': foundAtIndex,
    'guesses': guesses
  };
}

/// Binary Search
/// 
/// Recursive search method
/// 
/// [listToSearch] - List of ordered items to search through
/// 
/// [itemToFind] - The item you are looking for
/// 
// ignore: missing_return
Map<String, int> recursiveSearch<T extends Comparable>(List<T> listToSearch, T itemToFind) {
  // Split out actual recursiveSearch to keep API clean, and have internals handle extra parameters 
  return _recursiveSearch(listToSearch, itemToFind, 0, listToSearch.length - 1);
}
// ignore: missing_return
Map<String, int> _recursiveSearch<T extends Comparable>(List<T> listToSearch, T itemToFind, int low, int high, {int guesses = 0}) {
  if (low <= high) {
    guesses++;
    /// [mid] - index to search at - half way between [low] and [high] position, rounded down
    int mid = (high + low) ~/ 2;
    if (itemToFind.compareTo(listToSearch[mid]) == 0) {
      /// If [itemToFind] has been found, return map with index and total amount of operations
      return <String, int>{
        'index': mid,
        'guesses': guesses
      };
    } else if (itemToFind.compareTo(listToSearch[mid]) < 0) {
      /// If [itemToFind] is less than item in [listToSearch] at current searching index [mid], modify [high] position to 1 less than current searching index
      return _recursiveSearch<T>(listToSearch, itemToFind, low, mid - 1, guesses: guesses);
    } else if (itemToFind.compareTo(listToSearch[mid]) > 0) {
      /// If [itemToFind] is more than item in [listToSearch] at current searching index [mid], modify [low] position to 1 more than current searching index
      return _recursiveSearch<T>(listToSearch, itemToFind, mid + 1, high, guesses: guesses);
    }
  } else {
    return <String, int>{
      'index': -1,
      'guesses': guesses
    };
  }
}