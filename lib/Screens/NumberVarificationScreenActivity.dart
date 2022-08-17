import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_deals_shopping/Screens/OTP_Verification_Screen.dart';

class NumberVarificationScreen extends StatefulWidget {
  String? name = null;
  String? username = null;
  String? email = null;
  String? password = null;
  String? cnpassword = null;

  NumberVarificationScreen(
      this.name, this.username, this.email, this.password, this.cnpassword);

  @override
  State<NumberVarificationScreen> createState() =>
      NumberVarificationScreenState(
          name, username, email, password, cnpassword);
}

class NumberVarificationScreenState extends State<NumberVarificationScreen> {
  String? name = null;
  String? username = null;
  String? email = null;
  String? password = null;
  String? cnpassword = null;

  NumberVarificationScreenState(
      this.name, this.username, this.email, this.password, this.cnpassword);
  final number = TextEditingController();
  late String NUMBER = "";
  late String countrycode = "";
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
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width / 1.9,
              child: SvgPicture.asset(
                "assets/images/numberveriylogo.svg",
                fit: BoxFit.fill,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      "Verify Number",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 30,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 7),
                    child: Text(
                      "Please enter your phone number",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 25, right: 25, top: 20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 18,
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: CountryCodePicker(
                      onChanged: (value) {
                        setState(() {
                          countrycode = value.toString();
                        });
                      },
                      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                      initialSelection: 'IT',
                      favorite: ['+39', 'FR'],
                      // optional. Shows only country name and flag
                      showCountryOnly: false,
                      // optional. Shows only country name and flag when popup is closed.
                      showOnlyCountryWhenClosed: false,
                      // optional. aligns the flag and the Text left
                      alignLeft: false,
                    ),
                  ),
                  Container(
                    width: 1.5,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.grey,
                    margin: EdgeInsets.symmetric(vertical: 10),
                  ),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(left: 15),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        setState(() {
                          NUMBER = value;
                        });
                      },
                      controller: number,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.greenAccent,
                      decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.done,
                            color:
                                NUMBER == "" ? Colors.white : Color(0xff2696CC),
                          ),
                          hintText: "Search",
                          hintStyle: TextStyle(fontSize: 15),
                          border: InputBorder.none),
                    ),
                  ))
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OTPVerificationScreen(
                            name,
                            username,
                            email,
                            password,
                            cnpassword,
                            number.text,
                            "IN",
                            countrycode)));
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
                    "SEND OTP",
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
