import 'dart:typed_data';

import 'package:BrainScopeAI/features/home/domain/entity/result_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.entity});
  final ResultEntity entity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 22),
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 150,
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(
                  45, 0, 0, 0), // Shadow color with opacity
              spreadRadius: 0, // Spread of the shadow
              blurRadius: 20, // Blur effect
              offset: const Offset(15, 15), // Shadow position (bottom)
            ),
          ]),
      child: Row(
        spacing: 10.0,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
              radius: 40,
              foregroundImage: MemoryImage(Uint8List.fromList(entity.img))),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(entity.title ?? 'unknowen'.tr,
                    style: Theme.of(context).textTheme.bodyLarge),
                Text(entity.result,
                    style: Theme.of(context).textTheme.bodySmall),
                Text(entity.createdAt,
                    style: Theme.of(context).textTheme.labelSmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
