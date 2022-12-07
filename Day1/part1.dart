import 'dart:io';
import 'inputParser.dart';

void main() {
  final input = File('input.txt').readAsLinesSync();
  final calories = getCalories(input);
  calories.sort((a, b) => a - b);
  print(calories.last);
}
