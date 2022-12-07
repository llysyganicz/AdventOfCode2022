enum Shape { Rock, Paper, Scissors }

class Round {
  final Shape opponentShape;
  final Shape selectedShape;

  Round(this.opponentShape, this.selectedShape);

  factory Round.asShapes(String opponent, String selected) {
    var o = Shape.Scissors;
    if (opponent == 'A') {
      o = Shape.Rock;
    } else if (opponent == 'B') {
      o = Shape.Paper;
    }

    var s = Shape.Scissors;
    if (selected == 'X') {
      s = Shape.Rock;
    } else if (selected == 'Y') {
      s = Shape.Paper;
    }

    return Round(o, s);
  }

  factory Round.asResult(String opponent, String result) {
    var o = Shape.Scissors;
    if (opponent == 'A') {
      o = Shape.Rock;
    } else if (opponent == 'B') {
      o = Shape.Paper;
    }

    if (result == 'Y') {
      return Round(o, o);
    }
    var shouldLose = result == 'X';
    switch (o) {
      case Shape.Rock:
        return shouldLose ? Round(o, Shape.Scissors) : Round(o, Shape.Paper);
      case Shape.Paper:
        return shouldLose ? Round(o, Shape.Rock) : Round(o, Shape.Scissors);
      case Shape.Scissors:
        return shouldLose ? Round(o, Shape.Paper) : Round(o, Shape.Rock);
    }
  }

  int getScore() {
    var score = 0;
    if (opponentShape == selectedShape) {
      score += 3;
    } else if ((opponentShape == Shape.Rock && selectedShape == Shape.Paper) ||
        (opponentShape == Shape.Paper && selectedShape == Shape.Scissors) ||
        (opponentShape == Shape.Scissors && selectedShape == Shape.Rock)) {
      score += 6;
    }

    switch (selectedShape) {
      case Shape.Rock:
        return score + 1;
      case Shape.Paper:
        return score + 2;
      case Shape.Scissors:
        return score + 3;
    }
  }
}
