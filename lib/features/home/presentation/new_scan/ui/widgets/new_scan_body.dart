import 'package:BrainScopeAI/features/home/presentation/new_scan/controller/new_scan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';

class NewScanBody extends StatelessWidget {
  const NewScanBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ScannerController());
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
                  Text('From Gallery')
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                // Feedback.forTap(context);
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
                    'Camera Scan',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ],
        );
      } else {
        return Center(
          child: Image.file(controller.image.value),
        );
      }
    });
  }
}
