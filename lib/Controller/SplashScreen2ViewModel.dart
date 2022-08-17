import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:four_deals_shopping/Models/CountryListModel.dart';
import 'package:four_deals_shopping/Models/HorDealsListModel.dart';
import 'package:http/io_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class SplashScreenTwoViewModel extends BaseViewModel {
  List<CountryListModel> countrylist = [];
  late List<DropdownMenuItem> _dropdownTestItemss = [];
  var _selectedTest;

  Future<List<CountryListModel>> fetchhotdeals() async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);
    final queryParameters = {
      "country": "KW",
    };

    final uri = Uri.parse('http://test.aswaag.net/api/app/country-list');

    // Uri url = Uri.parse("${baseurl.baseurl}/app/sales-list");
    // url.replace(queryParameters: queryParameters);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response = await ioClient.get(
      uri,
      headers: {
        "app-lang": "1",
        "device-type": "2",
        HttpHeaders.contentTypeHeader: "application/json"
      },
    );
    var jsonData = json.decode(response.body);

    var status = jsonData["status"];
    var data = jsonData["data"];

    if (status == "success") {
      var peoplelist = data.cast<Map<String, dynamic>>();
      print("DATAA${data}");
      notifyListeners();

      _dropdownTestItemss = buildDropdownTestItems(data);
      countrylist = peoplelist
          .map<CountryListModel>((json) => CountryListModel.fromJson(json))
          .toList();
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(backgroundColor: Color(0xffFF4D4E), content: Text(message)));
    }

    return countrylist;
  }

  onChangeDropdownTests(selectedTest) {
    print(selectedTest);
    _selectedTest = selectedTest;
    notifyListeners();
  }

  List<DropdownMenuItem> buildDropdownTestItems(List _testList) {
    List<DropdownMenuItem> items = [];
    for (var i in _testList) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(i['name']),
        ),
      );
    }
    return items;
  }
}
