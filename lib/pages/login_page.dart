import 'package:flutter/material.dart';
import 'package:personal_app/services/auth_service.dart';
import 'package:personal_app/widgets/block_button.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icon_android.png',
                  width: 150,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(fontSize: 18),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Email'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: TextFormField(
                    controller: password,
                    style: const TextStyle(fontSize: 18),
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Password'),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: BlockButton(
                        icon: Icons.login,
                        label: 'Login',
                        onPressed: () {
                          auth.signIn(email.text, password.text);
                        }))
              ],
            )),
      ),
    );
  }
}
