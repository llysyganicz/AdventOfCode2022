import 'dart:io';

void main() {
  final input = File('input.txt').readAsLinesSync();
  final rounds = getRounds(input);
  var result = rounds
      .map((e) => e.getScore())
      .reduce((value, element) => value + element);
  print(result);
}

enum Shape { Rock, Paper, Scissors }

List<Round> getRounds(List<String> input) {
  var rounds = List<Round>.empty(growable: true);
  for (var line in input) {
    var splittedLine = line.split(' ');
    rounds.add(Round.fromString(splittedLine[0], splittedLine[1]));
  }

  return rounds;
}

class Round {
  final Shape opponentShape;
  final Shape selectedShape;

  Round(this.opponentShape, this.selectedShape);

  factory Round.fromString(String opponent, String selected) {
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
