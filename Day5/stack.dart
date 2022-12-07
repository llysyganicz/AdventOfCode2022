import 'dart:math';

class Stack {
  final List<String> _elements = List<String>.empty(growable: true);

  void push(String element) {
    _elements.add(element);
  }

  String pop() {
    return _elements.removeLast();
  }

  void pushMany(List<String> elements) {
    _elements.addAll(elements);
  }

  List<String> popMany(int count) {
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
