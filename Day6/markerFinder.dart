import 'dart:math';

int findMarker(String input, int size) {
  for (var i = 0; i < input.length; i++) {
    final end = min(input.length, i + size);
    final window = input.substring(i, end);
    if (window.runes.toSet().length == size) {
      return end;
    }
  }

  return input.length - 1;
}
