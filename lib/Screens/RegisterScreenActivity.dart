import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_deals_shopping/Controller/APIInterface.dart';
import 'package:four_deals_shopping/Screens/NumberVarificationScreenActivity.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final name = TextEditingController();
  late String names = "";

  final username = TextEditingController();
  late String usernames = "";

  final email = TextEditingController();
  late String emails = "";

  final password = TextEditingController();
  late String passwords;

  final conpassword = TextEditingController();
  late String conpasswords;
  bool _secureText = true;
  bool _secureText2 = true;

  bool values = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image:
                      AssetImage("assets/images/search categorybackground.png"),
                  fit: BoxFit.fill)),
          child: Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 100),
                      child: Text(
                        "Get Registered",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 30,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        "Sign up now & avail best offers",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 55),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              "Name",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 65),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 16,
                            margin: EdgeInsets.only(top: 10),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  onChanged: (value) {
                                    setState(() {
                                      names = value;
                                    });
                                  },
                                  controller: name,
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: Colors.greenAccent,
                                  decoration: InputDecoration(
                                      hintText: "Enter Name",
                                      suffixIcon: Icon(
                                        Icons.done,
                                        color: names == ""
                                            ? Colors.white
                                            : Color(0xff2696CC),
                                      ),
                                      hintStyle: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              70),
                                      border: InputBorder.none),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              "UserName",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 65),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 16,
                            margin: EdgeInsets.only(top: 10),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  onChanged: (value) {
                                    setState(() {
                                      usernames = value;
                                    });
                                  },
                                  controller: username,
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: Colors.greenAccent,
                                  decoration: InputDecoration(
                                      hintText: "Enter UserName",
                                      suffixIcon: Icon(
                                        Icons.done,
                                        color: usernames == ""
                                            ? Colors.white
                                            : Color(0xff2696CC),
                                      ),
                                      hintStyle: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              70),
                                      border: InputBorder.none),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              "Email",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 65),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 16,
                            margin: EdgeInsets.only(top: 10),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  onChanged: (value) {
                                    setState(() {
                                      emails = value;
                                    });
                                  },
                                  controller: email,
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: Colors.greenAccent,
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.done,
                                        color: emails == ""
                                            ? Colors.white
                                            : Color(0xff2696CC),
                                      ),
                                      hintText: "Enter Email",
                                      hintStyle: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              70),
                                      border: InputBorder.none),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              "Password",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 65),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 16,
                            margin: EdgeInsets.only(top: 5),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  onChanged: (value) => passwords = value,
                                  controller: password,
                                  keyboardType: TextInputType.emailAddress,
                                  obscureText: _secureText,
                                  cursorColor: Colors.greenAccent,
                                  decoration: InputDecoration(
                                      hintText: "Enter Password",
                                      suffixIcon: IconButton(
                                        icon: Icon(_secureText
                                            ? Icons.remove_red_eye_outlined
                                            : Icons.remove_red_eye),
                                        color: Color(0xff3EA7AD),
                                        onPressed: () {
                                          setState(() {
                                            _secureText = !_secureText;
                                          });
                                        },
                                      ),
                                      hintStyle: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              70),
                                      border: InputBorder.none),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              "Confirm",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 65),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 16,
                            margin: EdgeInsets.only(top: 5),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  onChanged: (value) => conpasswords = value,
                                  controller: conpassword,
                                  keyboardType: TextInputType.emailAddress,
                                  obscureText: _secureText2,
                                  cursorColor: Colors.greenAccent,
                                  decoration: InputDecoration(
                                      hintText: "Enter Confirm Password",
                                      suffixIcon: IconButton(
                                        icon: Icon(_secureText2
                                            ? Icons.remove_red_eye_outlined
                                            : Icons.remove_red_eye),
                                        color: Color(0xff3EA7AD),
                                        onPressed: () {
                                          setState(() {
                                            _secureText2 = !_secureText2;
                                          });
                                        },
                                      ),
                                      hintStyle: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              70),
                                      border: InputBorder.none),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, top: 10, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 5),
                            child: Checkbox(
                              value: this.values,
                              checkColor: Colors.white,
                              activeColor: Color(0xff2696CC),
                              onChanged: (value) async {
                                setState(() {
                                  this.values = value!;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "By creating an account your agree to our Terms & Conditions.",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 70),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (email.text == "") {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Color(0xff2696CC),
                              content: Text("Please Enter Name")));
                        } else if (username.text == "") {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Color(0xff2696CC),
                              content: Text("Please Enter UserName")));
                        } else if (email.text == "") {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Color(0xff2696CC),
                              content: Text("Please Enter Your Email Id")));
                        } else if (password.text == "") {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Color(0xff2696CC),
                              content: Text("Please Enter Your Password")));
                        } else if (conpassword.text == "") {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Color(0xff2696CC),
                              content:
                                  Text("Please Enter Your Confirm Password")));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      NumberVarificationScreen(
                                          name.text,
                                          username.text,
                                          email.text,
                                          password.text,
                                          conpassword.text)));
                        }
                        // api.rigister();
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 15,
                        margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Color(0xff2696CC),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: MediaQuery.of(context).size.height / 38,
                              width: MediaQuery.of(context).size.height / 38,
                              child: SvgPicture.asset(
                                  "assets/images/signuplogoicons.svg"),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 12),
                              child: Text(
                                "SIGN UP",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height / 60,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Text(
                        "Or sign up with",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 70),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height / 13,
                            width: MediaQuery.of(context).size.height / 13,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40)),
                            child: Center(
                              child: SvgPicture.asset(
                                  "assets/images/googleicons.svg"),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            height: MediaQuery.of(context).size.height / 13,
                            width: MediaQuery.of(context).size.height / 13,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40)),
                            child: Center(
                              child: SvgPicture.asset(
                                  "assets/images/facebookicons.svg"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
