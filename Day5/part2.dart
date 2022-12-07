import 'dart:io';
import 'inputParser.dart';

void main() async {
  final input = await File('input.txt').readAsLines();
  final emptyLineIndex = input.indexWhere((element) => element.isEmpty);
  final stacks =
      getStacks(input.take(emptyLineIndex).toList().reversed.toList());
  final moves = getMoves(input.skip(emptyLineIndex + 1).toList());
  moves.forEach((element) => element.execute(stacks, true));

  for (var stack in stacks) {
    var last = stack.pop();
    if (last.length > 0) {
      stdout.write(last[0]);
    } else {
      stdout.write(' ');
    }
  }
}
