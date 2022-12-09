import 'dart:io';
import 'move.dart';
import 'point.dart';

void main() async {
  final input = await File('input.txt').readAsLines();
  final moves = input.map((e) => Move.parse(e));
  var visitedPoints = List<Point>.empty(growable: true);
  final knots = List<Point>.generate(2, (index) => Point(0, 0));
  visitedPoints.add(Point(0, 0));
  for (var move in moves) {
    visitedPoints.addAll(move.execute(knots));
  }

  final result = visitedPoints.toSet().length;
  print(result);
}
