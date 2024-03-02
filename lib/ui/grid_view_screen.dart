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
        backgroundColor: Colors.redAccent,
        title: const Text('Search word'),
      ),
      body: GetBuilder<GridController>(builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: controller.searchController,
                autocorrect: false,
                onChanged: (value) {
                  controller.searchGrid();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: controller.noColumns,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: controller.noRows * controller.noColumns,
                  itemBuilder: (context, index) {
                    return Container(
                      color: controller.isHighlightedGrid(index)
                          ? Colors.green
                          : Colors.yellow,
                      child: Center(
                        child: Text(
                          controller.alphabetList[index],
                          style: const TextStyle(fontSize: 20.0),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
