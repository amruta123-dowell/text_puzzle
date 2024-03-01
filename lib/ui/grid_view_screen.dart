// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puzzle_test/controllers/grid_controller.dart';

class GridViewScreen extends GetView<GridController> {
  const GridViewScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Alphabets'),
      ),
      body: GetBuilder<GridController>(builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: controller.noColumns,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: controller.noRows * controller.noColumns,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.blue,
                child: Center(
                  child: Text(
                    controller.alphabetList[index],
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ),
              );
            },
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.check),
      ),
    );
  }
}
