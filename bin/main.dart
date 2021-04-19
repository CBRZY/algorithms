import 'package:algorithms/binary_search.dart' as binary_search;

void main(List<String> arguments) {

  List<int> numbers = [];
  for (int i = 1; i <= 1000000; i++) {
    numbers.add(i);
  }

  execute(binary_search.search, [numbers, 95632]);
  execute(binary_search.search, [numbers, -2]);
  execute(binary_search.search, [['a','b','c','d','e','f','g','h','i','j'], 'b']);
  execute(binary_search.search, [['a','b','c','d','e','f','g','h','i','j'], 'z']);

  execute(binary_search.recursiveSearch, [numbers, 1000000, 0, numbers.length - 1]);
  execute(binary_search.recursiveSearch, [numbers, 10000000, 0, numbers.length - 1]);
  execute(binary_search.recursiveSearch, [['a','b','c','d','e','f','g','h','i','j'], 'c', 0, 9]);
  execute(binary_search.recursiveSearch, [['a','b','c','d','e','f','g','h','i','j'], 'z', 0, 9]);
}

void execute(Function func, List<dynamic> arguments) {
  int timeBefore = DateTime.now().microsecondsSinceEpoch;
  var searchData = Function.apply(func, arguments);
  int timeAfter = DateTime.now().microsecondsSinceEpoch;
  print("Took ${searchData['guesses']} guesses to find item at index: ${searchData['index']}");
  print('Executed in ${timeAfter - timeBefore} microseconds (10^-6)');
}
