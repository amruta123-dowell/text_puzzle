import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:puzzle_test/controllers/grid_controller.dart';
import 'package:puzzle_test/controllers/splash_controller.dart';
import 'package:puzzle_test/ui/grid_set_up_screen.dart';
import 'package:puzzle_test/ui/grid_view_screen.dart';
import 'package:puzzle_test/ui/splash_screen.dart';

class Routes {
  static const splash = "/splash";
  static const addGrid = '/addGrid';
  static const griViewScreen ='/gridViewScreen';
  static final routes = [
    GetPage(
        binding: BindingsBuilder(() {
          Get.put(SplashController());
        }),
        name: splash,
        page: () => const SplashScreen(key: Key(splash))),
    GetPage(
        binding: BindingsBuilder(() {
          Get.put(GridController());
        }),
        name: addGrid,
        page: () => const GridSetupScreen()),

    GetPage(binding: BindingsBuilder(() { 
       Get.find<GridController>();
    }),
    name: griViewScreen,
     page: ()=> GridViewScreen())
  ];
}
