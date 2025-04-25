import 'package:hive/hive.dart';
import 'package:BrainScopeAI/features/home/domain/entity/result_entity.dart';
import 'package:BrainScopeAI/features/home/domain/repo/home_repo.dart';

class SaveResultUc {
  final HomeRepo homeRepo;
  SaveResultUc({required this.homeRepo});
  Future<void> execute(ResultEntity result, Box<ResultEntity> box) async {
    await homeRepo.saveResult(result, box);
  }
}
