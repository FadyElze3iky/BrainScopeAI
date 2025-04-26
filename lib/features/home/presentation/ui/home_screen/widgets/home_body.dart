import 'package:flutter/material.dart';
import 'package:BrainScopeAI/features/home/presentation/ui/home_screen/widgets/appbar/home_bar.dart';
import 'package:BrainScopeAI/features/home/presentation/ui/home_screen/widgets/home_list/home_list.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        HomeBar(),
        HomeList(),
      ],
    );
  }
}
