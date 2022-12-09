import 'direction.dart';

class Point {
  int x;
  int y;

  Point(this.x, this.y);

  void Move(Direction direction) {
    switch (direction) {
      case Direction.Up:
        ++y;
        break;
      case Direction.Right:
        ++x;
        break;
      case Direction.Down:
        --y;
        break;
      case Direction.Left:
        --x;
        break;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is Point) {
      return this.x == other.x && this.y == other.y;
    }

    return false;
  }

  @override
  int get hashCode => Object.hash(x, y);

  @override
  String toString() => '($x, $y)';
}
