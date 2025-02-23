import 'package:data_structure_and_algorithm/dsa/5_linked_list/doubly_linked_list.dart';

// https://gemini.google.com/app/3f9fe855287a036d
void main() {
  final solution = Solution();

  solution.solveSudoku([
    ["5", "3", ".", ".", "7", ".", ".", ".", "."],
    ["6", ".", ".", "1", "9", "5", ".", ".", "."],
    [".", "9", "8", ".", ".", ".", ".", "6", "."],
    ["8", ".", ".", ".", "6", ".", ".", ".", "3"],
    ["4", ".", ".", "8", ".", "3", ".", ".", "1"],
    ["7", ".", ".", ".", "2", ".", ".", ".", "6"],
    [".", "6", ".", ".", ".", ".", "2", "8", "."],
    [".", ".", ".", "4", "1", "9", ".", ".", "5"],
    [".", ".", ".", ".", "8", ".", ".", "7", "9"]
  ]);
}

class Cell {
  Cell? left, right, up, down;

  String value;
  int rowIndex;
  int colIndex;

  Cell(this.rowIndex,
      this.colIndex,
      {
        this.value = '.',
        this.left,
        this.right,
        this.up,
        this.down,
      });

  bool get isEmpty => value == '.';

  bool get isNotEmpty => value != '.';

  @override
  String toString() {
    return '$value, ($rowIndex-$colIndex)';
  }
}


class DancingLinks {
  Cell header = Cell(-1, -1);


}

class Solution {

  void solveSudoku(List<List<String>> board) {
    final numOfCol = board[0].length;
    final numOfRow = board.length;

    //1. add rows and columns in to DoublyLinkedList

    // for (int i = 0; i < numOfRow; i++) {
    //   DoublyLinkedList<Cell> row = DoublyLinkedList();
    //   for (int j = 0; j < numOfCol; j++) {
    //     row.append(Cell(
    //       board[i][j],
    //       rowIndex: i,
    //       colIndex: j,
    //     ));
    //   }
    //   rows.append(row);
    // }

    //2.insert element
    for (int i = 0; i < numOfCol; i ++) {

    }
  }

  void _backTracking(Cell cell) {
    // if(cell.isNotEmpty) return;
    //   rows[cell.rowIndex]

  }

  bool _validateRow(Cell cell, DoublyLinkedList<String> row) {
    final Iterator<String> cellIterator = row.iterator;
    while (cellIterator.moveNext()) {
      final current = cellIterator.current;
      if (cell.value == current) {
        return false;
      }
    }
    return true;
  }

  bool _validateSquare(Cell cell) {
    return true;
  }
}
