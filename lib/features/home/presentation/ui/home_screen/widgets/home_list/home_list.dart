import 'package:BrainScopeAI/features/home/domain/entity/result_entity.dart';
import 'package:BrainScopeAI/features/home/presentation/controller/new_scan_controller.dart';
import 'package:flutter/material.dart';
import 'package:BrainScopeAI/features/home/presentation/ui/home_screen/widgets/home_list/slide_item.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class HomeList extends StatelessWidget {
  const HomeList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ScannerController());
    controller.getAllEntities();
    return Obx(() {
      return SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, index) => SlidableItem(
                    entity: controller.entityList[index],
                  ),
              childCount: controller.entityList.length));
    });
  }
}
