import 'package:flutter/material.dart';
import 'package:BrainScopeAI/features/home/presentation/home_screen/ui/widgets/appbar/home_bar.dart';
import 'package:BrainScopeAI/features/home/presentation/home_screen/ui/widgets/home_list/home_list.dart';

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
