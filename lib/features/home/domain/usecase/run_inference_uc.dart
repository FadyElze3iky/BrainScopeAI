import 'package:image_picker/image_picker.dart';
import 'package:BrainScopeAI/features/home/domain/repo/home_repo.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class RunInferenceUc {
  final HomeRepo homeRepo;
  RunInferenceUc({required this.homeRepo});
  Future<String> execute(XFile image, Interpreter model) async {
    return await homeRepo.runInference(image, model);
  }
}
