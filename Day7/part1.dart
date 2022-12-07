import 'dart:io' as io;
import 'inputParser.dart';

void main() async {
  final input = await io.File('input.txt').readAsLines();
  var root = parse(input.skip(1).toList());

  final directories = root.getAllDirectories();
  var result = directories
      .map((e) => e.Size)
      .where((s) => s <= 100000 && s > 0)
      .reduce((v, e) => v + e);

  result += root.Size <= 100000 ? root.Size : 0;
  print(result);
}
