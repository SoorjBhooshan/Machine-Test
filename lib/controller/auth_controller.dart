import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:machine_test_app/screens/login_screen.dart';
import 'package:machine_test_app/utilities/constants.dart';

class AuthController extends ChangeNotifier {
  CountryCode? countryCode;
  final phoneNumberController = TextEditingController();
  final otpController = TextEditingController();

  String userName = '';
  String id = '';
  String phone = '';

  var verificationID = '';

  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  FirebaseAuth auth = FirebaseAuth.instance;

  Future googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    await auth.signInWithCredential(credential);
    getCurrentUserName();
    notifyListeners();
  }

  registerUserWithPhone({@required BuildContext? context}) async {
    await auth.verifyPhoneNumber(
      timeout: const Duration(seconds: 60),
      phoneNumber: countryCode != null
          ? countryCode!.dialCode.trim() + phoneNumberController.text.trim()
          : indiaCountryCode + phoneNumberController.text.trim(),
      verificationCompleted: (PhoneAuthCredential credential) async {
        // await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        this.verificationID = verificationId;
        //String smsCode = otpController.text.trim();

        // // Create a PhoneAuthCredential with the code
        // PhoneAuthCredential credential = PhoneAuthProvider.credential(
        //     verificationId: verificationId, smsCode: smsCode);

        // // Sign the user in (or link) with the credential
        // await auth.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        //this.verificationID = verificationId;
      },
    );

    notifyListeners();
  }

  void getCurrentUserName() {
    userName = auth.currentUser!.displayName.toString();
    id = auth.currentUser!.uid.toString();
    phone = auth.currentUser!.phoneNumber.toString();
    notifyListeners();
  }

  confirmUser({@required BuildContext? context}) async {
    try {
      await auth.signInWithCredential(PhoneAuthProvider.credential(
          verificationId: verificationID, smsCode: otpController.text.trim()));
      // Navigator.push(context!,
      //     MaterialPageRoute(builder: ((context) => const HomeScreen())));

      getCurrentUserName();
    } catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }

  signoutUser({@required BuildContext? context}) async {
    await auth.signOut();
    Navigator.push(context!,
        MaterialPageRoute(builder: ((context) => const LoginScreen())));
    notifyListeners();
  }
}
