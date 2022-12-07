import 'dart:io';
import 'inputParser.dart';

void main() {
  final input = File('input.txt').readAsLinesSync();
  final rounds = getRounds(input, false);
  var result = rounds
      .map((e) => e.getScore())
      .reduce((value, element) => value + element);
  print(result);
}
