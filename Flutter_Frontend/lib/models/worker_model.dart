import 'dart:convert';

import 'package:collection/collection.dart';

class Worker {
  String username;
  String password;
  String fname;
  String lname;
  String email;
  String image;
  String contact;
  String category;
  Worker({
    required this.username,
    required this.password,
    required this.fname,
    required this.lname,
    required this.email,
    required this.image,
    required this.contact,
    required this.category,
  });
  

  Worker copyWith({
    String? username,
    String? password,
    String? fname,
    String? lname,
    String? email,
    String? image,
    String? contact,
    String? category,
  }) {
    return Worker(
      username: username ?? this.username,
      password: password ?? this.password,
      fname: fname ?? this.fname,
      lname: lname ?? this.lname,
      email: email ?? this.email,
      image: image ?? this.image,
      contact: contact ?? this.contact,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
      'fname': fname,
      'lname': lname,
      'email': email,
      'image': image,
      'contact': contact,
      'category': category,
    };
  }

  factory Worker.fromMap(Map<String, dynamic> map) {
    return Worker(
      username: map['username'] ?? '',
      password: map['password'] ?? '',
      fname: map['fname'] ?? '',
      lname: map['lname'] ?? '',
      email: map['email'] ?? '',
      image: map['image'] ?? '',
      contact: map['contact'] ?? '',
      category: map['category'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Worker.fromJson(String source) => Worker.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Worker(username: $username, password: $password, fname: $fname, lname: $lname, email: $email, image: $image, contact: $contact, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Worker &&
      other.username == username &&
      other.password == password &&
      other.fname == fname &&
      other.lname == lname &&
      other.email == email &&
      other.image == image &&
      other.contact == contact &&
      other.category == category;
  }

  @override
  int get hashCode {
    return username.hashCode ^
      password.hashCode ^
      fname.hashCode ^
      lname.hashCode ^
      email.hashCode ^
      image.hashCode ^
      contact.hashCode ^
      category.hashCode;
  }
}
