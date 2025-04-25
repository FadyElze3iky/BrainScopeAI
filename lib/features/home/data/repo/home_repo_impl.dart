import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:BrainScopeAI/features/home/domain/entity/result_entity.dart';
import 'package:BrainScopeAI/features/home/domain/repo/home_repo.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tflite_flutter/src/interpreter.dart';
import 'package:image/image.dart' as img;

class HomeRepoImpl implements HomeRepo {
  late Future<void> initializeControllerFuture;
  final RxString status = 'Ready to capture'.obs;
  final RxString croppedImagePath = RxString('');
  final RxBool isCapturing =
      false.obs; // Track capture state to prevent multiple requests
  final ImagePicker _picker = ImagePicker();
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  @override
  Future<Interpreter> loadModel(String modelPath) async {
    try {
      Interpreter interpreter = await Interpreter.fromAsset(modelPath);
      return interpreter;
    } catch (e) {
      throw ('Error loading model: $e');
    }
  }

  Future<bool> _requestGalleryPermission() async {
    PermissionStatus permissionStatus;

    // Determine which permission to request based on platform and Android version
    if (Platform.isIOS) {
      // iOS: Use Permission.photos
      permissionStatus = await Permission.photos.status;
      debugPrint('iOS Gallery Permission Status: $permissionStatus');
    } else if (Platform.isAndroid) {
      // Android: Check version to decide between Permission.storage and Permission.photos
      final androidInfo = await _deviceInfo.androidInfo;
      final sdkInt = androidInfo.version.sdkInt;
      debugPrint('Android SDK Version: $sdkInt');

      if (sdkInt >= 33) {
        // Android 13+: Use Permission.photos (READ_MEDIA_IMAGES)
        permissionStatus = await Permission.photos.status;
        debugPrint('Android 13+ Gallery Permission Status: $permissionStatus');
      } else {
        // Android <13: Use Permission.storage (READ_EXTERNAL_STORAGE)
        permissionStatus = await Permission.storage.status;
        debugPrint(
            'Android <13 Gallery Permission Status (Storage): $permissionStatus');
      }
    } else {
      // Unsupported platform
      debugPrint('Unsupported platform for gallery permission');

      return false;
    }

    // If permission is already granted, return true
    if (permissionStatus.isGranted) {
      debugPrint('Gallery permission already granted');
      return true;
    }

    // Request the appropriate permission
    if (Platform.isIOS) {
      permissionStatus = await Permission.photos.request();
      debugPrint('iOS Gallery Permission Request Result: $permissionStatus');
    } else if (Platform.isAndroid) {
      final androidInfo = await _deviceInfo.androidInfo;
      final sdkInt = androidInfo.version.sdkInt;
      if (sdkInt >= 33) {
        permissionStatus = await Permission.photos.request();
        debugPrint(
            'Android 13+ Gallery Permission Request Result: $permissionStatus');
      } else {
        permissionStatus = await Permission.storage.request();
        debugPrint(
            'Android <13 Gallery Permission Request Result (Storage): $permissionStatus');
      }
    }

    // Handle the permission result
    if (permissionStatus.isGranted) {
      debugPrint('Gallery permission granted');
      return true;
    } else if (permissionStatus.isPermanentlyDenied) {
      debugPrint('Gallery permission permanently denied');
      await openAppSettings();
      return false;
    } else {
      debugPrint('Gallery permission denied');
      return false;
    }
  }

  @override
  Future<File> pickImage(ImageSource source) async {
    // Request gallery permission
    final hasPermission = await _requestGalleryPermission();
    if (!hasPermission) {
      debugPrint('Gallery pick aborted due to lack of permission');
      throw (Exception('Gallery pick aborted due to lack of permission'));
    }

    try {
      // Set capturing state

      status.value = 'Picking image from gallery...';

      // Pick image from gallery
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile == null) {
        debugPrint('No image selected from gallery');
        status.value = 'No image selected';
        throw (Exception('No image selected'));
      }

      debugPrint('Image picked from gallery: ${pickedFile.path}');
      status.value = 'Cropping image...';

      // Crop the picked image
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: const CropAspectRatio(
            ratioX: 1, ratioY: 1), // Enforce square cropping

        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Document',
            toolbarColor: Colors.blue,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: true,
          ),
          IOSUiSettings(
            title: 'Crop Document',
            aspectRatioLockEnabled: true,
          ),
        ],
      );

      if (croppedFile != null) {
        debugPrint('Image cropped: ${croppedFile.path}');
        croppedImagePath.value = croppedFile.path;
        status.value = 'Image cropped successfully';
        return File(croppedImagePath.value);
      } else {
        debugPrint('Cropping cancelled by user');
        status.value = 'Cropping cancelled';
        throw (Exception('Cropping cancelled'));
      }
    } catch (e) {
      debugPrint('Error during gallery pick or cropping: $e');
      status.value = '$e';
      if (e.toString().contains('storage')) {
        status.value = 'Error: Storage issue. Please check device storage.';
      }
      throw (Exception(e));
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
