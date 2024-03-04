import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:puzzle_test/controllers/grid_controller.dart';
import 'package:puzzle_test/custom_widgets/text_field_widget.dart';

class GridSetupScreen extends GetView<GridController> {
  const GridSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Set up grid matrix'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GetBuilder<GridController>(builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFieldWidget(
                    onChanged: (value) {
                      controller.validateRowText(value);
                    },
                    keyboardType: TextInputType.number,
                    errorText: controller.errRow,
                    title: "Number of rows",
                    tecController: controller.rowController),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                    onChanged: (value) {
                      controller.validateColumnText(value);
                    },
                    keyboardType: TextInputType.number,
                    errorText: controller.errColumn,
                    title: "No of columns",
                    tecController: controller.columnController),
                const SizedBox(
                  height: 10,
                ),
                controller.alphabetList.length != controller.matrixSize
                    ? TextFieldWidget(
                        maxLength: 1,
                        onChanged: (value) {
                          controller.validateAlphabetList();
                        },
                        title: "Type a character",
                        tecController: controller.charController,
                        onFieldSubmitted: (value) {
                          controller.addCharList(value);
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                        ],
                      )
                    : const SizedBox.shrink(),
                const SizedBox(
                  height: 10,
                ),
                if (controller.errChar != null &&
                    controller.errColumn == null &&
                    controller.errRow == null)
                  Text(
                    "Note: You have to enter ${controller.matrixSize - controller.alphabetList.length} characters",
                    style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.submitGridDetails();
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: Text(
                    controller.alphabetList.length != controller.matrixSize
                        ? "submit"
                        : 'Let\'s Start',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 69, 3, 3),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
