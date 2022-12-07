import 'stack.dart';

class Move {
  final int count;
  final int from;
  final int to;

  Move(this.count, this.from, this.to);

  void execute(List<Stack> stacks, bool multipleAtOnece) {
    if (multipleAtOnece) {
      var elements = stacks[this.from - 1].popMany(this.count);
      stacks[this.to - 1].pushMany(elements);
    } else {
      for (var i = 0; i < this.count; i++) {
        var element = stacks[this.from - 1].pop();
        stacks[this.to - 1].push(element);
      }
    }
  }
}
