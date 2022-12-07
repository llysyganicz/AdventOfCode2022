import 'dart:io' as io;
import 'inputParser.dart';

void main() async {
  final input = await io.File('input.txt').readAsLines();
  var root = parse(input.skip(1).toList());
  final freeSpace = 70000000 - root.Size;
  final missingSpace = 30000000 - freeSpace;

  final directories = root.getAllDirectories();
  var sizes =
      directories.map((e) => e.Size).where((s) => s >= missingSpace).toList();
  sizes.sort();
  final result = root.Size < sizes[0] ? root.Size : sizes[0];

  print(result);
}
