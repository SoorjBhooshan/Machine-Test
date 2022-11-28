import 'package:flutter/material.dart';
import 'package:machine_test_app/controller/auth_controller.dart';
import 'package:machine_test_app/utilities/colors.dart';
import 'package:machine_test_app/utilities/constants.dart';
import 'package:machine_test_app/utilities/styles.dart';
import 'package:provider/provider.dart';

class VerifyOTP extends StatefulWidget {
  const VerifyOTP({Key? key}) : super(key: key);

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthController>(builder: (context, authController, child) {
        return Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: authController.otpController,
                keyboardType: TextInputType.phone,
                maxLength: 6,
                decoration: InputDecoration(
                    fillColor: kgreenColor,
                    filled: true,
                    hintText: enterOtpText,
                    hintStyle: whiteText,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  await authController.confirmUser(context: context);
                },
                child: Container(
                  height: 40,
                  width: 500,
                  decoration: BoxDecoration(
                      color: Colors.green[900],
                      borderRadius: BorderRadius.circular(6)),
                  child: const Center(
                      child: Text(
                    submitOtpText,
                    style: whiteText,
                  )),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
