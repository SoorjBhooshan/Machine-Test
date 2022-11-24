import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:machine_test_app/screens/home_screen.dart';
import 'package:machine_test_app/screens/login_screen.dart';

class UserCheckScreen extends StatelessWidget {
  const UserCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return const HomeScreen();
            } else if(snapshot.hasError){
              return const Center(child: Text('Some error Occured'),);
            }else {
              return const LoginScreen();
            }
          })),
    );
  }
}
