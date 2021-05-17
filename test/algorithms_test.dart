import 'package:algorithms/binary_search.dart';
import 'package:algorithms/quicksort.dart';
import 'package:test/test.dart';

void main() {
  group('Binary Search', () {
    group('Iterative', () {
      test('Item exists in list', () {
        expect(search<int>([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 1),
            {'guesses': 3, 'index': 0});
      });
      test('Item doesn\'t exist in list', () {
        expect(search<int>([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], -1),
            {'guesses': 3, 'index': -1});
      });
    });
    group('Recursive', () {
      test('Item exists in list', () {
        expect(recursiveSearch<int>([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 2),
            {'guesses': 2, 'index': 1});
      });
      test('Item doesn\'t exist in list', () {
        expect(recursiveSearch<int>([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], -2),
            {'guesses': 3, 'index': -1});
      });
    });
  });

  group('Quicksort', () {
    group('Integers', () {
      test('Sort unsorted positive integers', () {
        expect(
          quicksort<int>([2, 3, 9, 1, 5, 8, 4, 7]),
          [1, 2, 3, 4, 5, 7, 8, 9],
        );
      });
      test('Sort unsorted integers', () {
        expect(
          quicksort<int>([2, 3, -9, 1, 5, 8, 4, -7]),
          [-9, -7, 1, 2, 3, 4, 5, 8],
        );
      });
    });

    group('Strings', () {
      test('Sort unsorted string', () {
        expect(
          quicksort<String>(['b', 'a', 'n', 'z', 'p', 'c']),
          ['a', 'b', 'c', 'n', 'p', 'z'],
        );
      });
    });
  });
}
