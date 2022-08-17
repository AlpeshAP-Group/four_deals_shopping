import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:four_deals_shopping/Screens/CreateStoreUI/MyStoreScreen.dart';
import 'package:four_deals_shopping/Screens/Fragments/HomeFragment.dart';
import 'package:http/io_client.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class PostBannerViewwModel extends BaseViewModel {
  Future<void> postbanner(String title, String description, String redirecttype,
      String redirectvalue, String bannerimage, BuildContext context) async {
    bool trustSelfSigned = true;
    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final uri = Uri.parse("http://test.aswaag.net/api/app/post/banner/ad");

    Map<String, String> headers = {
      "app-lang": prefs.getString("Language").toString(),
      "device-type": "2",
      "x-auth-token": prefs.getString("token").toString(),
      "Content-Type": "application/json"
    };

    var request = http.MultipartRequest(
      'POST',
      uri,
    );
    request.headers.addAll(headers);
    request.fields['title'] = title;
    request.fields['description'] = description;
    request.fields['redirectType'] = redirecttype;
    request.fields['redirectValue'] = redirectvalue;

    var image = await http.MultipartFile.fromPath("bannerImage", bannerimage);

    request.files.add(image);

    var response = await ioClient.send(request);
    var responseData = await response.stream.toBytes();

    var responseString = String.fromCharCodes(responseData);

    var d = jsonDecode(responseString);
    if (response.statusCode == 200) {
      print("DONE");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeFragment(0)));
    } else {
      print(d);
    }
  }
}
