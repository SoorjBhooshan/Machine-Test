import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:machine_test_app/screens/home_screen.dart';
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

  Future googleLogin({@required BuildContext? context}) async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    await auth.signInWithCredential(credential).then((value) {
      Navigator.of(context!).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (Route<dynamic> route) => false);
    });
    notifyListeners();
  }

  registerUserWithPhone({@required BuildContext? context}) async {
    await auth.verifyPhoneNumber(
      timeout: const Duration(seconds: 60),
      phoneNumber: countryCode != null
          ? countryCode!.dialCode.trim() + phoneNumberController.text.trim()
          : indiaCountryCode + phoneNumberController.text.trim(),
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          debugPrint('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        this.verificationID = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );

    notifyListeners();
  }

  void getCurrentUserDetails() {
    userName = auth.currentUser!.displayName.toString();
    id = auth.currentUser!.uid.toString();
    phone = auth.currentUser!.phoneNumber.toString();
    notifyListeners();
  }

  confirmUser({@required BuildContext? context}) async {
    try {
      await auth
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: verificationID,
              smsCode: otpController.text.trim()))
          .then((value) {
        Navigator.of(context!).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (Route<dynamic> route) => false);
      });
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Invalid OTP',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      // debugPrint(e.toString());
    }
    notifyListeners();
  }

  signoutUser({@required BuildContext? context}) async {
    await auth.signOut().then((value) {
      Navigator.of(context!).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (Route<dynamic> route) => false);
    });

    notifyListeners();
  }
}
