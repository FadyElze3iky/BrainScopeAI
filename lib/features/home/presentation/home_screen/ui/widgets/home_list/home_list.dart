import 'package:flutter/material.dart';
import 'package:BrainScopeAI/features/home/presentation/home_screen/ui/widgets/home_list/slide_item.dart';

class HomeList extends StatelessWidget {
  const HomeList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate:
            SliverChildBuilderDelegate((context, index) => SlidableItem()));
  }
}
