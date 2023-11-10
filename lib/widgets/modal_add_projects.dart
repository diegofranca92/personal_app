import 'package:flutter/material.dart';

class ModalAddProjects extends StatefulWidget {
  const ModalAddProjects({super.key});

  @override
  State<ModalAddProjects> createState() => _ModalAddProjectsState();
}

class _ModalAddProjectsState extends State<ModalAddProjects> {
  final formKey = GlobalKey<FormState>();
  double projectTime = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Text(
                    'Adicionar Projetos',
                    style: TextStyle(fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24, top: 24),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Nome', border: OutlineInputBorder()),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigatório';
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
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
                  const Text('Tempo de duração'),
                  // Caso for fazer a versão mais avançada - https://www.youtube.com/watch?v=vuw818gAlF8
                  Slider(
                      value: projectTime,
                      min: 1,
                      max: 10,
                      divisions: 10,
                      label: projectTime.round().toString(),
                      onChanged: (value) =>
                          setState(() => projectTime = value)),
                  ElevatedButton(
                      onPressed: () {
                        formKey.currentState?.validate();
                      },
                      child: const Text('Adicionar'))
                ],
              )),
        ),
      ),
    );
  }
}
