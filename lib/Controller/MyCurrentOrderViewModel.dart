import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:four_deals_shopping/Models/AdsBannerModel.dart';
import 'package:four_deals_shopping/Models/MyCurrentOderModel.dart';
import 'package:four_deals_shopping/Utils/BaseUrl.dart';
import 'package:http/io_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import '../Models/GetCategoryModel.dart';
import 'package:http/http.dart' as http;

class MyCurrentOrderViewModel extends BaseViewModel {
  List<MyCurrectOrderModel> currentorder = [];
  late String deleverystatus = "";
  late String productimage = "";
  late String street = "";
  late String City = "";
  late String number = "";

  Future<List<MyCurrectOrderModel>> fetchcurrentorder(
      String orderstatus) async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final queryParameters = {
      // "userId": prefs.getString("UserId"),
      "userId": prefs.getString("UserId").toString(),

      "orderStatus": orderstatus
    };

    final uri = Uri.http(
        '${"test.aswaag.net"}', '/api/app/sales-list', queryParameters);

    // Uri url = Uri.parse("${baseurl.baseurl}/app/sales-list");
    // url.replace(queryParameters: queryParameters);

    final response = await ioClient.get(
      uri,
      headers: {
        "app-lang": prefs.getString("Language").toString(),
        "device-type": "2",
        "x-auth-token": prefs.getString("token").toString(),
        HttpHeaders.contentTypeHeader: "application/json"
      },
    );
    var jsonData = json.decode(response.body);

    var status = jsonData["status"];
    var data = jsonData["data"];

    if (status == "success") {
      var peoplelist = data["data"].cast<Map<String, dynamic>>();
      print("DATAA${data}");
      notifyListeners();

      currentorder = peoplelist
          .map<MyCurrectOrderModel>(
              (json) => MyCurrectOrderModel.fromJson(json))
          .toList();
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(backgroundColor: Color(0xffFF4D4E), content: Text(message)));
    }

    return currentorder;
  }

  Future<http.Response> fetchstatusdelevery(String salesid) async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    final queryParameters = {
      // "userId": prefs.getString("UserId"),

      "salesId": salesid
    };

    final uri = Uri.http(
        '${"test.aswaag.net"}', '/api/app/sales-details', queryParameters);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response = await ioClient.get(
      uri,
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
    var shipadd = data1["shippingAddress"];

    if (status == "success") {
      notifyListeners();

      this.deleverystatus = data1["status"];
      this.productimage =
          "https://aswagbuckets3.s3.me-south-1.amazonaws.com/${data1["thumbnailImage"]}";
      this.street = shipadd["street"];
      this.City = shipadd["city"];
      this.number = shipadd["mobile"];
    } else {}

    return response;
  }
}
