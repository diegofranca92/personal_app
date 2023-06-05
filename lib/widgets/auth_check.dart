import 'package:flutter/material.dart';
import 'package:personal_app/services/auth_service.dart';
import 'package:provider/provider.dart';

import 'package:personal_app/pages/home_page.dart';
import 'package:personal_app/pages/login_page.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  loading() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of(context);

    if (auth.isLoading) {
      return loading();
    } else if (auth.usuario == null) {
      return const LoginPage();
    } else {
      return const HomePage();
    }
  }
}
