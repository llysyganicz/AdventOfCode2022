import 'dart:io';

void main() {
  final input = File('input.txt').readAsLinesSync();
  var result = input.map((e) => getPriority(e)).reduce((v, e) => v + e);
  print(result);
}

int getPriority(String line) {
  var length = line.length ~/ 2;
  var commonItem = line.runes
      .take(length)
      .toSet()
      .intersection(line.runes.skip(length).take(length).toSet())
      .first;
  final lowerStarting = Runes('a').first;
  if (commonItem >= lowerStarting) {
    return commonItem - lowerStarting + 1;
  }

  final upperStarting = Runes('A').first;
  return commonItem - upperStarting + 27;
}
