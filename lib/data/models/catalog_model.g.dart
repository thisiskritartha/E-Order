// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CatalogModelAdapter extends TypeAdapter<CatalogModel> {
  @override
  final int typeId = 0;

  @override
  CatalogModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatalogModel()
      .._success = fields[0] as bool?
      .._data = (fields[1] as List?)?.cast<Data>()
      .._message = fields[2] as String?;
  }

  @override
  void write(BinaryWriter writer, CatalogModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj._success)
      ..writeByte(1)
      ..write(obj._data)
      ..writeByte(2)
      ..write(obj._message);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatalogModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DataAdapter extends TypeAdapter<Data> {
  @override
  final int typeId = 1;

  @override
  Data read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Data()
      .._id = fields[0] as num?
      .._name = fields[1] as String?
      .._image = fields[2] as String?
      .._imageUrl = fields[3] as String?;
  }

  @override
  void write(BinaryWriter writer, Data obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj._id)
      ..writeByte(1)
      ..write(obj._name)
      ..writeByte(2)
      ..write(obj._image)
      ..writeByte(3)
      ..write(obj._imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
