import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:four_deals_shopping/Models/AdsBannerModel.dart';
import 'package:four_deals_shopping/Models/MyCurrentOderModel.dart';
import 'package:four_deals_shopping/Models/SearchListModel.dart';
import 'package:four_deals_shopping/Utils/BaseUrl.dart';
import 'package:http/io_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import '../Models/GetCategoryModel.dart';

class SearchListViewModel extends BaseViewModel {
  List<SearchListModel> seacrhlist = [];

  late String userid = "";

  Future<List<SearchListModel>> fetchcurrentorder() async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);
    final queryParameters = {"searchText": "Car"};

    final uri = Uri.http('${"test.aswaag.net"}', '/api/app/search-autocomplete',
        queryParameters);

    // Uri url = Uri.parse("${baseurl.baseurl}/app/sales-list");
    // url.replace(queryParameters: queryParameters);

    SharedPreferences prefs = await SharedPreferences.getInstance();

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

      seacrhlist = peoplelist
          .map<SearchListModel>((json) => SearchListModel.fromJson(json))
          .toList();
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(backgroundColor: Color(0xffFF4D4E), content: Text(message)));
    }

    return seacrhlist;
  }

  void getprefdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    notifyListeners();
    userid = prefs.getString("UserId").toString();
  }
}
