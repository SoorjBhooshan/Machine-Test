import 'package:flutter/material.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:machine_test_app/controller/auth_controller.dart';
import 'package:machine_test_app/screens/verify_otp.dart';
import 'package:machine_test_app/utilities/constants.dart';
import 'package:machine_test_app/utilities/styles.dart';
import 'package:provider/provider.dart';

class PhoneOTP extends StatefulWidget {
  const PhoneOTP({Key? key}) : super(key: key);

  @override
  State<PhoneOTP> createState() => _PhoneOTPState();
}

class _PhoneOTPState extends State<PhoneOTP> {
  final countryPicker = const FlCountryCodePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthController>(builder: (context, authController, child) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 150,
                    width: double.infinity,
                  ),
                  SizedBox(
                      width: 150,
                      height: 150,
                      child: Image.asset(firebaseImgPath)),
                  const SizedBox(
                    height: 15,
                    width: double.infinity,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () async {
                            authController.countryCode = await countryPicker
                                .showPicker(context: context);

                            setState(() {});
                          },
                          child: Container(
                            width: 10,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                authController.countryCode != null
                                    ? authController.countryCode!.dialCode
                                    : indiaCountryCode,
                                style: whiteText,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 5,
                        child: TextField(
                          controller: authController.phoneNumberController,
                          style: whiteText,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: phoneNumberLabel,
                              hintStyle: whiteText,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              fillColor: Colors.green,
                              filled: true),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      authController.registerUserWithPhone(context: context);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VerifyOTP()));
                    },
                    child: Container(
                      height: 40,
                      width: 500,
                      decoration: BoxDecoration(
                          color: Colors.green[900],
                          borderRadius: BorderRadius.circular(6)),
                      child: const Center(
                          child: Text(
                        getOtpText,
                        style: whiteText,
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
