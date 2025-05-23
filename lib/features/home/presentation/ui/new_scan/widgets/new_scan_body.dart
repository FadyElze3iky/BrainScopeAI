import 'package:BrainScopeAI/features/home/presentation/controller/new_scan_controller.dart';
import 'package:BrainScopeAI/features/home/presentation/ui/new_scan/widgets/start_modle_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class NewScanBody extends StatelessWidget {
  const NewScanBody({super.key});

  @override
  Widget build(BuildContext context) {
    ScannerController controller = Get.find();
    return Obx(() {
      if (controller.image.value.path == '') {
        return Row(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Feedback.forTap(context);
                controller.pickImage();
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/gifs/gallery_animation.json',
                    frameRate: FrameRate(120),
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                    animate: true, // Reactive animation state
                  ),
                  Text('From Gallery'.tr)
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.showSnackbar(GetSnackBar(
                  message: 'The scan feature is not supported yet.',
                  duration: Duration(seconds: 2),
                  backgroundColor: const Color.fromARGB(144, 23, 88, 227),
                ));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/gifs/scan_animation.json',
                    frameRate: FrameRate(120),
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                    animate: true, // Reactive animation state
                  ),
                  Text(
                    'Camera Scan'.tr,
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ],
        );
      } else {
        return StartModleBody();
      }
    });
  }
}
