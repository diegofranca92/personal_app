import 'package:flutter/material.dart';

class ExperienceCard extends StatefulWidget {
  const ExperienceCard({super.key});

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  final formKey = GlobalKey<FormState>();
  double projectTime = 2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: DecoratedBox(
        decoration: BoxDecoration(color: Colors.amber.shade50),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                              'https://media.licdn.com/dms/image/C4D03AQGVg366iwWCqA/profile-displayphoto-shrink_800_800/0/1607252011195?e=1699488000&v=beta&t=TZQ0oP6FBAbUHR76uuQGvdxIWM1jPKwwTaYm4OfHzN4'),
                        ),
                      ),
                      const SizedBox(
                          child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                            style: TextStyle(fontFamily: 'ubuntu'),
                            'Nome da Empresa'),
                      )),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 24),
                    child: Text('Cargo'),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: Text('Descrição'),
              ),
              ElevatedButton(
                  onPressed: () {
                    formKey.currentState?.validate();
                  },
                  child: const Text('Ver mais'))
            ],
          ),
        ),
      ),
    );
  }
}
