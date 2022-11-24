import 'package:flutter/material.dart';
import 'package:machine_test_app/controller/auth_controller.dart';
import 'package:machine_test_app/screens/phone_otp_screen.dart';
import 'package:machine_test_app/utilities/constants.dart';
import 'package:machine_test_app/utilities/styles.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthController>(
        builder: (context,authController,child) {
          return Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(firebaseImgPath),
                const SizedBox(
                  height: 100,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30)),
                    child: ListTile(
                      onTap: () {
                        authController.googleLogin();
                      },
                        leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Image.asset(googleImgPath)),
                        title: const Center(
                            child: Text(
                          googleText,
                          style: whiteText,
                        )))),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30)),
                    child: ListTile(
                        leading: const Icon(Icons.phone, color: Colors.white),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PhoneOTP(),
                              ));
                        },
                        title: const Center(
                            child: Text(
                          phoneText,
                          style: whiteText,
                        ))))
              ],
            ),
          );
        }
      ),
    );
  }
}
