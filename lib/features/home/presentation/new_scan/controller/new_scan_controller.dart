import 'dart:io';

import 'package:BrainScopeAI/features/home/data/repo/home_repo_impl.dart';
import 'package:BrainScopeAI/features/home/domain/repo/home_repo.dart';
import 'package:BrainScopeAI/features/home/domain/usecase/pick_img_uc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ScannerController extends GetxController {
  late HomeRepo homeRepo;
  late PickImgUc pickImgUc = PickImgUc(homeRepo: homeRepo);
  var image = File('').obs;

  @override
  void onInit() {
    super.onInit();
    homeRepo = HomeRepoImpl();
    pickImgUc = PickImgUc(homeRepo: homeRepo);
  }

  Future<void> pickImage() async {
    try {
      image.value = await pickImgUc.execute(ImageSource.gallery);
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: e.toString(),
      ));
    }
  }
}
