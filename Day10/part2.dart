import 'dart:io';
import 'instruction.dart';

void main() async {
  final input = await File('input.txt').readAsLines();
  final instructions = input.map((e) => Instruction.parse(e));

  var value = 1;
  var cycle = 1;
  var crt = List<String>.empty(growable: true);
  crt.add('');
  for (var instruction in instructions) {
    do {
      if (crt.last.length == 40) crt.add('');
      final pixelPostion = crt.last.length + 1;
      if (pixelPostion == value ||
          pixelPostion == value + 1 ||
          pixelPostion == value + 2) {
        crt.last = crt.last + '#';
      } else {
        crt.last = crt.last + '.';
      }
      value = instruction.execute(value);
      ++cycle;
    } while (!instruction.completed);
  }

  for (var line in crt) {
    print(line);
  }
}
