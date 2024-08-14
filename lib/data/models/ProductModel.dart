/// success : true
/// data : [{"id":1,"catalog_id":2,"listers_id":1,"name":"Test Product Name","image":"1723473288_random.png","price":"123456","description":"This is the random description for the product name Test Product Name of Test1 Catalog.","created_at":"2024-08-12T14:34:48.000000Z","updated_at":"2024-08-12T14:34:48.000000Z","image_url":"https://eorder-be.palika.site/storage/products/1723473288_random.png"}]
/// message : "success"

class ProductModel {
  ProductModel({
    bool? success,
    List<Data>? data,
    String? message,
  }) {
    _success = success;
    _data = data;
    _message = message;
  }

  ProductModel.fromJson(dynamic json) {
    _success = json['success'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _message = json['message'];
  }
  bool? _success;
  List<Data>? _data;
  String? _message;
  ProductModel copyWith({
    bool? success,
    List<Data>? data,
    String? message,
  }) =>
      ProductModel(
        success: success ?? _success,
        data: data ?? _data,
        message: message ?? _message,
      );
  bool? get success => _success;
  List<Data>? get data => _data;
  String? get message => _message;
}

/// id : 1
/// catalog_id : 2
/// listers_id : 1
/// name : "Test Product Name"
/// image : "1723473288_random.png"
/// price : "123456"
/// description : "This is the random description for the product name Test Product Name of Test1 Catalog."
/// created_at : "2024-08-12T14:34:48.000000Z"
/// updated_at : "2024-08-12T14:34:48.000000Z"
/// image_url : "https://eorder-be.palika.site/storage/products/1723473288_random.png"

class Data {
  Data({
    num? id,
    num? catalogId,
    num? listersId,
    String? name,
    String? image,
    String? price,
    String? description,
    String? createdAt,
    String? updatedAt,
    String? imageUrl,
  }) {
    _id = id;
    _catalogId = catalogId;
    _listersId = listersId;
    _name = name;
    _image = image;
    _price = price;
    _description = description;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _imageUrl = imageUrl;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _catalogId = json['catalog_id'];
    _listersId = json['listers_id'];
    _name = json['name'];
    _image = json['image'];
    _price = json['price'];
    _description = json['description'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _imageUrl = json['image_url'];
  }
  num? _id;
  num? _catalogId;
  num? _listersId;
  String? _name;
  String? _image;
  String? _price;
  String? _description;
  String? _createdAt;
  String? _updatedAt;
  String? _imageUrl;
  Data copyWith({
    num? id,
    num? catalogId,
    num? listersId,
    String? name,
    String? image,
    String? price,
    String? description,
    String? createdAt,
    String? updatedAt,
    String? imageUrl,
  }) =>
      Data(
        id: id ?? _id,
        catalogId: catalogId ?? _catalogId,
        listersId: listersId ?? _listersId,
        name: name ?? _name,
        image: image ?? _image,
        price: price ?? _price,
        description: description ?? _description,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        imageUrl: imageUrl ?? _imageUrl,
      );
  num? get id => _id;
  num? get catalogId => _catalogId;
  num? get listersId => _listersId;
  String? get name => _name;
  String? get image => _image;
  String? get price => _price;
  String? get description => _description;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get imageUrl => _imageUrl;
}
