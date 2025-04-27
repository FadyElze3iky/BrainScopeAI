import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:BrainScopeAI/features/splash/presentation/controller/spalsh_controller.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashController());

    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          textDirection: TextDirection.ltr,
          children: [
            Container(
                child: Lottie.asset(
              'assets/gifs/brain_logo.json',
              frameRate: FrameRate(120),
              width: 120,
              height: 120,
              fit: BoxFit.contain,
              animate: true, // Reactive animation state
              onLoaded: (composition) async {
                await Future.delayed(Duration(seconds: 2));
              },
            )),
            Obx(
              () => controller.showText.value
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            30), // Rounded corners for the container
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(
                                10, 0, 0, 0), // Shadow color with opacity
                            spreadRadius: -5, // Spread of the shadow
                            blurRadius: 15, // Blur effect
                            offset:
                                const Offset(0, 15), // Shadow position (bottom)
                          ),
                        ],
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText('BrainScope AI',
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                      color: Theme.of(context).primaryColor),
                              speed: const Duration(milliseconds: 100),
                              cursor: ''),
                        ],
                        totalRepeatCount: 1,
                      ),
                    )
                  : const SizedBox(width: 0),
            ),
          ],
        ),
      ),
    );
  }
}
