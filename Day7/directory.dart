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
