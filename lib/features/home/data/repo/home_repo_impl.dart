import 'dart:io';

import 'package:cross_file/src/types/interface.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/src/types/image_source.dart';
import 'package:BrainScopeAI/features/home/domain/entity/result_entity.dart';
import 'package:BrainScopeAI/features/home/domain/repo/home_repo.dart';
import 'package:tflite_flutter/src/interpreter.dart';
import 'package:image/image.dart' as img;

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Interpreter> loadModel(String modelPath) async {
    try {
      Interpreter interpreter = await Interpreter.fromAsset(modelPath);
      return interpreter;
    } catch (e) {
      throw ('Error loading model: $e');
    }
  }

  @override
  Future<File> pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();

    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      throw ('Image not selected');
    }
  }

  @override
  Future<String> runInference(XFile image, Interpreter model) async {
    // Load and preprocess image
    final inputImage = img.decodeImage(await image.readAsBytes())!;
    final resizedImage = img.copyResize(inputImage, width: 244, height: 244);

    // Prepare input tensor (1, 244, 244, 3)
    final input = List.generate(
        1,
        (_) => List.generate(
            244, (_) => List.generate(244, (_) => List.filled(3, 0.0))));
    for (var y = 0; y < 244; y++) {
      for (var x = 0; x < 244; x++) {
        final pixel = resizedImage.getPixel(x, y);
        input[0][y][x][0] =
            (pixel.r) / 255.0; // Red channel, normalized to [0, 1]
        input[0][y][x][1] = (pixel.g) / 255.0; // Green channel
        input[0][y][x][2] = (pixel.b) / 255.0; // Blue channel
      }
    }

    // Prepare output tensor (1, 4) for 4 classes
    final output = List.filled(1, List.filled(4, 0.0));

    // Run inference
    try {
      model.run(input, output);

      // Find the class with the highest probability
      final maxScore = output[0].reduce((a, b) => a > b ? a : b);
      final maxIndex = output[0].indexOf(maxScore);

      // ['Mild Demented', 'Moderate Demented', 'Non Demented', 'Very MildDemented']

      return 'Class: $maxIndex, Confidence: ${(maxScore * 100).toStringAsFixed(2)}%';
    } catch (e) {
      return 'Error running inference: $e';
    }
  }

  @override
  Future<void> saveResult(ResultEntity result, Box<ResultEntity> box) async {
    await box.add(result);
  }
}
