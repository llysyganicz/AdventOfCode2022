import 'dart:io';

void main() async {
  final input = await File('input.txt').readAsLines();
  final emptyLineIndex = input.indexWhere((element) => element.isEmpty);
  final stacks =
      getStacks(input.take(emptyLineIndex).toList().reversed.toList());
  final moves = getMoves(input.skip(emptyLineIndex + 1).toList());
  moves.forEach((element) => element.execute(stacks));

  for (var stack in stacks) {
    var last = stack.pop();
    stdout.write(last);
  }
}

class Stack {
  final List<String> _elements = List<String>.empty(growable: true);

  void push(String element) {
    _elements.add(element);
  }

  String pop() {
    return _elements.removeLast();
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
    for (var i = 0; i < this.count; i++) {
      var element = stacks[this.from - 1].pop();
      stacks[this.to - 1].push(element);
    }
  }
}

List<Stack> getStacks(List<String> input) {
  final stacksCount =
      int.parse(input[0].split(' ').lastWhere((element) => element.length > 0));
  final List<Stack> stacks = List.generate(stacksCount, (index) => Stack());

  for (var i = 0; i < stacks.length; i++) {
    input
        .skip(1)
        .map((e) => e.substring(i * 4 + 1, i * 4 + 2))
        .where((element) => element != ' ')
        .forEach((element) => stacks[i].push(element));
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
