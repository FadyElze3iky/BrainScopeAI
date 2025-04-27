import 'dart:typed_data';

import 'package:BrainScopeAI/features/home/domain/entity/result_entity.dart';
import 'package:flutter/material.dart';

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
                color:
                    const Color.fromARGB(255, 145, 145, 145).withOpacity(0.2),
                blurRadius: 10,
                offset: Offset(0, 4))
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
                Text(entity.title ?? 'unknowen',
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
