import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:four_deals_shopping/Models/SelectAddressModel.dart';
import 'package:http/io_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import 'package:http/http.dart' as http;

class SelectAddressViewModel extends BaseViewModel {
  List<SelectAddressModel> addresslist = [];

  Future<List<SelectAddressModel>> fetchstorelist() async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    Uri url = Uri.parse("http://test.aswaag.net/api/app/user/address");
    // url.replace(queryParameters: queryParameters);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await ioClient.get(
      url,
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

      addresslist = peoplelist
          .map<SelectAddressModel>((json) => SelectAddressModel.fromJson(json))
          .toList();
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(backgroundColor: Color(0xffFF4D4E), content: Text(message)));
    }

    return addresslist;
  }

  Future<http.Response> deletaddress(String addid, BuildContext context) async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    //final response = await http.post('$url', // Previous Code
    var url = Uri.parse('http://test.aswaag.net/api/app/user/address/${addid}');

    final response = await ioClient.delete(
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

    if (status == "success") {
      notifyListeners();
      fetchstorelist();
    } else {}

    return response;
  }
}
