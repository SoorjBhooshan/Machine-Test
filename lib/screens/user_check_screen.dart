import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:machine_test_app/screens/home_screen.dart';
import 'package:machine_test_app/screens/login_screen.dart';

class UserCheckScreen extends StatefulWidget {
  const UserCheckScreen({super.key});

  @override
  State<UserCheckScreen> createState() => _UserCheckScreenState();
}

class _UserCheckScreenState extends State<UserCheckScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => check());
  }

  check() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    if (user != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (Route<dynamic> route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
   
    );
  }
}
