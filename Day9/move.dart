import 'direction.dart';
import 'point.dart';

class Move {
  final int distance;
  final Direction direction;

  Move(this.distance, this.direction);

  factory Move.parse(String input) {
    final splittedLine = input.split(' ');
    var d = Direction.Up;
    if (splittedLine[0] == 'R')
      d = Direction.Right;
    else if (splittedLine[0] == 'D')
      d = Direction.Down;
    else if (splittedLine[0] == 'L') d = Direction.Left;

    return Move(int.parse(splittedLine[1]), d);
  }

  List<Point> execute(List<Point> knots) {
    List<Point> result = List.empty(growable: true);
    for (var n = 0; n < distance; n++) {
      knots[0].Move(direction);

      for (var i = 1; i < knots.length; i++) {
        final current = knots[i];
        final previous = knots[i - 1];
        final dx = previous.x - current.x;
        final dy = previous.y - current.y;

        if (dx.abs() > 1 || dy.abs() > 1) {
          current.x += dx.sign;
          current.y += dy.sign;
        }
      }

      result.add(Point(knots.last.x, knots.last.y));
    }

    return result;
  }
}
