import 'move.dart';
import 'stack.dart';

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
