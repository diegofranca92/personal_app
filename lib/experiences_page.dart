import 'package:flutter/material.dart';
import 'package:personal_app/experience_form.dart';
import 'package:personal_app/repository/experience_repository.dart';

class ExperiencesPage extends StatefulWidget {
  const ExperiencesPage({super.key});

  @override
  State<ExperiencesPage> createState() => _ExperiencesPageState();
}

class _ExperiencesPageState extends State<ExperiencesPage> {
  late ExperienceRepository experiencesRepo;

  @override
  void initState() {
    super.initState();
    experiencesRepo = ExperienceRepository();
  }

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
      body: AnimatedBuilder(
          animation: experiencesRepo,
          builder: (context, child) {
            final experiences = experiencesRepo.experiences;

            return (experiences.isEmpty)
                ? const Center(child: CircularProgressIndicator())
                : ListView.separated(
                    itemCount: experiences.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: CircleAvatar(
                          child: ClipRRect(
                        child: Image.network(experiences[index].description),
                        borderRadius: BorderRadius.circular(50),
                      )),
                      title: Text(experiences[index].position),
                    ),
                    separatorBuilder: (_, __) => const Divider(),
                  );
          }),
    );
  }
}
