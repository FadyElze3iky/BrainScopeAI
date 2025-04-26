import 'dart:io';

import 'package:BrainScopeAI/features/home/data/repo/home_repo_impl.dart';
import 'package:BrainScopeAI/features/home/domain/entity/result_entity.dart';
import 'package:BrainScopeAI/features/home/domain/repo/home_repo.dart';
import 'package:BrainScopeAI/features/home/domain/usecase/load_model_uc.dart';
import 'package:BrainScopeAI/features/home/domain/usecase/pick_img_uc.dart';
import 'package:BrainScopeAI/features/home/domain/usecase/run_inference_uc.dart';
import 'package:BrainScopeAI/features/home/domain/usecase/save_result_uc.dart';
import 'package:BrainScopeAI/features/home/presentation/ui/new_scan/widgets/start_modle_body.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:intl/intl.dart';

class ScannerController extends GetxController {
  late HomeRepo homeRepo;
  late PickImgUc pickImgUc;
  late RunInferenceUc runInferenceUc;
  late LoadModelUc loadModelUc;
  late SaveResultUc saveResultUc;
  var image = File('').obs;
  var toggleAnimation = false.obs;
  var resultClass = ''.obs;
  var resultConfidance = ''.obs;
  var buttonVisibaliy = true.obs;
  var showResult = false.obs;
  late Box<ResultEntity> box;
  var entityList = [].obs;
  var dataExist = false.obs;
  @override
  void onInit() async {
    super.onInit();
    box = await Hive.openBox<ResultEntity>('main');
    homeRepo = HomeRepoImpl();
    pickImgUc = PickImgUc(homeRepo: homeRepo);
    runInferenceUc = RunInferenceUc(homeRepo: homeRepo);
    loadModelUc = LoadModelUc(homeRepo: homeRepo);
    saveResultUc = SaveResultUc(homeRepo: homeRepo);
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

  Future<Interpreter> _loadModel() async {
    return await loadModelUc.execute('assets/model.tflite');
  }

  Future<void> runModel() async {
    final model = await _loadModel();
    try {
      final result =
          await runInferenceUc.execute(XFile(image.value.path), model);

      resultClass.value = result['class']!;
      resultConfidance.value = result['confidence']!;
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: e.toString(),
      ));
    }
  }

  void toggleButton() {
    toggleAnimation.value = !toggleAnimation.value;
  }

  Future<ResultEntity> _createRsultEntity() async {
    String result =
        '${ResultToText.fromIndex(resultClass.value).toString()} with ${resultConfidance.value} confidence';
    DateTime now = DateTime.now();

    // Define the date format
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');

    // Format the date and time
    String formattedDate = formatter.format(now);

    ResultEntity resultEntity = ResultEntity(
        img: await XFile(image.value.path).readAsBytes(),
        result: result,
        createdAt: formattedDate);
    return resultEntity;
  }

  void saveRsult() async {
    try {
      ResultEntity result = await _createRsultEntity();
      await saveResultUc.execute(result, box);
      Get.back();
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: e.toString(),
      ));
    }
  }

  void getAllEntities() async {
    await Future.delayed(Duration(seconds: 2));
    if (box.values.isNotEmpty) {
      dataExist.value = true;
    }
    entityList.value = box.values.toList();
  }
}
