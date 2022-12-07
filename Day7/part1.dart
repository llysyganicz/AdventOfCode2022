import 'dart:io' as io;

void main() async {
  final input = await io.File('input.txt').readAsLines();
  Directory root = parse(input.skip(1).toList());

  final directories = root.getAllDirectories();
  var result = directories
      .map((e) => e.Size)
      .where((s) => s <= 100000 && s > 0)
      .reduce((v, e) => v + e);

  result += root.Size <= 100000 ? root.Size : 0;
  print(result);
}

Directory parse(List<String> lines) {
  Directory root = Directory('/', null);
  Directory current = root;
  for (var line in lines) {
    if (line.startsWith('\$')) {
      if (line.contains('cd ..')) {
        current = current.parent ?? root;
      } else {
        current = current.directories.firstWhere(
            (d) =>
                d.name ==
                line.split(
                  ' ',
                )[2],
            orElse: () => current);
      }
    } else {
      if (line.startsWith('dir')) {
        final name = line.split(' ')[1];
        if (!current.directories.any((d) => d.name == name)) {
          current.directories.add(Directory(name, current));
        }
      } else {
        final splittedLine = line.split(' ');
        final name = splittedLine[1];
        final size = int.parse(splittedLine[0]);
        if (!current.files.any((f) => f.name == name)) {
          current.files.add(File(name, size));
        }
      }
    }
  }

  return root;
}

class File {
  String name;
  int size;

  File(this.name, this.size);
}

class Directory {
  List<File> files = List.empty(growable: true);
  List<Directory> directories = List.empty(growable: true);
  String name;
  Directory? parent;

  Directory(this.name, this.parent);

  int get Size {
    var result = 0;
    if (files.isNotEmpty)
      result += files.map((e) => e.size).reduce((v, e) => v + e);

    if (directories.isNotEmpty)
      result += directories.map((e) => e.Size).reduce((v, e) => v + e);

    return result;
  }

  Directory? findDirectory(String name) {
    if (this.name == name) return this;

    var matchedDirectories =
        directories.where((element) => element.name == name);
    if (matchedDirectories.length == 1) return matchedDirectories.first;

    return null;
  }

  List<Directory> getAllDirectories() {
    var result = List<Directory>.empty(growable: true);
    for (var dir in directories.toList()) {
      result.add(dir);
      result.addAll(dir.getAllDirectories());
    }

    return result;
  }
}
