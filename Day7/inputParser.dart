import 'directory.dart';

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
