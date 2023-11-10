import 'package:flutter/material.dart';

class ModalAddSkills extends StatefulWidget {
  const ModalAddSkills({super.key});

  @override
  State<ModalAddSkills> createState() => _ModalAddSkillsState();
}

class _ModalAddSkillsState extends State<ModalAddSkills> {
  final formKey = GlobalKey<FormState>();
  double skillTime = 2;

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
                    'Adicionar Skills',
                    style: TextStyle(fontSize: 20),
                    // TODO ***** */ Aqui pode só listar as Skills que eu ja tenho no geral e eu só selecionar elas./*****
                    ///*****A cada tempo que eu adicionar em cadas experiencia ela vai se somando pra adicionar no Perfil principal/*****
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24, top: 24),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Nome da Skill',
                          border: OutlineInputBorder()),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigatório';
                        }
                      },
                    ),
                  ),
                  const Text('Tempo de experiência'),
                  // Caso for fazer a versão mais avançada - https://www.youtube.com/watch?v=vuw818gAlF8
                  Slider(
                      value: skillTime,
                      min: 1,
                      max: 10,
                      divisions: 10,
                      label: skillTime.round().toString(),
                      onChanged: (value) => setState(() => skillTime = value)),
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
