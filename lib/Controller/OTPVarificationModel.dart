import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class OTPVerificationModel extends BaseViewModel {
  late String Verificationcode = "";

  TextEditingController textEditingController = new TextEditingController();

  void Verifyphone(String number, String Countrycode) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "${Countrycode}${number}",
        codeSent: (String verificationId, int? forceResendingToken) {
          Verificationcode = verificationId;
          notifyListeners();
          print("SENT");
          textEditingController.text = verificationId;
          // Toast.show("OTP Sent", context,
          //     duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          Verificationcode = verificationId;
        },
        verificationFailed: (FirebaseAuthException error) {
          print(error.message);
        },
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          await FirebaseAuth.instance
              .signInWithCredential(phoneAuthCredential)
              .then((value) async {
            if (value.user != null) {
            } else {}
          });
        },
        timeout: Duration(seconds: 60));
  }
}
