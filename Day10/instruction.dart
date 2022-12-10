enum InstructionType { noop, addx }

class Instruction {
  final InstructionType type;
  final int? value;
  int remainingCycles;
  bool completed = false;

  Instruction(this.type, this.value, {this.remainingCycles = 1});

  factory Instruction.parse(String line) {
    if (line == 'noop') return Instruction(InstructionType.noop, null);

    final splittedLine = line.split(' ');
    return Instruction(InstructionType.addx, int.parse(splittedLine[1]),
        remainingCycles: 2);
  }

  int execute(int x) {
    --remainingCycles;
    completed = remainingCycles == 0;
    if (type == InstructionType.addx && completed) return x + value!;

    return x;
  }
}
