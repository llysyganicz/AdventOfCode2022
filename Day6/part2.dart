import 'dart:io';
import 'dart:math';

void main() async {
  final input = await File('input.txt').readAsString();
  for (var i = 0; i < input.length; i++) {
    final end = min(input.length, i + 14);
    final window = input.substring(i, end);
    if (window.runes.toSet().length == 14) {
      print(end);
      break;
    }
  }
}
