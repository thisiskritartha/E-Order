// * success : true
/// data : [{"id":1,"name":"Table","image":"1721907603_table.jpeg",
/// "image_url":"https://eorder-be.palika.site/storage/catalogs/1721907603_table.jpeg"},
/// {"id":2,"name":"Test1","image":"1723463066_random.png","image_url":"https://eorder-be.palika.site/storage/catalogs/1723463066_random.png"}]
/// message : "Catalogs Retrieved"

import 'package:hive/hive.dart';
part 'catalog_model.g.dart';

@HiveType(typeId: 0)
class CatalogModel {
  CatalogModel({
    bool? success,
    List<Data>? data,
    String? message,
  }) {
    _success = success;
    _data = data;
    _message = message;
  }

  CatalogModel.fromJson(dynamic json) {
    _success = json['success'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _message = json['message'];
  }
  @HiveField(0)
  bool? _success;

  @HiveField(1)
  List<Data>? _data;

  @HiveField(2)
  String? _message;

  CatalogModel copyWith({
    bool? success,
    List<Data>? data,
    String? message,
  }) =>
      CatalogModel(
        success: success ?? _success,
        data: data ?? _data,
        message: message ?? _message,
      );
  bool? get success => _success;
  List<Data>? get data => _data;
  String? get message => _message;
}

/// id : 1
/// name : "Table"
/// image : "1721907603_table.jpeg"
/// image_url : "https://eorder-be.palika.site/storage/catalogs/1721907603_table.jpeg"

@HiveType(typeId: 1)
class Data {
  Data({
    num? id,
    String? name,
    String? image,
    String? imageUrl,
  }) {
    _id = id;
    _name = name;
    _image = image;
    _imageUrl = imageUrl;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _imageUrl = json['image_url'];
  }
  @HiveField(0)
  num? _id;

  @HiveField(1)
  String? _name;

  @HiveField(2)
  String? _image;

  @HiveField(3)
  String? _imageUrl;

  Data copyWith({
    num? id,
    String? name,
    String? image,
    String? imageUrl,
  }) =>
      Data(
        id: id ?? _id,
        name: name ?? _name,
        image: image ?? _image,
        imageUrl: imageUrl ?? _imageUrl,
      );
  num? get id => _id;
  String? get name => _name;
  String? get image => _image;
  String? get imageUrl => _imageUrl;
}
