import 'assignment.dart';

class Pair {
  final Assignment _firstAssignment;
  final Assignment _secondAssignment;

  Pair(this._firstAssignment, this._secondAssignment);

  bool containsFullRange() {
    return (_firstAssignment.start <= _secondAssignment.start &&
            _firstAssignment.end >= _secondAssignment.end) ||
        (_secondAssignment.start <= _firstAssignment.start &&
            _secondAssignment.end >= _firstAssignment.end);
  }

  bool rangesOverlap() {
    final firstRange = List.generate(
        _firstAssignment.end - _firstAssignment.start + 1,
        (index) => _firstAssignment.start + index);
    final secondRange = List.generate(
        _secondAssignment.end - _secondAssignment.start + 1,
        (index) => _secondAssignment.start + index);
    return firstRange.toSet().intersection(secondRange.toSet()).length > 0;
  }
}
