import 'dart:io';

import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:BrainScopeAI/features/home/domain/entity/result_entity.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

abstract class HomeRepo {
  Future<Interpreter> loadModel(String modelPath);
  Future<File> pickImage(ImageSource source);
  Future<String> runInference(XFile image, Interpreter model);
  Future<void> saveResult(ResultEntity result, Box<ResultEntity> box);
}
