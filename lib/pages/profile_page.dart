import 'package:flutter/material.dart';
import 'package:personal_app/services/auth_service.dart';
import 'package:personal_app/widgets/experience_card.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu Perfil"),
        actions: [
          IconButton(
              onPressed: () {
                auth.signOut();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          const ExperienceCard(),
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
                'onsectetur adipiscing, sed do eiusmod tempor incididuntloremimpsum dolor sit amet, consectetur adipiscing, sed do eiusmod tempor incididuntloremimpsum dolor sit amet, consectetur adipiscing, sed do eiusmod tempor incididuntloremimpsum dolor sit amet, consectetur adipiscing, sed do eiusmod tempor incididuntloremimpsum dolor sit amet, consectetur adipiscing, sed do eiusmod tempor incididuntloremimpsum dolor sit amet, consectetur adipiscing, sed do eiusmod tempor incididuntloremimpsum dolor sit amet, consectetur adipiscing, sed do eiusmod tempor incididuntloremimpsum dolor sit amet, consectetur adipiscing, sed do eiusmod tempor incididuntloremimpsum dolor sit amet, consectetur adipiscing, sed do eiusmod tempor incididunt'),
          )),
          ElevatedButton(onPressed: () {}, child: const Text('Editar'))
        ],
      ),
    );
  }
}
