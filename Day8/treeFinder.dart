class SearchResult {
  final bool isVisible;
  final int treesInView;

  SearchResult(this.isVisible, this.treesInView);
}

bool isTreeVisible(List<List<int>> trees, int row, int column) {
  return isVisibleFromBottom(trees, row, column).isVisible ||
      isVisibleFromTop(trees, row, column).isVisible ||
      isVisibleFromLeft(trees, row, column).isVisible ||
      isVisibleFromRigth(trees, row, column).isVisible;
}

int getScenicScore(List<List<int>> trees, int row, int column) {
  final bottom = isVisibleFromBottom(trees, row, column);
  final top = isVisibleFromTop(trees, row, column);
  final left = isVisibleFromLeft(trees, row, column);
  final right = isVisibleFromRigth(trees, row, column);

  if (bottom.isVisible || top.isVisible || left.isVisible || right.isVisible) {
    return bottom.treesInView *
        top.treesInView *
        left.treesInView *
        right.treesInView;
  }

  return 0;
}

SearchResult isVisibleFromTop(List<List<int>> trees, int row, int column) {
  if (row == 0) return SearchResult(true, 0);

  final tree = trees[row][column];
  var count = 0;
  for (var i = row - 1; i >= 0; i--) {
    ++count;
    if (trees[i][column] >= tree) return SearchResult(false, count);
  }

  return SearchResult(true, count);
}

SearchResult isVisibleFromBottom(List<List<int>> trees, int row, int column) {
  if (row == trees.length - 1) SearchResult(true, 0);

  final tree = trees[row][column];
  var count = 0;
  for (var i = row + 1; i < trees.length; i++) {
    ++count;
    if (trees[i][column] >= tree) return SearchResult(false, count);
  }

  return SearchResult(true, count);
}

SearchResult isVisibleFromLeft(List<List<int>> trees, int row, int column) {
  if (column == 0) return SearchResult(true, 0);

  final tree = trees[row][column];
  var count = 0;
  for (var i = column - 1; i >= 0; i--) {
    ++count;
    if (trees[row][i] >= tree) return SearchResult(false, count);
  }

  return SearchResult(true, count);
}

SearchResult isVisibleFromRigth(List<List<int>> trees, int row, int column) {
  if (column == trees[row].length - 1) return SearchResult(true, 0);

  final tree = trees[row][column];
  var count = 0;
  for (var i = column + 1; i < trees[row].length; i++) {
    ++count;
    if (trees[row][i] >= tree) return SearchResult(false, count);
  }

  return SearchResult(true, count);
}
