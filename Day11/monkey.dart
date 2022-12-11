import 'operation.dart';

class InspectResult {
  final int monkeyNumber;
  final int worryLevel;

  InspectResult(this.monkeyNumber, this.worryLevel);
}

class Monkey {
  final List<int> items;
  final Operation operation;
  final int testValue;
  final int firstMonkeyNumber;
  final int secondMonkeyNumber;

  int _itemsInspected = 0;

  int get itemsInspected {
    return _itemsInspected;
  }

  Monkey(this.items, this.operation, this.testValue, this.firstMonkeyNumber,
      this.secondMonkeyNumber);

  factory Monkey.parse(List<String> lines) {
    // starting items
    var i = lines[1].indexOf(':');
    final startingItems = lines[1]
        .substring(i + 1)
        .split(', ')
        .map((e) {
          final val = int.tryParse(e);
          return val != null ? val : -1;
        })
        .where((e) => e != -1)
        .toList();

    // operation
    i = lines[2].indexOf('new = ');
    final tokens = lines[2].substring(i).split(' ');
    final op = tokens[3] == '+'
        ? Operation(OperationType.add, value: int.parse(tokens[4]))
        : tokens[4] == 'old'
            ? Operation(OperationType.square)
            : Operation(OperationType.multiply, value: int.parse(tokens[4]));

    // test value
    final tv = int.parse(lines[3].split(' ').last);

    // first monkey
    final fm = int.parse(lines[4].split(' ').last);

    // seconf monkey
    final sm = int.parse(lines[5].split(' ').last);

    return Monkey(startingItems, op, tv, fm, sm);
  }

  InspectResult inspect(int divisor) {
    ++_itemsInspected;
    var item = items.first;
    items.removeAt(0);

    item = operation.execute(item) ~/ divisor;
    final testPassed = item.remainder(testValue) == 0;

    return InspectResult(
        testPassed ? firstMonkeyNumber : secondMonkeyNumber, item);
  }

  @override
  String toString() {
    return '$itemsInspected';
  }
}
