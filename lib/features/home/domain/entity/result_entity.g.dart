// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResultEntityAdapter extends TypeAdapter<ResultEntity> {
  @override
  final int typeId = 0;

  @override
  ResultEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ResultEntity(
      img: fields[0] as List<int>,
      result: fields[1] as String,
      createdAt: fields[2] as String,
      title: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ResultEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.img)
      ..writeByte(1)
      ..write(obj.result)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
