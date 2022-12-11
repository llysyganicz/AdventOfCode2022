enum OperationType { multiply, add, square }

class Operation {
  final OperationType type;
  final int value;

  Operation(this.type, {this.value = 0});

  int execute(int worryLevel) {
    switch (type) {
      case OperationType.multiply:
        return worryLevel * value;
      case OperationType.add:
        return worryLevel + value;
      case OperationType.square:
        return worryLevel * worryLevel;
    }
  }
}
