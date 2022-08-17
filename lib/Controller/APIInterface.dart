import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_deals_shopping/Screens/DashboardScreen.dart';
import 'package:four_deals_shopping/Screens/Fragments/HomeFragment.dart';
import 'package:four_deals_shopping/Screens/LoginScreenActivity.dart';
import 'package:four_deals_shopping/Utils/alertdailogsutils.dart';
import 'package:http/io_client.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class APIInterface {
  var basicurl = "http://test.aswaag.net/api/";
  ALertDailogUtils alerutils = new ALertDailogUtils();
  Future<http.Response> rigister(
      String name,
      String username,
      String email,
      String password,
      String role,
      String mobile,
      String country,
      BuildContext context) async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    //final response = await http.post('$url', // Previous Code
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Uri.parse('${basicurl}auth/signup');

    print(prefs.getString("CuntryISO"));

    final response = await ioClient.post(url,
        headers: {
          "app-lang": prefs.getString("Language").toString(),
          "device-type": "2",
          "Content-Type": 'application/json; charset=UTF-8'
        },
        body: jsonEncode({
          "name": name,
          "userName": username,
          "email": email,
          "password": password,
          "role": role,
          "mobile": mobile,
          "country": prefs.getString("CuntryISO").toString()
        }));
    var jsonData = json.decode(response.body);

    print(jsonData);

    // var message = jsonData["message"];
    var status = jsonData["status"];

    if (status == "success") {
      print("DONE${jsonData["data"]}");

      alerutils.dialogbutton(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color(0xff2696CC),
          content: Text(jsonData.toString())));
    }

    return response;
  }

  Future<http.Response> login(
      String username, String password, BuildContext context) async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    //final response = await http.post('$url', // Previous Code
    var url = Uri.parse('${basicurl}auth/login');

    final response = await ioClient.post(url,
        headers: {
          "app-lang": prefs.getString("Language").toString(),
          "device-type": "2",
          "Content-Type": 'application/json; charset=UTF-8'
        },
        body: jsonEncode({
          "userName": username,
          "password": password,
        }));
    var jsonData = json.decode(response.body);

    print(jsonData);

    // var message = jsonData["message"];
    var status = jsonData["status"];
    var data = jsonData["data"];

    if (status == "success") {
      prefs.setString("email", username);
      prefs.setString("token", data["tokens"]);
      Toast.show("Login Succesfully", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      print(data["tokens"]);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeFragment(0)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color(0xff2696CC),
          content: Text(jsonData.toString())));
    }

    return response;
  }

  Future<http.Response> loginwithsocial(
      String email, String socialid, String type, BuildContext context) async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    //final response = await http.post('$url', // Previous Code
    var url = Uri.parse('${basicurl}auth/social-login');

    final response = await ioClient.post(url,
        headers: {
          "app-lang": prefs.getString("Language").toString(),
          "device-type": "2",
          "Content-Type": 'application/json; charset=UTF-8'
        },
        body: jsonEncode({
          "socialSource": type,
          "socialId": socialid,
          "email": email,
          "country": prefs.getString("CuntryISO").toString(),
        }));
    var jsonData = json.decode(response.body);

    print(jsonData);

    // var message = jsonData["message"];
    var status = jsonData["status"];
    var data = jsonData["data"];

    if (status == "success") {
      prefs.setString("token", data["tokens"]);
      prefs.setString("email", email);
      Toast.show("Login Succesfully", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeFragment(0)));
    } else {}

    return response;
  }

  Future<http.Response> forgotpass(
      String username, BuildContext context) async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    //final response = await http.post('$url', // Previous Code
    var url = Uri.parse('http://test.aswaag.net/api/auth/forgot-password');

    final response = await ioClient.post(url,
        headers: {
          "app-lang": prefs.getString("Language").toString(),
          "device-type": "2",
          "Content-Type": 'application/json; charset=UTF-8'
        },
        body: jsonEncode({
          "userName": username,
        }));
    var jsonData = json.decode(response.body);

    print(jsonData);

    // var message = jsonData["message"];
    var status = jsonData["status"];
    var data = jsonData["data"];

    if (status == "success") {
      dialogbutton(context);
    } else {}

    return response;
  }

  void dialogbutton(BuildContext contex) {
    showDialog(
        context: contex,
        barrierDismissible: true,
        builder: (ctx) {
          bool isChecked = false;
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              insetPadding: EdgeInsets.symmetric(horizontal: 25),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              content: Container(
                height: MediaQuery.of(context).size.height / 8,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 15,
                      width: MediaQuery.of(context).size.height / 15,
                      child: SvgPicture.asset(
                        "assets/images/varificationlinksendicons.svg",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "Reset password Link has been sent to your Registered Email ID",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 60,
                            color: Color(0xff9B9B9B)),
                      ),
                    )
                  ],
                ),
              ),
              actions: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(bottom: 10),
                          width: MediaQuery.of(context).size.width / 1.8,
                          height: MediaQuery.of(context).size.height / 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff2696CC)),
                          child: Text(
                            "DONE",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          });
        });
  }
}
