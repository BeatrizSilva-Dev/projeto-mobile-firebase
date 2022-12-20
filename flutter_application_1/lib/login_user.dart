import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/home_page.dart';

class LoginUser extends StatefulWidget {
  const LoginUser({super.key});

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  final _emailControler = TextEditingController();
  final _senhaControler = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login do Usuário'),
        ),
        body: ListView(
          padding: EdgeInsets.all(12.0),
          children: [
            TextFormField(
              controller: _emailControler,
              decoration: InputDecoration(label: Text('E-mail')),
            ),
            TextFormField(
              controller: _senhaControler,
              decoration: InputDecoration(label: Text('Senha')),
            ),
            ElevatedButton(
                onPressed: () {
                  login();
                },
                child: Text('Entrar')),
          ],
        ));
  }

  login() async {
    try {
      UserCredential crendencial =
          await _firebaseAuth.signInWithEmailAndPassword(
              email: _emailControler.text, password: _senhaControler.text);
      if (crendencial != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: ((context) => HomePage())));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Usuário não foi encontrado'),
          backgroundColor: Colors.redAccent,
        ));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Senha incorreta'),
          backgroundColor: Colors.redAccent,
        ));
      }
    }
  }
}
