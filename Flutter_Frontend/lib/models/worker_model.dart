import 'dart:convert';
import 'dart:ffi';

import 'package:collection/collection.dart';

class Worker {
  String username;
  String password;
  String fname;
  String description;
  String email;
  String image;
  String contact;
  String category;
  double rating;
  Worker({
    required this.username,
    required this.password,
    required this.fname,
    required this.description,
    required this.email,
    required this.image,
    required this.contact,
    required this.category,
    required this.rating,
  });

  Worker copyWith({
    String? username,
    String? password,
    String? fname,
    String? description,
    String? email,
    String? image,
    String? contact,
    String? category,
    double? rating,
  }) {
    return Worker(
      username: username ?? this.username,
      password: password ?? this.password,
      fname: fname ?? this.fname,
      description: description ?? this.description,
      email: email ?? this.email,
      image: image ?? this.image,
      contact: contact ?? this.contact,
      category: category ?? this.category,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
      'fname': fname,
      'description': description,
      'email': email,
      'image': image,
      'contact': contact,
      'category': category,
      'rating': rating,
    };
  }

  factory Worker.fromMap(Map<String, dynamic> map) {
    return Worker(
      username: map['username'] ?? '',
      password: map['password'] ?? '',
      fname: map['fname'] ?? '',
      description: map['description'] ?? '',
      email: map['email'] ?? '',
      image: map['image'] ?? '',
      contact: map['contact'] ?? '',
      category: map['category'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Worker.fromJson(String source) => Worker.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Worker(username: $username, password: $password, fname: $fname, description: $description, email: $email, image: $image, contact: $contact, category: $category, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Worker &&
      other.username == username &&
      other.password == password &&
      other.fname == fname &&
      other.description == description &&
      other.email == email &&
      other.image == image &&
      other.contact == contact &&
      other.category == category &&
      other.rating == rating;
  }

  @override
  int get hashCode {
    return username.hashCode ^
      password.hashCode ^
      fname.hashCode ^
      description.hashCode ^
      email.hashCode ^
      image.hashCode ^
      contact.hashCode ^
      category.hashCode ^
      rating.hashCode;
  }
}
