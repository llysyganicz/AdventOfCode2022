import 'dart:io';
import 'package:collection/collection.dart';

void main() {
  final input = File('input.txt').readAsLinesSync();
  var result =
      input.slices(3).map((e) => getPriority(e)).reduce((v, e) => v + e);
  print(result);
}

int getPriority(List<String> group) {
  var sets = group.map((e) => Set.of(e.runes)).toList();
  var commonItem = sets[0].intersection(sets[1]).intersection(sets[2]).first;
  final lowerStarting = Runes('a').first;
  if (commonItem >= lowerStarting) {
    return commonItem - lowerStarting + 1;
  }

  final upperStarting = Runes('A').first;
  return commonItem - upperStarting + 27;
}
