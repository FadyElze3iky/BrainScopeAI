import 'package:BrainScopeAI/features/home/presentation/controller/new_scan_controller.dart';
import 'package:flutter/material.dart';
import 'package:BrainScopeAI/features/home/presentation/ui/home_screen/widgets/home_list/slide_item.dart';
import 'package:get/get.dart';

class HomeList extends StatelessWidget {
  const HomeList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ScannerController>();

    return Obx(() {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
            (context, index) => SlidableItem(
                  entity: controller.entityList[index],
                ),
            childCount: controller.entityList.length),
      );
    });
  }
}
