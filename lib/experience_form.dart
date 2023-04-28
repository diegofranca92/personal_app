import 'package:flutter/material.dart';

class ExperienceForm extends StatefulWidget {
  const ExperienceForm({super.key});

  @override
  State<ExperienceForm> createState() => _ExperienceFormState();
}

class _ExperienceFormState extends State<ExperienceForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Experiência'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.8),
        child: Center(
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Cargo'),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obrigatório';
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Empresa'),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obrigatório';
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
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
                  ElevatedButton(
                      onPressed: () {
                        formKey.currentState?.validate();
                      },
                      child: Text('Salvar'))
                ],
              )),
        ),
      ),
    );
  }
}
