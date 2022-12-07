import 'round.dart';

List<Round> getRounds(List<String> input, bool asResult) {
  var rounds = List<Round>.empty(growable: true);
  for (var line in input) {
    var splittedLine = line.split(' ');
    if (asResult)
      rounds.add(Round.asResult(splittedLine[0], splittedLine[1]));
    else
      rounds.add(Round.asShapes(splittedLine[0], splittedLine[1]));
  }

  return rounds;
}
