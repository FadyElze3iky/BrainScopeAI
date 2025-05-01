import 'package:BrainScopeAI/features/intro/presentation/controller/intro_controller.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:get/get.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final introKey = GlobalKey<IntroductionScreenState>();

    final IntroductionController controller = Get.put(IntroductionController());

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,

      pages: [
        PageViewModel(
          title: "Welcome to NeuroScan",
          body:
              " Supporting early detection and awareness of Alzheimer's through AI-powered insights.",
          decoration: PageDecoration(
            bodyTextStyle: TextStyle(
              color: const Color.fromARGB(255, 127, 127, 127),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            titleTextStyle: TextStyle(
              fontSize: 22,
              color: const Color.fromARGB(255, 54, 54, 54),
              fontWeight: FontWeight.bold,
            ),
            imageAlignment: Alignment.bottomCenter,
            bodyAlignment: Alignment.bottomCenter,
            bodyFlex: 1,
            imageFlex: 2,
          ),
          image: _buildImage('assets/imgs/intro_1.png'),
        ),
        PageViewModel(
          title: "Smart, simple, and secure",
          body: "Your journey toward understanding brain health starts here.",
          decoration: PageDecoration(
            bodyTextStyle: TextStyle(
              color: const Color.fromARGB(255, 127, 127, 127),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            titleTextStyle: TextStyle(
              fontSize: 22,
              color: const Color.fromARGB(255, 54, 54, 54),
              fontWeight: FontWeight.bold,
            ),
            imageAlignment: Alignment.bottomCenter,
            bodyAlignment: Alignment.bottomCenter,
            bodyFlex: 1,
            imageFlex: 2,
          ),
          image: _buildImage('assets/imgs/intro_2.png'),
        ),
        PageViewModel(
          title: "Empowering you with knowledge",
          body: "Identify cognitive changes with just one image.",
          decoration: PageDecoration(
            bodyTextStyle: TextStyle(
              color: const Color.fromARGB(255, 127, 127, 127),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            titleTextStyle: TextStyle(
              fontSize: 22,
              color: const Color.fromARGB(255, 54, 54, 54),
              fontWeight: FontWeight.bold,
            ),
            imageAlignment: Alignment.bottomCenter,
            bodyAlignment: Alignment.bottomCenter,
            bodyFlex: 1,
            imageFlex: 2,
          ),
          image: _buildImage('assets/imgs/intro_3.png'),
        ),
        PageViewModel(
          title: "Get Started",
          body:
              "Helping families and caregivers take the first step toward clarity and care.",
          decoration: PageDecoration(
            bodyTextStyle: TextStyle(
              color: const Color.fromARGB(255, 127, 127, 127),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            titleTextStyle: TextStyle(
              fontSize: 22,
              color: const Color.fromARGB(255, 54, 54, 54),
              fontWeight: FontWeight.bold,
            ),
            imageAlignment: Alignment.bottomCenter,
            bodyAlignment: Alignment.bottomCenter,
            bodyFlex: 1,
            imageFlex: 2,
          ),
          image: _buildImage('assets/imgs/intro_4.png'),
        ),
      ],
      onDone: controller.onIntroEnd,
      onSkip: controller.onIntroEnd, // Optional: skip button
      showSkipButton: true,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.grey,
        activeSize: Size(22.0, 10.0),
        activeColor: Colors.blue,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }

  Widget _buildImage(String assetName) {
    return Image.asset(assetName, width: 350);
  }
}
