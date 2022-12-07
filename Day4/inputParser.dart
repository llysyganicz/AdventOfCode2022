import 'assignment.dart';
import 'pair.dart';

Pair parsePair(String line) {
  var splittedLine = line.split(',');
  final first = parseAssignment(splittedLine[0]);
  final second = parseAssignment(splittedLine[1]);
  return Pair(first, second);
}

Assignment parseAssignment(String text) {
  var splittedText = text.split('-');
  final start = int.parse(splittedText[0]);
  final end = int.parse(splittedText[1]);
  return Assignment(start, end);
}
