import 'dart:io';

void main() {
  final input = File('input.txt').readAsLinesSync();
  final calories = getCalories(input);
  calories.sort((a, b) => b - a);
  print(calories.sublist(0, 3).reduce((val, el) => val + el));
}

List<int> getCalories(List<String> input) {
  final calories = List<int>.empty(growable: true);

  var sum = 0;
  for (var line in input) {
    if (line.isEmpty) {
      calories.add(sum);
      sum = 0;
    } else {
      sum += int.parse(line);
    }
  }

  return calories;
}
