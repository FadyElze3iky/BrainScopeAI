import 'package:get/get.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var showText = false.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      showText.value = true;
    });
    Future.delayed(const Duration(seconds: 5), () {
      Get.offNamed('/home');
    });
  }
}
