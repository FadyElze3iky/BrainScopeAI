import 'package:BrainScopeAI/features/home/domain/entity/result_entity.dart';
import 'package:BrainScopeAI/features/home/presentation/controller/new_scan_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:BrainScopeAI/features/home/presentation/ui/home_screen/widgets/home_list/list_item.dart';
import 'package:get/instance_manager.dart';
import 'package:get/utils.dart';

class SlidableItem extends StatelessWidget {
  const SlidableItem({super.key, required this.entity});
  final ResultEntity entity;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ScannerController>();
    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: const ValueKey(0),

      // The start action pane is the one at the left or the top side.
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(onDismissed: () {}),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (context) {
              entity.delete();
              controller.getAllEntities();
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),

      // The child of the Slidable is what the user sees when the
      // component is not dragged.
      child: ListItem(
        entity: entity,
      ),
    );
  }
}
