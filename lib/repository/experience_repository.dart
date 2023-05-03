import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/experience_model.dart';

class ExperienceRepository extends ChangeNotifier {
  List<ExperienceModel> experiences = [];

  ExperienceRepository() {
    initRepository();
  }

  initRepository() async {
    final response = await http
        .get(Uri.parse('https://randomuser.me/api/?nat=br&&results=20'));
    final json = jsonDecode(response.body) as Map;

    for (var experience in json['results']) {
      experiences.add(ExperienceModel(
          position:
              "${experience['name']['first']} ${experience['name']['last']}",
          description: "${experience['picture']['thumbnail']}",
          skills: ['vazio', 'sem skills']));
    }

    notifyListeners();
  }
}
