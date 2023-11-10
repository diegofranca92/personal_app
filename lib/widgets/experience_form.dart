import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:personal_app/widgets/modal_add_projects.dart';
import 'package:personal_app/widgets/modal_add_skills.dart';
import 'package:personal_app/model/experience_model.dart';

class ExperienceForm extends StatefulWidget {
  ExperienceModel? experience;

  ExperienceForm({Key? key, this.experience}) : super(key: key);

  @override
  State<ExperienceForm> createState() => _ExperienceFormState();
}

class _ExperienceFormState extends State<ExperienceForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Experiência'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Cargo',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person_pin_outlined)),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obrigatório';
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Empresa', border: OutlineInputBorder()),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigatório';
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Descrição',
                      ),
                      maxLines: null,
                      minLines: 2,
                      maxLength: 200,
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.multiline,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigatório';
                        }
                      },
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () => showBarModalBottomSheet(
                          context: context,
                          builder: (context) => const ModalAddSkills()),
                      child: const Text('Add Skills')),
                  ElevatedButton(
                      onPressed: () => showBarModalBottomSheet(
                          context: context,
                          builder: (context) => const ModalAddProjects()),
                      child: const Text('Add Projects')),
                  ElevatedButton(
                      onPressed: () {
                        formKey.currentState?.validate();
                      },
                      child: const Text('Salvar'))
                ],
              )),
        ),
      ),
    );
  }
}
