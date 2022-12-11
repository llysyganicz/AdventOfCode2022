import 'dart:io';
import 'monkey.dart';

void main() async {
  var input = await File('input.txt').readAsLines();
  final monkeys = List<Monkey>.empty(growable: true);
  while (input.isNotEmpty) {
    final lines = input.takeWhile((value) => value.isNotEmpty).toList();
    input = input
        .skipWhile((value) => value.isNotEmpty)
        .skipWhile((value) => value.isEmpty)
        .toList();
    monkeys.add(Monkey.parse(lines));
  }

  for (var i = 0; i < 20; i++) {
    for (var monkey in monkeys) {
      while (monkey.items.isNotEmpty) {
        final result = monkey.inspect(3);
        monkeys[result.monkeyNumber].items.add(result.worryLevel);
      }
    }
  }

  monkeys.sort(((a, b) => b.itemsInspected - a.itemsInspected));
  final result =
      monkeys.take(2).map((e) => e.itemsInspected).reduce((v, e) => v * e);

  print(result);
}
