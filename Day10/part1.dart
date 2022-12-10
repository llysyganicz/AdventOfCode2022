import 'dart:io';
import 'instruction.dart';

void main() async {
  final input = await File('input.txt').readAsLines();
  final instructions = input.map((e) => Instruction.parse(e));

  var value = 1;
  var cycle = 1;
  var result = 0;
  final cycles = List.generate(6, (index) => 20 + 40 * index);
  for (var instruction in instructions) {
    do {
      if (cycles.contains(cycle)) result += value * cycle;

      value = instruction.execute(value);
      ++cycle;
    } while (!instruction.completed);
  }

  print(result);
}
