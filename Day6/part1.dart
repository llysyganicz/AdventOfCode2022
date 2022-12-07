import 'dart:io';
import 'markerFinder.dart';

void main() async {
  final input = await File('input.txt').readAsString();
  print(findMarker(input, 4));
}
