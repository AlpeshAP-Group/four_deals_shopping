import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:four_deals_shopping/Screens/CreateStoreUI/MyStoreScreen.dart';
import 'package:http/io_client.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class CreateStoreViewModel extends BaseViewModel {
  Future createstore(
      String catorecatid,
      String storename,
      String storedescrip,
      String lat,
      String long,
      String address,
      String location,
      XFile logo,
      XFile banner,
      BuildContext context) async {
    bool trustSelfSigned = true;
    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final uri = Uri.parse("http://test.aswaag.net/api/app/store");

    Map<String, String> headers = {
      "app-lang": prefs.getString("Language").toString(),
      "device-type": "2",
      "x-auth-token": prefs.getString("token").toString(),
      "Content-Type": "multipart/form-data"
    };

    var request = http.MultipartRequest(
      'POST',
      uri,
    );
    request.headers.addAll(headers);
    request.fields['storeCategoryIds'] = ["1", "2"].toString();
    request.fields['storeName'] = storename;
    request.fields['storeDescription'] = storedescrip;
    request.fields['latitude'] = lat;
    request.fields['longitude'] = long;
    request.fields['address'] = address;
    request.fields['location'] = location;

    var image = await http.MultipartFile.fromPath("logoImage", logo.path);

    var banners = await http.MultipartFile.fromPath("bannerImage", banner.path);

    request.files.add(image);
    request.files.add(banners);

    var response = await ioClient.send(request);
    var responseData = await response.stream.toBytes();

    var responseString = String.fromCharCodes(responseData);

    var d = jsonDecode(responseString);
    if (response.statusCode == 200) {
      print("DONE");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyStoreSCreen()));
    } else {
      print(d);
      print(banner.path);
    }
  }
}
