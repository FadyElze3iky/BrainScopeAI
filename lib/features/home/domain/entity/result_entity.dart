import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class ResultEntity extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  Image img;

  @HiveField(2)
  String result;

  @HiveField(3)
  String createdAt;

  ResultEntity(
      {required this.id,
      required this.img,
      required this.result,
      required this.createdAt});
}
