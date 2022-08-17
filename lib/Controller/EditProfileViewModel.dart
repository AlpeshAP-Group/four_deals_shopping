import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:four_deals_shopping/Screens/DashboardScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:http/io_client.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class EdirProfileViewModel extends BaseViewModel {
  late String name = "";
  TextEditingController names = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController lastname = new TextEditingController();
  TextEditingController mobile = new TextEditingController();
  late String followers = "";
  late String following = "";
  late String dob = "";
  Future<http.Response> fetchmyprofile() async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    //final response = await http.post('$url', // Previous Code

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Uri.parse('http://test.aswaag.net/api/auth/user-profile');

    final response = await ioClient.get(
      url,
      headers: {
        "app-lang": prefs.getString("Language").toString(),
        "device-type": "2",
        "Content-Type": 'application/json; charset=UTF-8',
        "x-auth-token": prefs.getString("token").toString(),
      },
    );
    var jsonData = json.decode(response.body);

    print(jsonData);

    // var message = jsonData["message"];
    var status = jsonData["status"];
    var data = jsonData["data"];
    var data1 = data["data"];

    if (status == "success") {
      notifyListeners();

      this.names.text = data1["firstName"];
      this.followers = data1["totalFollower"].toString();
      this.following = data1["totalFollowing"].toString();
      this.email.text = data1["email"].toString();
      this.lastname.text = data1["lastName"].toString();
      this.dob = data1["dob"].toString();
      this.mobile.text = data1["mobile"];
    } else {}

    return response;
  }

  Future<http.Response> updateprofile(
      String firstname,
      String mobile,
      String email,
      String gender,
      String dob,
      String lastname,
      String profileimage,
      String country,
      BuildContext context) async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    // SharedPreferences prefs = await SharedPreferences.getInstance();

    //final response = await http.post('$url', // Previous Code
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Uri.parse('http://test.aswaag.net/api/auth/user-profile');

    final response = await ioClient.put(url, headers: {
      "app-lang": prefs.getString("Language").toString(),
      "device-type": "2",
      "x-auth-token": prefs.getString("token").toString(),
    }, body: {
      "firstName": firstname,
      "mobile": mobile,
      "email": email,
      "gender": gender,
      "Dob": dob,
      "lastName": lastname,
      "profileImage": profileimage,
      "country": country,
    });
    var jsonData = json.decode(response.body);

    print(jsonData);

    // var message = jsonData["message"];
    var status = jsonData["status"];
    var data = jsonData["data"];

    if (status == "success") {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => DashboardScreen()));
    } else {}

    return response;
  }
}
