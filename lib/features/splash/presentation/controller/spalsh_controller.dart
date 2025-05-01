import 'package:get/get.dart';
import 'package:hive/hive.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var showText = false.obs;
  @override
  void onInit() async {
    super.onInit();

    // Ensure Hive is initialized (you can also do this in main.dart)
    var box = await Hive.openBox('appSettings');

    // Check if the app has been opened before
    bool hasOpened = box.get('hasOpened', defaultValue: false);

    // Set showText to true after 3 seconds
    await Future.delayed(const Duration(seconds: 3), () {
      showText.value = true;
    });

    // Navigate after 5 seconds based on hasOpened
    await Future.delayed(const Duration(seconds: 3), () {
      if (hasOpened) {
        Get.offNamed('/home');
        box.close();
      } else {
        // Set hasOpened to true for future checks
        box.put('hasOpened', true);
        Get.offNamed('/IntroductionScreen');
        box.close();
      }
    });
  }

  @override
  void onClose() {
    // Close Hive box when controller is disposed
    super.onClose();
  }
}
