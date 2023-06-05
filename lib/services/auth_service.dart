// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Cria a conexão com o auth Provider(Google) e disponibiliza os dados do usuario logado

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = true;

  AuthService() {
    _authCheck();
  }

  signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        throw AuthException("Usuário não encontrado");
      } else if (e.code == "wrong-password") {
        throw AuthException("Senha incorreta");
      }
    }
  }

  signOut() async {
    await _auth.signOut();
    _getUser();
  }

  _getUser() {
    _auth.currentUser;
    notifyListeners();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }
}

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}
