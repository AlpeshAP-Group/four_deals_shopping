import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:four_deals_shopping/Models/AdsBannerModel.dart';
import 'package:four_deals_shopping/Models/StoresListModel.dart';
import 'package:four_deals_shopping/Utils/BaseUrl.dart';
import 'package:http/io_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import 'package:http/http.dart' as http;

import '../Models/GetCategoryModel.dart';

class MyAccountViewModel extends BaseViewModel {
  late String name = "";
  late String followers = "";
  late String following = "";
  late String myaids = "";
  Future<http.Response> fetchmyprofile() async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    //final response = await http.post('$url', // Previous Code
    var url = Uri.parse('http://test.aswaag.net/api/auth/user-profile');

    SharedPreferences prefs = await SharedPreferences.getInstance();

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

      this.name = data1["firstName"];
      this.followers = data1["totalFollower"].toString();
      this.following = data1["totalFollowing"].toString();
      this.myaids = data1["totalAds"].toString();
      prefs.setString("UserId", data1["userId"].toString());
    } else {}

    return response;
  }
}
