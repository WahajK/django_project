import 'dart:convert';

import 'package:flutter/cupertino.dart';

class User {
  int user_id;
  String username;
  String password;
  String fname;
  String lname;
  String email;
  String address;
  String image;
  String contact;
  User({
    required this.user_id,
    required this.username,
    required this.password,
    required this.fname,
    required this.lname,
    required this.email,
    required this.address,
    required this.image,
    required this.contact,
  });


  User copyWith({
    int? user_id,
    String? username,
    String? password,
    String? fname,
    String? lname,
    String? email,
    String? address,
    String? image,
    String? contact,
  }) {
    return User(
      user_id: user_id ?? this.user_id,
      username: username ?? this.username,
      password: password ?? this.password,
      fname: fname ?? this.fname,
      lname: lname ?? this.lname,
      email: email ?? this.email,
      address: address ?? this.address,
      image: image ?? this.image,
      contact: contact ?? this.contact,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': user_id,
      'username': username,
      'password': password,
      'fname': fname,
      'lname': lname,
      'email': email,
      'address': address,
      'image': image,
      'contact': contact,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      user_id: map['user_id']?.toInt() ?? 0,
      username: map['username'] ?? '',
      password: map['password'] ?? '',
      fname: map['fname'] ?? '',
      lname: map['lname'] ?? '',
      email: map['email'] ?? '',
      address: map['address'] ?? '',
      image: map['image'] ?? '',
      contact: map['contact'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(user_id: $user_id, username: $username, password: $password, fname: $fname, lname: $lname, email: $email, address: $address, image: $image, contact: $contact)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is User &&
      other.user_id == user_id &&
      other.username == username &&
      other.password == password &&
      other.fname == fname &&
      other.lname == lname &&
      other.email == email &&
      other.address == address &&
      other.image == image &&
      other.contact == contact;
  }

  @override
  int get hashCode {
    return user_id.hashCode ^
      username.hashCode ^
      password.hashCode ^
      fname.hashCode ^
      lname.hashCode ^
      email.hashCode ^
      address.hashCode ^
      image.hashCode ^
      contact.hashCode;
  }
}

// class Login {
//   int id;
//   String username;
//   String password;
  
//   Login({
//     required this.id,
//     required this.username,
//     required this.password,
//   });

//   Login copyWith({
//     int? id,
//     String? username,
//     String? password,
//   }) {
//     return Login(
//       id: id ?? this.id,
//       username: username ?? this.username,
//       password: password ?? this.password,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'username': username,
//       'password': password,
//     };
//   }

//   factory Login.fromMap(Map<String, dynamic> map) {
//     return Login(
//       id: map['id'],
//       username: map['username'],
//       password: map['password'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Login.fromJson(String source) => Login.fromMap(json.decode(source));

//   @override
//   String toString() =>
//       'Login(id: $id, username: $username, password: $password)';

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is Login &&
//         other.id == id &&
//         other.username == username &&
//         other.password == password;
//   }

//   @override
//   int get hashCode => id.hashCode ^ username.hashCode ^ password.hashCode;
// }
