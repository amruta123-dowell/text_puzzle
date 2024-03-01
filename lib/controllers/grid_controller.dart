import 'dart:developer';

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
  bool isMatrixExceed = false;

  @override
  void onInit() {
    super.onInit();
  }

  void validateRowText(String? value) {
    if (value == null || value.isEmpty) {
      errRow = "This Field is required";
    } else {
      if (noRows != int.parse(value)) {
        noRows = int.parse(value);
        alphabetList.clear();
        validateAlphabetList();
      }
      errRow = null;
    }

    update();
  }

  void validateColumnText(String? value) {
    if (value == null || value.isEmpty) {
      errColumn = "This field is required";
    } else {
      if (noColumns != int.parse(value)) {
        noColumns = int.parse(value);
        alphabetList.clear();
        validateAlphabetList();
      }
      errColumn = null;
    }

    update();
  }

  void validateAlphabetList() {
    if (alphabetList.length != matrixSize &&
        rowController.text.isNotEmpty &&
        columnController.text.isNotEmpty) {
      matrixSize = noColumns * noRows;
      errChar = "Alphabets are missing.";
    } else {
      errChar = null;
    }
    update();
  }

  void addCharList(value) {
    print("text-------------------------------> $value");

    if (rowController.text.isNotEmpty && columnController.text.isNotEmpty) {
      noRows = int.parse(rowController.text);
      noColumns = int.parse(columnController.text);
      matrixSize = noRows * noColumns;
      update();
      if (alphabetList.length < matrixSize) {
        alphabetList.add(value);
        if (alphabetList.length == matrixSize) {
          errChar = null;
        }
      }
    }
    charController.clear();
    update();
  }

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
}
