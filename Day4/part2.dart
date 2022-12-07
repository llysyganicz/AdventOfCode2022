import 'dart:io';
import 'inputParser.dart';

void main() {
  final input = File('input.txt').readAsLinesSync();
  var result = input
      .map((e) => parsePair(e).rangesOverlap())
      .where((e) => e == true)
      .length;
  print(result);
}
