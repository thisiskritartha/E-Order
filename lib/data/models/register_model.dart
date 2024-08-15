import 'package:e_order/data/models/user_model.dart';

/// success : true
/// data : {"status":"success","Customer_Token":{"name":"test name","email":"test@gmail.com","phone":null,"address":null,"city":null,"state":null,"country":null,"updated_at":"2024-08-14T06:05:38.000000Z","created_at":"2024-08-14T06:05:38.000000Z","id":3},"token":"41|EjFGgKgepWteF2TnwkZWakD4ZL42CTixbcE90vvSde4262a8","message":"Customer Registered"}
/// message : 200

class RegisterModel {
  RegisterModel({
    bool? success,
    Data? data,
    num? message,
  }) {
    _success = success;
    _data = data;
    _message = message;
  }

  RegisterModel.fromJson(dynamic json) {
    _success = json['success'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }
  bool? _success;
  Data? _data;
  num? _message;
  RegisterModel copyWith({
    bool? success,
    Data? data,
    num? message,
  }) =>
      RegisterModel(
        success: success ?? _success,
        data: data ?? _data,
        message: message ?? _message,
      );
  bool? get success => _success;
  Data? get data => _data;
  num? get message => _message;
}

/// status : "success"
/// Customer_Token : {"name":"test name","email":"test@gmail.com","phone":null,"address":null,"city":null,"state":null,"country":null,"updated_at":"2024-08-14T06:05:38.000000Z","created_at":"2024-08-14T06:05:38.000000Z","id":3}
/// token : "41|EjFGgKgepWteF2TnwkZWakD4ZL42CTixbcE90vvSde4262a8"
/// message : "Customer Registered"

class Data {
  Data({
    String? status,
    Customer? customerToken,
    String? token,
    String? message,
  }) {
    _status = status;
    _customerToken = customerToken;
    _token = token;
    _message = message;
  }

  Data.fromJson(dynamic json) {
    _status = json['status'];
    _customerToken = json['Customer_Token'] != null ? Customer.fromJson(json['Customer_Token']) : null;
    _token = json['token'];
    _message = json['message'];
  }
  String? _status;
  Customer? _customerToken;
  String? _token;
  String? _message;
  Data copyWith({
    String? status,
    Customer? customerToken,
    String? token,
    String? message,
  }) =>
      Data(
        status: status ?? _status,
        customerToken: customerToken ?? _customerToken,
        token: token ?? _token,
        message: message ?? _message,
      );
  String? get status => _status;
  Customer? get customerToken => _customerToken;
  String? get token => _token;
  String? get message => _message;
}

/// name : "test name"
/// email : "test@gmail.com"
/// phone : null
/// address : null
/// city : null
/// state : null
/// country : null
/// updated_at : "2024-08-14T06:05:38.000000Z"
/// created_at : "2024-08-14T06:05:38.000000Z"
/// id : 3

// class CustomerToken {
//   CustomerToken({
//     String? name,
//     String? email,
//     dynamic phone,
//     dynamic address,
//     dynamic city,
//     dynamic state,
//     dynamic country,
//     String? updatedAt,
//     String? createdAt,
//     num? id,
//   }) {
//     _name = name;
//     _email = email;
//     _phone = phone;
//     _address = address;
//     _city = city;
//     _state = state;
//     _country = country;
//     _updatedAt = updatedAt;
//     _createdAt = createdAt;
//     _id = id;
//   }
//
//   CustomerToken.fromJson(dynamic json) {
//     _name = json['name'];
//     _email = json['email'];
//     _phone = json['phone'];
//     _address = json['address'];
//     _city = json['city'];
//     _state = json['state'];
//     _country = json['country'];
//     _updatedAt = json['updated_at'];
//     _createdAt = json['created_at'];
//     _id = json['id'];
//   }
//   String? _name;
//   String? _email;
//   dynamic _phone;
//   dynamic _address;
//   dynamic _city;
//   dynamic _state;
//   dynamic _country;
//   String? _updatedAt;
//   String? _createdAt;
//   num? _id;
//   CustomerToken copyWith({
//     String? name,
//     String? email,
//     dynamic phone,
//     dynamic address,
//     dynamic city,
//     dynamic state,
//     dynamic country,
//     String? updatedAt,
//     String? createdAt,
//     num? id,
//   }) =>
//       CustomerToken(
//         name: name ?? _name,
//         email: email ?? _email,
//         phone: phone ?? _phone,
//         address: address ?? _address,
//         city: city ?? _city,
//         state: state ?? _state,
//         country: country ?? _country,
//         updatedAt: updatedAt ?? _updatedAt,
//         createdAt: createdAt ?? _createdAt,
//         id: id ?? _id,
//       );
//   String? get name => _name;
//   String? get email => _email;
//   dynamic get phone => _phone;
//   dynamic get address => _address;
//   dynamic get city => _city;
//   dynamic get state => _state;
//   dynamic get country => _country;
//   String? get updatedAt => _updatedAt;
//   String? get createdAt => _createdAt;
//   num? get id => _id;
// }
