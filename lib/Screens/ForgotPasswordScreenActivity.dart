import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_deals_shopping/Controller/APIInterface.dart';
import 'package:four_deals_shopping/Screens/OTP_Verification_Screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<ForgotPasswordScreen> createState() => ForgotPasswordScreenState();
}

class ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final number = TextEditingController();
  late String NUMBER = "";
  APIInterface api = new APIInterface();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/numberverifiybackground.png"),
                fit: BoxFit.fill)),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 100),
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.width / 1.9,
              child: SvgPicture.asset(
                "assets/images/forgotpasswordlog.svg",
                fit: BoxFit.fill,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 40,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12, left: 20, right: 20),
                    child: Text(
                      "Enter the email address you use to create your account and we will email you a link to reset your password",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 60,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 25, right: 25, top: 30),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 18,
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 7,
                    child: Icon(
                      Icons.email,
                      size: MediaQuery.of(context).size.height / 30,
                    ),
                  ),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(left: 5),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        setState(() {
                          NUMBER = value;
                        });
                      },
                      controller: number,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.greenAccent,
                      decoration: InputDecoration(
                          hintText: "Enter Email",
                          suffixIcon: Icon(
                            Icons.done,
                            color:
                                NUMBER == "" ? Colors.white : Color(0xff2696CC),
                          ),
                          hintStyle: TextStyle(fontSize: 15),
                          border: InputBorder.none),
                    ),
                  ))
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                api.forgotpass(number.text, context);
              },
              child: Container(
                margin: EdgeInsets.only(top: 30),
                height: MediaQuery.of(context).size.height / 17,
                width: MediaQuery.of(context).size.width / 1.6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xff2696CC)),
                child: Center(
                  child: Text(
                    "SEND",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 45,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
