import 'dart:io';
import 'dart:math';
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

  final commonDivider = monkeys.map((e) => e.testValue).reduce((v, e) => v * e);
  for (var i = 0; i < 10000; i++) {
    for (var monkey in monkeys) {
      if (monkey.items.isEmpty) continue;
      if (max != monkey.testValue) {
        for (var j = 0; j < monkey.items.length; j++) {
          monkey.items[j] = monkey.items[j].remainder(commonDivider);
        }
      }
      while (monkey.items.isNotEmpty) {
        final result = monkey.inspect(1);
        monkeys[result.monkeyNumber].items.add(result.worryLevel);
      }
    }
  }

  monkeys.sort(((a, b) => b.itemsInspected - a.itemsInspected));
  final result =
      monkeys.take(2).map((e) => e.itemsInspected).reduce((v, e) => v * e);

  print(result);
}
