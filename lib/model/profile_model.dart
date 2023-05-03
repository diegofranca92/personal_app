// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// import 'experience_model.dart';

class ProfileModel {
  String name;
  String position;
  // Object<CompanyType> company;
  String bio;

  ProfileModel({
    required this.name,
    required this.position,
    required this.bio,
  });
  // Object<String> contacts;
  // List<String> skills;
  // String location;
  // String formation;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'position': position,
      'bio': bio,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      name: map['name'] as String,
      position: map['position'] as String,
      bio: map['bio'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) =>
      ProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
