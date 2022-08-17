import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:four_deals_shopping/Models/DriversListModel.dart';
import 'package:http/io_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import 'package:http/http.dart' as http;

class MyStoreOrderListViewModel extends BaseViewModel {
  List<DriverListModel> driverslist = [];

  Future<List<DriverListModel>> driverlist() async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    Uri url = Uri.parse("http://test.aswaag.net/api/driver/list");
    // url.replace(queryParameters: queryParameters);

    final response = await ioClient.get(
      url,
      headers: {
        "app-lang": prefs.getString("Language").toString(),
        "device-type": "2",
        "x-auth-token": prefs.getString("token").toString(),
        "Content-Type": 'application/json; charset=UTF-8'
      },
    );
    var jsonData = json.decode(response.body);

    var status = jsonData["status"];
    var data = jsonData["data"];

    if (status == "success") {
      var peoplelist = data["data"].cast<Map<String, dynamic>>();
      print("DATAA${data}");
      notifyListeners();

      driverslist = peoplelist
          .map<DriverListModel>((json) => DriverListModel.fromJson(json))
          .toList();
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(backgroundColor: Color(0xffFF4D4E), content: Text(message)));
    }

    return driverslist;
  }

  Future<http.Response> assignedorder(
      String orderid, String driverid, BuildContext context) async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    //final response = await http.post('$url', // Previous Code
    var url =
        Uri.parse('http://test.aswaag.net/api/app/store/order/assign/driver');

    final response = await ioClient.post(url,
        headers: {
          "app-lang": prefs.getString("Language").toString(),
          "device-type": "2",
          "Content-Type": 'application/json; charset=UTF-8',
          "x-auth-token": prefs.getString("token").toString(),
        },
        body: jsonEncode({
          "orderId": orderid,
          "driverId": driverid,
        }));
    var jsonData = json.decode(response.body);

    print(jsonData);

    var status = jsonData["status"];

    if (status == "success") {
      print("Assined");
    } else {}

    return response;
  }
}
