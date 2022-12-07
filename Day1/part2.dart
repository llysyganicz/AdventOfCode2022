import 'dart:io';
import 'inputParser.dart';

void main() {
  final input = File('input.txt').readAsLinesSync();
  final calories = getCalories(input);
  calories.sort((a, b) => b - a);
  print(calories.sublist(0, 3).reduce((val, el) => val + el));
}
