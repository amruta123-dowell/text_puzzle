import 'package:get/get.dart';

import '../route_management/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(milliseconds: 500))
        .then((value) => Get.offAndToNamed(Routes.addGrid));
    super.onInit();
  }
}
