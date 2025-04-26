import 'package:flutter/material.dart';
import 'package:BrainScopeAI/features/home/presentation/ui/home_screen/widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        top: false,
        child: Scaffold(
          body: HomeBody(),
        ),
      ),
    );
  }
}
