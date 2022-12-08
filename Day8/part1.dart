import 'dart:io';
import 'treeFinder.dart';

void main() async {
  final input = await File('input.txt').readAsLines();
  var trees = List<List<int>>.generate(
      input.length,
      (row) => List.generate(input[row].length,
          (column) => int.parse(input[row].substring(column, column + 1))));

  var count = 0;
  for (var row = 0; row < trees.length; row++) {
    for (var column = 0; column < trees[row].length; column++) {
      if (isTreeVisible(trees, row, column)) ++count;
    }
  }

  print(count);
}
