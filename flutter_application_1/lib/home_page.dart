import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/check_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text('HomePage'),
          TextButton(onPressed: logout, child: Text('Logout'))
        ],
      ),
    );
  }

  logout() async {
    await _firebaseAuth.signOut().then((User) => Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => CheckUser()))));
  }
}
