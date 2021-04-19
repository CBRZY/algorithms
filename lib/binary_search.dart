Map<String, int> search<T extends Comparable>(List<T> listToSearch, T itemToFind) {
  int foundAtIndex = -1;
  int guesses = 0;

  int low = 0;
  int high = listToSearch.length - 1;

  while(low <= high) {
    guesses++;
    int mid = (high + low) ~/ 2;
    if (itemToFind.compareTo(listToSearch[mid]) == 0) {
      foundAtIndex = mid;
      break;
    } else if (itemToFind.compareTo(listToSearch[mid]) < 0) {
      high = mid - 1;
    } else if (itemToFind.compareTo(listToSearch[mid]) > 0) {
      low = mid + 1;
    }
  }

  return <String, int>{
    'index': foundAtIndex,
    'guesses': guesses
  };
}

// ignore: missing_return
Map<String, int> recursiveSearch<T extends Comparable>(List<T> listToSearch, T itemToFind, int low, int high, {int guesses = 0}) {
  if (low <= high) {
    guesses++;
    int mid = (high + low) ~/ 2;
    if (itemToFind.compareTo(listToSearch[mid]) == 0) {
      return <String, int>{
        'index': mid,
        'guesses': guesses
      };
    } else if (itemToFind.compareTo(listToSearch[mid]) < 0) {
      return recursiveSearch<T>(listToSearch, itemToFind, low, mid - 1, guesses: guesses);
    } else if (itemToFind.compareTo(listToSearch[mid]) > 0) {
      return recursiveSearch<T>(listToSearch, itemToFind, mid + 1, high, guesses: guesses);
    }
  } else {
    return <String, int>{
      'index': -1,
      'guesses': guesses
    };
  }
}