import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_deals_shopping/Controller/APIInterface.dart';
import 'package:four_deals_shopping/Screens/DashboardScreen.dart';
import 'package:four_deals_shopping/Screens/ForgotPasswordScreenActivity.dart';
import 'package:four_deals_shopping/Screens/RegisterScreenActivity.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  late String emails = "";

  Map<String, dynamic> userData = new Map();

  final password = TextEditingController();
  late String passwords = "";

  bool _secureText = true;

  final FirebaseAuth auth = FirebaseAuth.instance;

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
                      "Let's Login",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 30,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text(
                      "Start availing best discount again",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 55),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Username or Email",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 65),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 16,
                    margin: EdgeInsets.only(top: 12),
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
                              hintText: "Enter Email Address",
                              suffixIcon: Icon(
                                Icons.done,
                                color: emails == ""
                                    ? Colors.white
                                    : Color(0xff2696CC),
                              ),
                              hintStyle: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 70),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 13),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text("Password",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 65)),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 16,
                    margin: EdgeInsets.only(top: 12),
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
                          obscureText: _secureText,
                          keyboardType: TextInputType.visiblePassword,
                          cursorColor: Colors.greenAccent,
                          decoration: InputDecoration(
                              hintText: "Enter Passwords",
                              hintStyle: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 70),
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
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgotPasswordScreen()));
              },
              child: Container(
                margin: EdgeInsets.only(top: 15),
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 60,
                      color: Color(0xff646363),
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                if (email.text == "") {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Color(0xff2696CC),
                      content: Text("Please Enter Email Id")));
                } else if (password.text == "") {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Color(0xff2696CC),
                      content: Text("Please Enter Password")));
                } else {
                  api.login(email.text, password.text, context);
                }
              },
              child: Container(
                height: MediaQuery.of(context).size.height / 15,
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xff2696CC),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 33,
                      width: MediaQuery.of(context).size.height / 33,
                      child: SvgPicture.asset(
                          "assets/images/loginbuttonicons.svg"),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 12),
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 60,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                "Or sign in with",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 60),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      signup(context);
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height / 13,
                      width: MediaQuery.of(context).size.height / 13,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40)),
                      child: Center(
                        child:
                            SvgPicture.asset("assets/images/googleicons.svg"),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      facebookLogin();
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 15),
                      height: MediaQuery.of(context).size.height / 13,
                      width: MediaQuery.of(context).size.height / 13,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40)),
                      child: Center(
                        child:
                            SvgPicture.asset("assets/images/facebookicons.svg"),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Don't have an account?",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 60,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 53,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff2696CC)),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  Future<void> facebookLogin() async {
//        setState(ViewState.Busy);
    final facebookLogin = FacebookLogin();
    facebookLogin.loginBehavior = FacebookLoginBehavior.webOnly;
    final result = await facebookLogin.logIn(['email']);
    final token = result.accessToken.token;

    var uri = Uri.parse(
        'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');

    final graphResponse = await http.get(uri);
    final facebookProfile = json.decode(graphResponse.body);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        // loginWithFaceBook(result.accessToken.userId);

        List<String> names = facebookProfile['name'].toString().split(' ');

//        Map<String, dynamic> userData = new Map();
        userData['email'] = facebookProfile['email'];
        userData['firstName'] = names[0];
        userData['lastName'] = names[1];
        userData['facebookAc'] = result.accessToken.userId;
//            checkProfileImage();

//        redirectToPage(UsernameViewRoute, arguments: userData);
        print(result.accessToken.userId);
        break;

      case FacebookLoginStatus.cancelledByUser:
        break;
      case FacebookLoginStatus.error:
        break;
    }
  }

  translate(login_cancelled_by_user) {}

  Future<void> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;
      SharedPreferences prefs = await SharedPreferences.getInstance();

      if (result != null) {
        print("USEREMAIL${result.user!.tenantId}");
        prefs.setString("email", result.user!.displayName.toString());

        APIInterface().loginwithsocial(
            result.user!.email.toString(), result.user!.uid, "GOOGLE", context);
      } // if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    }
  }
}
