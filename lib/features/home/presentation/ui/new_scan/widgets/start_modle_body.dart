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
                  color: const Color.fromARGB(
                      45, 0, 0, 0), // Shadow color with opacity
                  spreadRadius: 0, // Spread of the shadow
                  blurRadius: 20, // Blur effect
                  offset: const Offset(15, 15), // Shadow position (bottom)
                ),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  if (controller.showResult.value)
                    ResultToText.fromIndex(controller.resultClass.value) !=
                            ResultToText.error
                        ? Text(
                            "Class: ${ResultToText.fromIndex(controller.resultClass.value).toString().tr}"
                                .tr)
                        : Text(
                            ResultToText.fromIndex(controller.resultClass.value)
                                .toString()
                                .tr,
                            style: TextStyle(color: Colors.red),
                          ),
                  if (controller.showResult.value)
                    if (ResultToText.fromIndex(controller.resultClass.value) !=
                        ResultToText.error)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Confidence:".tr),
                          Text(controller.resultConfidance.value),
                        ],
                      )
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
  veryMildDemented,
  error;

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
      case ResultToText.error:
        return "The confidence under 95% \nTry again with clear Brain MRI";
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
        return ResultToText.error;
    }
  }
}
