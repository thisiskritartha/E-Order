/// success : true
/// data : {"customer":{"id":1,"name":"Customer","email":"customer@gmail.com","phone":null,"address":null,"city":null,"state":null,"country":null,"created_at":"2024-07-25T06:49:47.000000Z","updated_at":"2024-07-25T06:49:47.000000Z"},"Customer_Token":"5|GRtVMrT5a1JJZdY9SoiLgDUf9EkVp9JO5bGzO5QMdb516e2b"}
/// message : "customer Logged In"

class UserModel {
  UserModel({
    bool? success,
    Data? data,
    String? message,
  }) {
    _success = success;
    _data = data;
    _message = message;
  }

  UserModel.fromJson(dynamic json) {
    _success = json['success'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }
  bool? _success;
  Data? _data;
  String? _message;
  UserModel copyWith({
    bool? success,
    Data? data,
    String? message,
  }) =>
      UserModel(
        success: success ?? _success,
        data: data ?? _data,
        message: message ?? _message,
      );
  bool? get success => _success;
  Data? get data => _data;
  String? get message => _message;
}

/// customer : {"id":1,"name":"Customer","email":"customer@gmail.com","phone":null,"address":null,"city":null,"state":null,"country":null,"created_at":"2024-07-25T06:49:47.000000Z","updated_at":"2024-07-25T06:49:47.000000Z"}
/// Customer_Token : "5|GRtVMrT5a1JJZdY9SoiLgDUf9EkVp9JO5bGzO5QMdb516e2b"

class Data {
  Data({
    Customer? customer,
    String? customerToken,
  }) {
    _customer = customer;
    _customerToken = customerToken;
  }

  Data.fromJson(dynamic json) {
    _customer = json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    _customerToken = json['Customer_Token'];
  }
  Customer? _customer;
  String? _customerToken;
  Data copyWith({
    Customer? customer,
    String? customerToken,
  }) =>
      Data(
        customer: customer ?? _customer,
        customerToken: customerToken ?? _customerToken,
      );
  Customer? get customer => _customer;
  String? get customerToken => _customerToken;
}

/// id : 1
/// name : "Customer"
/// email : "customer@gmail.com"
/// phone : null
/// address : null
/// city : null
/// state : null
/// country : null
/// created_at : "2024-07-25T06:49:47.000000Z"
/// updated_at : "2024-07-25T06:49:47.000000Z"

class Customer {
  Customer({
    num? id,
    String? name,
    String? email,
    dynamic phone,
    dynamic address,
    dynamic city,
    dynamic state,
    dynamic country,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _name = name;
    _email = email;
    _phone = phone;
    _address = address;
    _city = city;
    _state = state;
    _country = country;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Customer.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _address = json['address'];
    _city = json['city'];
    _state = json['state'];
    _country = json['country'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  String? _email;
  dynamic _phone;
  dynamic _address;
  dynamic _city;
  dynamic _state;
  dynamic _country;
  String? _createdAt;
  String? _updatedAt;
  Customer copyWith({
    num? id,
    String? name,
    String? email,
    dynamic phone,
    dynamic address,
    dynamic city,
    dynamic state,
    dynamic country,
    String? createdAt,
    String? updatedAt,
  }) =>
      Customer(
        id: id ?? _id,
        name: name ?? _name,
        email: email ?? _email,
        phone: phone ?? _phone,
        address: address ?? _address,
        city: city ?? _city,
        state: state ?? _state,
        country: country ?? _country,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  num? get id => _id;
  String? get name => _name;
  String? get email => _email;
  dynamic get phone => _phone;
  dynamic get address => _address;
  dynamic get city => _city;
  dynamic get state => _state;
  dynamic get country => _country;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
}
