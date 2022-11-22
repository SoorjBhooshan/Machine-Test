import 'package:flutter/material.dart';
import 'package:machine_test_app/screens/home_screen.dart';
import 'package:machine_test_app/utilities/widgets/rounded_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('images/firebase.png'),
            const SizedBox(
              height: 100,
            ),
            const RoundedButton(
              color: Colors.blue,
              text: 'Google',
              height: 35,
              width: 150,
              path: 'images/google.png',
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
              },
              child: const RoundedButton(
                color: Colors.green,
                text: 'Phone',
                height: 35,
                width: 150,
                path: 'images/phone.png',
              ),
            )
          ],
        ),
      ),
    );
  }
}
