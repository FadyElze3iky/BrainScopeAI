import 'package:BrainScopeAI/features/home/domain/repo/home_repo.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class LoadModelUc {
  final HomeRepo homeRepo;
  LoadModelUc({required this.homeRepo});
  Future<Interpreter> execute(String modelPath) async {
    return await homeRepo.loadModel(modelPath);
  }
}
