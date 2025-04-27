import 'package:BrainScopeAI/features/home/presentation/controller/new_scan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class StartModleBody extends StatelessWidget {
  const StartModleBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ScannerController>();
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 20,
                    blurStyle: BlurStyle.normal,
                    color: const Color.fromARGB(255, 157, 157, 157),
                    offset: Offset(10, 2),
                    spreadRadius: 2),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.file(
                controller.image.value,
                height: 250,
                width: 250,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Obx(() {
            if (controller.showResult.value == false) {
              return GestureDetector(
                onTap: () async {
                  Feedback.forTap(context);
                  controller.toggleButton();
                  await Future.delayed(Duration(milliseconds: 2500));
                  await controller.runModel();

                  controller.showResult.value = true;
                },
                child: Lottie.asset(
                  'assets/gifs/button.json',
                  frameRate: FrameRate(120),
                  width: 80,
                  height: 80,
                  fit: BoxFit.contain,
                  animate: controller
                      .toggleAnimation.value, // Reactive animation state
                  repeat: false,
                ),
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  if (controller.showResult.value)
                    Text(
                        "Class: ${ResultToText.fromIndex(controller.resultClass.value).toString()}"),
                  if (controller.showResult.value)
                    Text("Confidence: ${controller.resultConfidance.value}"),
                ],
              );
            }
          }),
        ],
      ),
    );
  }
}
// ['Mild Demented', 'Moderate Demented', 'Non Demented', 'Very MildDemented']

enum ResultToText {
  mildDemented,
  moderateDemented,
  nonDemented,
  veryMildDemented;

  @override
  String toString() {
    switch (this) {
      case ResultToText.mildDemented:
        return 'Mild Demented';
      case ResultToText.moderateDemented:
        return 'Moderate Demented';
      case ResultToText.nonDemented:
        return 'Non Demented';
      case ResultToText.veryMildDemented:
        return 'Very Mild Demented';
    }
  }

  // Static method to get enum value by index
  static ResultToText fromIndex(String index) {
    switch (index) {
      case '0':
        return ResultToText.mildDemented;
      case '1':
        return ResultToText.moderateDemented;
      case '2':
        return ResultToText.nonDemented;
      case '3':
        return ResultToText.veryMildDemented;
      default:
        throw RangeError('Invalid index: $index');
    }
  }
}
