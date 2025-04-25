import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';

class ScannerController extends GetxController {
  late Future<void> initializeControllerFuture;
  final RxString status = 'Ready to capture'.obs;
  final RxString croppedImagePath = RxString('');
  final RxBool isCapturing =
      false.obs; // Track capture state to prevent multiple requests
  final ImagePicker _picker = ImagePicker();
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  // Request gallery permission with logging (photos/storage)
  Future<bool> requestGalleryPermission() async {
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
      status.value = 'Error: Unsupported platform';
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
      status.value = 'Gallery permission denied';
      return false;
    }
  }

  // Pick image from gallery and crop it
  Future<void> pickAndCropImageFromGallery() async {
    // Request gallery permission
    final hasPermission = await requestGalleryPermission();
    if (!hasPermission) {
      debugPrint('Gallery pick aborted due to lack of permission');
      return;
    }

    try {
      // Set capturing state
      isCapturing.value = true;
      status.value = 'Picking image from gallery...';

      // Pick image from gallery
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile == null) {
        debugPrint('No image selected from gallery');
        status.value = 'No image selected';
        return;
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
      } else {
        debugPrint('Cropping cancelled by user');
        status.value = 'Cropping cancelled';
      }
    } catch (e) {
      debugPrint('Error during gallery pick or cropping: $e');
      status.value = 'Error: $e';
      if (e.toString().contains('storage')) {
        status.value = 'Error: Storage issue. Please check device storage.';
      }
    } finally {
      // Reset capturing state
      isCapturing.value = false;
    }
  }
}
