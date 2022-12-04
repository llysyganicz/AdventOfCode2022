import 'dart:io';

void main() {
  final input = File('input.txt').readAsLinesSync();
  var result = input
      .map((e) => parsePair(e).rangesOverlap())
      .where((e) => e == true)
      .length;
  print(result);
}

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

class Assignment {
  final int start;
  final int end;

  Assignment(this.start, this.end);
}

class Pair {
  final Assignment _firstAssignment;
  final Assignment _secondAssignment;

  Pair(this._firstAssignment, this._secondAssignment);

  bool rangesOverlap() {
    final firstRange = List.generate(
        _firstAssignment.end - _firstAssignment.start + 1,
        (index) => _firstAssignment.start + index);
    final secondRange = List.generate(
        _secondAssignment.end - _secondAssignment.start + 1,
        (index) => _secondAssignment.start + index);
    return firstRange.toSet().intersection(secondRange.toSet()).length > 0;
  }
}
