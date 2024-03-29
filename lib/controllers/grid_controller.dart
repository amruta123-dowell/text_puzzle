import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../route_management/routes.dart';

class GridController extends GetxController {
  int noRows = 0;
  int noColumns = 0;
  List<String> alphabetList = [];
  TextEditingController rowController = TextEditingController();
  TextEditingController columnController = TextEditingController();
  TextEditingController charController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  String? errRow;
  String? errColumn;
  String? errChar;
  int matrixSize = -1;

  List<int> highlightedCells = [];
  String searchText = '';

  @override
  void onInit() {
    super.onInit();
  }

//validate Row
  void validateRowText(String? value) {
    if (value == null || value.isEmpty) {
      errRow = "This Field is required.";
    } else if (value == "0") {
      errRow = "the row size should not be zero.";
    } else {
      errRow = null;
      noRows = int.parse(value);
    }
    if (errRow != null) {
      charController.clear();
      alphabetList.clear();
      validateAlphabetList();
    }
    update();
  }

//validate column
  void validateColumnText(String? value) {
    if (value == null || value.isEmpty) {
      errColumn = "This field is required.";
    } else if (value == "0") {
      errColumn = "The column should not be zero.";
    } else {
      noColumns = int.parse(value);
      errColumn = null;
    }
    if (errColumn != null) {
      charController.clear();
      alphabetList.clear();
      validateAlphabetList();
    }
    update();
  }

//validate (row * column) number of elements are present or not.
  void validateAlphabetList() {
    alphabetList.clear();

    searchText = charController.text.removeAllWhitespace;
    matrixSize = noColumns * noRows;
    if (searchText.length != matrixSize &&
        rowController.text.isNotEmpty &&
        columnController.text.isNotEmpty) {
      matrixSize = noColumns * noRows;
      errChar = "Alphabets are missing.";
    } else {
      List<String> characterList = searchText.split('');
      alphabetList.addAll(characterList);
      errChar = null;
    }
    update();
  }

  ///submit the grid matrix data and navigate to the Grid view screen
  void submitGridDetails() {
    validateColumnText(columnController.text);
    validateRowText(rowController.text);
    validateAlphabetList();
    if (errColumn == null &&
        errRow == null &&
        errChar == null &&
        alphabetList.length == matrixSize) {
      Get.toNamed(Routes.griViewScreen);
    }

    update();
  }

  void searchGrid() {
    searchText = searchController.text.toLowerCase();
    highlightedCells.clear();
    update();
    if (searchText.isEmpty) return;

    for (int row = 0; row < noRows; row++) {
      for (int col = 0; col < noColumns; col++) {
        searchHorizontally(row, col);
        searchVertically(row, col);
        searchDiagonallyNWtoSE(row, col);
        searchDiagonallySWtoNE(row, col);
        searchHorizontallyReverse(row, col);
        searchVerticallyReverse(row, col);
        searchDiagonallySEtoNW(row, col);
        searchDiagonallyNEtoSW(row, col);
      }
    }
    update();
  }

  void searchHorizontally(int row, int col) {
    int currentCol = col;
    for (int i = 0; i < searchController.text.length; i++) {
      if (currentCol >= noColumns ||
          searchController.text[i].toLowerCase() !=
              alphabetList[row * noColumns + currentCol]) {
        return; // No match, exit loop
      }
      highlightedCells.add(row * noColumns + currentCol);
      currentCol++;
    }
  }

  void searchVertically(int row, int col) {
    int currentRow = row;
    for (int i = 0; i < searchController.text.length; i++) {
      if (currentRow >= noRows ||
          searchController.text[i].toLowerCase() !=
              alphabetList[currentRow * noColumns + col]) {
        return; // No match, exit loop
      }
      highlightedCells.add(currentRow * noColumns + col);
      currentRow++;
    }
  }

  void searchDiagonallyNWtoSE(int row, int col) {
    int currentRow = row, currentCol = col;
    for (int i = 0; i < searchController.text.length; i++) {
      if (currentRow >= noRows ||
          currentCol >= noColumns ||
          searchController.text[i].toLowerCase() !=
              alphabetList[currentRow * noColumns + currentCol]) {
        return; // No match, exit loop
      }
      highlightedCells.add(currentRow * noColumns + currentCol);
      currentRow++;
      currentCol++;
    }
  }

  void searchDiagonallySWtoNE(int row, int col) {
    int currentRow = row, currentCol = col;
    for (int i = 0; i < searchController.text.length; i++) {
      if (currentRow >= noRows ||
          currentCol < 0 ||
          currentRow < 0 ||
          searchController.text[i].toLowerCase() !=
              alphabetList[currentRow * noColumns + currentCol]) {
        return; // No match, exit loop
      }
      highlightedCells.add(currentRow * noColumns + currentCol);
      currentRow--;
      currentCol++;
    }
  }

//Reverse searches
  void searchHorizontallyReverse(int row, int col) {
    int searchTextLength = searchController.text.length;
    for (int i = 0; i < searchTextLength; i++) {
      int currentCol = col - i;
      if (currentCol >= noColumns ||
          currentCol < 0 ||
          searchController.text[i].toLowerCase() !=
              alphabetList[row * noColumns + currentCol]) {
        return; // No match, exit loop
      }
      highlightedCells.add(row * noColumns + currentCol);
    }
  }

  void searchVerticallyReverse(int row, int col) {
    int searchTextLength = searchController.text.length;
    for (int i = 0; i < searchTextLength; i++) {
      // Adjusted check to avoid negative row index
      int currentRow = row - i;
      if (currentRow >= noRows ||
          currentRow < 0 ||
          searchController.text[i].toLowerCase() !=
              alphabetList[currentRow * noColumns + col]) {
        return; // No match, exit loop
      }
      highlightedCells.add(currentRow * noColumns + col);
    }
  }

  void searchDiagonallySEtoNW(int row, int col) {
    int searchTextLength = searchController.text.length;
    // Iterate through search text characters in reverse order
    for (int i = searchTextLength - 1; i >= 0; i--) {
      // Calculate cell positions considering the diagonal direction (bottom-left to top-right)
      int currentRow = row + (searchTextLength - 1 - i), currentCol = col - i;
      // Check for valid indices and character match
      if (currentRow >= noRows ||
          currentCol < 0 ||
          searchController.text[i].toLowerCase() !=
              alphabetList[currentRow * noColumns + currentCol]) {
        return; // No match, exit loop
      }
      highlightedCells.add(currentRow * noColumns + currentCol);
    }
  }

  void searchDiagonallyNEtoSW(int row, int col) {
    int searchTextLength = searchController.text.length;
    for (int i = 0; i < searchTextLength; i++) {
      int currentRow = row + i, currentCol = col - i;

      if (currentRow >= noRows ||
          currentCol < 0 ||
          searchController.text[i].toLowerCase() !=
              alphabetList[currentRow * noColumns + currentCol]) {
        return; // No match, exit loop
      }
      highlightedCells.add(currentRow * noColumns + currentCol);
    }
  }

  bool isHighlightedGrid(int index) {
    if (highlightedCells.isEmpty) {
      return false; // No search in progress
    }
    List<int> _uniqueList = [];
    List<String> searchTextList = searchText.split('');
    for (int i = 0; i < highlightedCells.length; i++) {
      if (!(_uniqueList.contains(highlightedCells[i]))) {
        _uniqueList.add(highlightedCells[i]);
      }
    }

    // Check if any character in searchText is not present in highlightedCells
    for (String character in searchTextList) {
      if (!highlightedCells
          .any((cellIndex) => alphabetList[cellIndex] == character)) {
        // Character not found, entire word cannot match
        highlightedCells.clear(); // Clear highlighted cells
        displaySnackbar();
        return false;
      }
    }

    return highlightedCells.contains(index);
  }

  void resetMatrix() {
    alphabetList.clear();
    matrixSize = -1;
    noColumns = 0;
    noRows = 0;
    searchController.clear();
    rowController.clear();
    columnController.clear();
    charController.clear();
    searchText = '';
    errChar = null;
    errColumn = null;
    errRow = null;
    update();
    Get.back();
  }

  displaySnackbar() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
        content: Text(
          "Not found. Please search with other text.",
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        backgroundColor: Colors.red,
      ));
    });
  }
}
