import 'dart:io';
import 'inputParser.dart';

void main() async {
  final input = await File('input.txt').readAsLines();
  final emptyLineIndex = input.indexWhere((element) => element.isEmpty);
  final stacks =
      getStacks(input.take(emptyLineIndex).toList().reversed.toList());
  final moves = getMoves(input.skip(emptyLineIndex + 1).toList());
  moves.forEach((element) => element.execute(stacks, false));

  for (var stack in stacks) {
    var last = stack.pop();
    stdout.write(last);
  }
}
