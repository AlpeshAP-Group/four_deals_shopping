import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_deals_shopping/Controller/APIInterface.dart';
import 'package:four_deals_shopping/Controller/OTPVarificationModel.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';

class OTPVerificationScreen extends StatefulWidget {
  String? name = null;
  String? username = null;
  String? email = null;
  String? password = null;
  String? cnpassword = null;
  String? number = null;
  String? country = null;
  String? countrycode = null;
  OTPVerificationScreen(this.name, this.username, this.email, this.password,
      this.cnpassword, this.number, this.country, this.countrycode);
  @override
  State<OTPVerificationScreen> createState() => OTPVerificationScreenState(name,
      username, email, password, cnpassword, number, country, countrycode);
}

class OTPVerificationScreenState extends State<OTPVerificationScreen> {
  String? name = null;
  String? username = null;
  String? email = null;
  String? password = null;
  String? cnpassword = null;
  String? number = null;
  String? country = null;
  String? countrycode = null;
  OTPVerificationScreenState(
      this.name,
      this.username,
      this.email,
      this.password,
      this.cnpassword,
      this.number,
      this.country,
      this.countrycode);
  final otp = TextEditingController();
  late String NUMBER;

  String currentText = "";

  APIInterface api = new APIInterface();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OTPVerificationModel>.reactive(
        viewModelBuilder: () => OTPVerificationModel(),
        onModelReady: (model) =>
            {model.Verifyphone(number.toString(), countrycode.toString())},
        builder: (context, model, child) => Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/numberverifiybackground.png"),
                                fit: BoxFit.fill)),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 100),
                              height: MediaQuery.of(context).size.height / 5,
                              width: MediaQuery.of(context).size.width / 1.9,
                              child: SvgPicture.asset(
                                "assets/images/otpvarificationlogo.svg",
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 40),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Verify OTP",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              30,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 7),
                                    child: Text(
                                      "Please enter the 4 Digit code send to",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50,
                                          color: Color(0xff9B9B9B)),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "+965 2714 4584",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50,
                                          color: Color(0xff9B9B9B)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width / 5.0,
                                  vertical: 30),
                              child: PinCodeTextField(
                                appContext: context,
                                controller: otp,
                                pastedTextStyle: TextStyle(
                                  color: Color(0xff2696CC),
                                  fontWeight: FontWeight.bold,
                                ),
                                length: 6,

                                onChanged: (value) {
                                  debugPrint(value);
                                  setState(() {
                                    currentText = value;
                                  });
                                },

                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(5),
                                  fieldHeight:
                                      MediaQuery.of(context).size.height / 17,
                                  inactiveFillColor: Colors.white,
                                  fieldWidth:
                                      MediaQuery.of(context).size.height / 17,
                                  activeColor: Colors.white,
                                  inactiveColor: Color(0xff2696CC),
                                  selectedColor: Color(0xff2696CC),
                                  activeFillColor: Color(0xff2696CC),
                                ),
                                cursorColor: Colors.black,
                                animationDuration:
                                    const Duration(milliseconds: 300),
                                enableActiveFill: true,

                                keyboardType: TextInputType.number,
                                boxShadows: const [
                                  BoxShadow(
                                    offset: Offset(0, 3),
                                    color: Colors.black12,
                                    blurRadius: 10,
                                  )
                                ],
                                onCompleted: (v) {
                                  debugPrint("Completed");
                                },
                                // onTap: () {
                                //   print("Pressed");
                                // },

                                beforeTextPaste: (text) {
                                  debugPrint("Allowing to paste $text");
                                  return true;
                                },
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await FirebaseAuth.instance
                                    .signInWithCredential(
                                        PhoneAuthProvider.credential(
                                            verificationId:
                                                model.Verificationcode,
                                            smsCode: otp.text));
                                api.rigister(
                                    name.toString(),
                                    username.toString(),
                                    email.toString(),
                                    password.toString(),
                                    "CUSTOMER",
                                    number.toString(),
                                    "IN",
                                    context);
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height / 17,
                                width: MediaQuery.of(context).size.width / 1.6,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color(0xff2696CC)),
                                child: Center(
                                  child: Text(
                                    "Verify Now",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                45,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Didn't Get OTP ?",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              60),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Text(
                                      "Resend Now",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              53,
                                          color: Color(0xff2696CC),
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
