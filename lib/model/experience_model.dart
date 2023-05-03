import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ExperienceModel {
  String position;
  String description;
  // Object<CompanyType> company;
  List<String> skills;

  ExperienceModel({
    required this.position,
    required this.description,
    // required this.company,
    required this.skills,
  });
}

class CompanyType {
  String name;
  String contract;
  // String site;
  // String logo;

  CompanyType({
    required this.name,
    required this.contract,
  });
}
