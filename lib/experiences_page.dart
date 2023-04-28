import 'package:flutter/material.dart';
import 'package:personal_app/experience_form.dart';

class ExperiencesPage extends StatefulWidget {
  const ExperiencesPage({super.key});

  @override
  State<ExperiencesPage> createState() => _ExperiencesPageState();
}

class _ExperiencesPageState extends State<ExperiencesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas Experiências"),
      ),
      // body: ExperienceCard(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ExperienceForm()));
        },
        icon: const Icon(Icons.add),
        label: Text('Nova experiência'),
      ),
    );
  }
}
