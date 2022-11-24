import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:machine_test_app/utilities/constants.dart';

class AuthController extends ChangeNotifier {
  CountryCode? countryCode;
  final phoneNumberController = TextEditingController();
  final otpController = TextEditingController();

  var verificationID = '';

  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    await FirebaseAuth.instance.signInWithCredential(credential);
    notifyListeners();
  }

  registerUserWithPhone({@required BuildContext? context}) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: countryCode != null
          ? countryCode!.dialCode.trim() + phoneNumberController.text.trim()
          : indiaCountryCode + phoneNumberController.text.trim(),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        this.verificationID = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationID = verificationId;
      },
    );

    notifyListeners();
  }

  confirmUser({@required BuildContext? context}) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(
          PhoneAuthProvider.credential(
              verificationId: verificationID,
              smsCode: otpController.text.trim()));
    } catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }

  signoutUser({@required BuildContext? context}) async {
    await FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}
