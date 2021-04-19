
import 'package:algorithms/binary_search.dart';
import 'package:test/test.dart';

void main() {
  group('Binary Search', () {
    test('Iterative', () {
      expect(search<int>([1,2,3,4,5,6,7,8,9,10], 1), {'guesses': 3, 'index': 0});
    });
    test('Recursive', () {
      expect(recursiveSearch<int>([1,2,3,4,5,6,7,8,9,10], 2, 0, 9), {'guesses': 2, 'index': 1});
    });
  });
}
