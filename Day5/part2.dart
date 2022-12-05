import 'dart:io';
import 'dart:math';

void main() async {
  final input = await File('input.txt').readAsLines();
  final emptyLineIndex = input.indexWhere((element) => element.isEmpty);
  final stacks =
      getStacks(input.take(emptyLineIndex).toList().reversed.toList());
  final moves = getMoves(input.skip(emptyLineIndex + 1).toList());
  moves.forEach((element) => element.execute(stacks));

  for (var stack in stacks) {
    var last = stack.pop(1);
    if (last.length > 0) {
      stdout.write(last[0]);
    } else {
      stdout.write(' ');
    }
  }
}

class Stack {
  final List<String> _elements = List<String>.empty(growable: true);

  void push(List<String> elements) {
    _elements.addAll(elements);
  }

  List<String> pop(int count) {
    final startIndex = max(0, _elements.length - count);
    final toRemove = _elements.skip(startIndex).toList();
    _elements.removeRange(startIndex, _elements.length);
    return toRemove;
  }

  @override
  String toString() {
    return _elements.toString();
  }
}

class Move {
  final int count;
  final int from;
  final int to;

  Move(this.count, this.from, this.to);

  void execute(List<Stack> stacks) {
    var elements = stacks[this.from - 1].pop(this.count);
    stacks[this.to - 1].push(elements);
  }
}

List<Stack> getStacks(List<String> input) {
  final stacksCount =
      int.parse(input[0].split(' ').lastWhere((element) => element.length > 0));
  final List<Stack> stacks = List.generate(stacksCount, (index) => Stack());

  for (var i = 0; i < stacks.length; i++) {
    final startingStack = input
        .skip(1)
        .map((e) => e.substring(i * 4 + 1, i * 4 + 2))
        .where((element) => element != ' ')
        .toList();
    stacks[i].push(startingStack);
  }

  return stacks;
}

List<Move> getMoves(List<String> lines) {
  return lines.map((e) {
    final splittedLine = e.split(' ');
    final count = int.parse(splittedLine[1]);
    final from = int.parse(splittedLine[3]);
    final to = int.parse(splittedLine[5]);
    return Move(count, from, to);
  }).toList();
}
