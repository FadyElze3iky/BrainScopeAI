import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
part 'result_entity.g.dart';

@HiveType(typeId: 0)
class ResultEntity extends HiveObject {
  @HiveField(0)
  List<int> img;

  @HiveField(1)
  String result;

  @HiveField(2)
  String createdAt;

  ResultEntity(
      {required this.img, required this.result, required this.createdAt});
}
