import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import 'package:http/io_client.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class ProductDetailsViewModel extends BaseViewModel {
  late String title = "";
  late String description = "";
  late String price = "";
  late String ownername = "";
  late String owenerimage = "";
  late String ownerid = "";
  late String adsimage = "";
  late String addid = "";

  Future<http.Response> fetchproduct(String aidid) async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    //final response = await http.post('$url', // Previous Code
    var url =
        Uri.parse('http://test.aswaag.net/api/app/normal/ad-detail/${aidid}');

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
    var imagendpoint = jsonData["mediaEndPoint"];
    var data1 = data["data"];

    if (status == "success") {
      notifyListeners();

      this.title = data1["title"];
      this.description = data1["description"].toString();
      this.price = data1["sellingPrice"].toString();
      this.ownername = data1["ownerFirstName"].toString();
      this.ownerid = data1["ownerId"].toString();
      this.owenerimage =
          "https://aswagbuckets3.s3.me-south-1.amazonaws.com/${data1["ownerProfileImage"].toString()}";
      this.adsimage =
          "https://aswagbuckets3.s3.me-south-1.amazonaws.com/${data1["thumbnailImage"]}";
      this.addid = data1["adId"].toString();
    } else {}

    return response;
  }

  Future<http.Response> followuser(
      String ownerid, String actions, BuildContext context) async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    //final response = await http.post('$url', // Previous Code
    var url = Uri.parse('http://test.aswaag.net/api/app/user/follow');

    final response = await ioClient.post(url,
        headers: {
          "app-lang": prefs.getString("Language").toString(),
          "device-type": "2",
          "Content-Type": 'application/json; charset=UTF-8',
          "x-auth-token": prefs.getString("token").toString(),
        },
        body: jsonEncode({
          "followingUserId": ownerid,
          "action": actions,
        }));
    var jsonData = json.decode(response.body);

    print(jsonData);

    // var message = jsonData["message"];
    var status = jsonData["status"];
    var data = jsonData["data"];

    if (status == "success") {
      print("DONE");
    } else {}

    return response;
  }

  Future<http.Response> addtocart(String adid, String storeid, String qunatity,
      BuildContext context) async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    //final response = await http.post('$url', // Previous Code
    var url = Uri.parse('http://test.aswaag.net/api/app/store/cart');

    final response = await ioClient.post(url,
        headers: {
          "app-lang": prefs.getString("Language").toString(),
          "device-type": "2",
          "Content-Type": 'application/json; charset=UTF-8',
          "x-auth-token": prefs.getString("token").toString(),
        },
        body: jsonEncode({
          "adId": adid,
          "storeId": storeid,
          "quantity": qunatity,
        }));
    var jsonData = json.decode(response.body);

    print(jsonData);

    // var message = jsonData["message"];
    var status = jsonData["status"];
    var data = jsonData["data"];

    if (status == "success") {
      print("DONE");
    } else {}

    return response;
  }

  Future<http.Response> reportads(
      String addid,
      String fakeads,
      String abusive,
      String explisitcontent,
      String unknown,
      String spam,
      String eligalactivity,
      String other,
      BuildContext context) async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    //final response = await http.post('$url', // Previous Code
    var url = Uri.parse('http://test.aswaag.net/api/app/user/ads/report');

    final response = await ioClient.post(url,
        headers: {
          "app-lang": prefs.getString("Language").toString(),
          "device-type": "2",
          "Content-Type": 'application/json; charset=UTF-8',
          "x-auth-token": prefs.getString("token").toString(),
        },
        body: jsonEncode({
          "adId": addid,
          "fakeAds": fakeads,
          "abusive": abusive,
          "explicitContent": explisitcontent,
          "unknown": unknown,
          "spam": spam,
          "illegalActivity": eligalactivity,
          "other": other,
        }));
    var jsonData = json.decode(response.body);

    print(jsonData);

    // var message = jsonData["message"];
    var status = jsonData["status"];
    var data = jsonData["data"];

    if (status == "success") {
      print("Reported");
    } else {}

    return response;
  }
}
