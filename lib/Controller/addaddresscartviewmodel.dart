import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class AddressCartViewModel extends BaseViewModel {
  Future<http.Response> addaddress(
      String name,
      String mobile,
      String cityId,
      String block,
      String street,
      String house,
      String latitude,
      String longitude,
      String apartment,
      String floor,
      String jadda,
      String extra,
      BuildContext context) async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    //final response = await http.post('$url', // Previous Code
    var url = Uri.parse('${"http://test.aswaag.net/api/"}app/user/address');

    final response = await ioClient.post(url,
        headers: {
          "app-lang": prefs.getString("Language").toString(),
          "device-type": "2",
          "Content-Type": 'application/json; charset=UTF-8',
          "x-auth-token": prefs.getString("token").toString(),
        },
        body: jsonEncode({
          "name": name,
          "mobile": mobile,
          "cityId": cityId,
          "block": block,
          "street": street,
          "house": house,
          "latitude": latitude,
          "longitude": longitude,
          "apartment": apartment,
          "floor": floor,
          "jadda": jadda,
          "extra": extra,
        }));
    var jsonData = json.decode(response.body);

    print(jsonData);

    // var message = jsonData["message"];
    var status = jsonData["status"];
    var data = jsonData["data"];

    if (status == "success") {
      Navigator.of(context).pop();
    } else {}

    return response;
  }
}
