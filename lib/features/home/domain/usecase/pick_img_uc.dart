import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:BrainScopeAI/features/home/domain/repo/home_repo.dart';

class PickImgUc {
  final HomeRepo homeRepo;
  PickImgUc({required this.homeRepo});

  Future<File> execute(ImageSource source) async {
    return await homeRepo.pickImage(source);
  }
}
