import 'package:get/get.dart';

class IntroductionController extends GetxController {
  void onIntroEnd() async {
    // Navigate to Home or Login or any other page

    Get.offNamed('/home'); // Assuming you have '/home' route
  }
}
