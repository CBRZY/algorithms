import 'package:algorithms/binary_search.dart';
import 'package:algorithms/quicksort.dart';
import 'package:test/test.dart';

void main() {
  group('Binary Search -', () {
    List<int> numbers = [];
    for (int i = 1; i <= 1000000; i++) {
      numbers.add(i);
    }
    group('Integers -', () {
      group('Iterative -', () {
        test('Item exists in list', () {
          expect(
            search<int>(numbers, 95632),
            {'guesses': 20, 'index': 95631},
          );
        });
        test('Item doesn\'t exist in list', () {
          expect(
            search<int>(numbers, -2),
            {'guesses': 19, 'index': -1},
          );
        });
      });
      group('Recursive -', () {
        test('Item exists in list', () {
          expect(
            recursiveSearch<int>(numbers, 1000000),
            {'guesses': 20, 'index': 999999},
          );
        });
        test('Item doesn\'t exist in list', () {
          expect(
            recursiveSearch<int>(numbers, 10000000),
            {'guesses': 20, 'index': -1},
          );
        });
      });
    });

    group('Strings -', () {
      group('Iterative -', () {
        test('Item exists in list', () {
          expect(
            search<String>(
                ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'], 'b'),
            {'guesses': 2, 'index': 1},
          );
        });
        test('Item doesn\'t exist in list', () {
          expect(
            search<String>(
                ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'], 'z'),
            {'guesses': 4, 'index': -1},
          );
        });
      });
      group('Recursive -', () {
        test('Item exists in list', () {
          expect(
            recursiveSearch<String>(
                ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'], 'c'),
            {'guesses': 3, 'index': 2},
          );
        });
        test('Item doesn\'t exist in list', () {
          expect(
            recursiveSearch<String>(
                ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'], 'z'),
            {'guesses': 4, 'index': -1},
          );
        });
      });
    });
  });

  group('Quicksort -', () {
    group('Integers -', () {
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

    group('Strings -', () {
      test('Sort unsorted string', () {
        expect(
          quicksort<String>(['b', 'a', 'n', 'z', 'p', 'c']),
          ['a', 'b', 'c', 'n', 'p', 'z'],
        );
      });
    });
  });
}
