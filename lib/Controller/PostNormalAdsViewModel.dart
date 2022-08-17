import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:four_deals_shopping/Models/GetCategoryModel.dart';
import 'package:four_deals_shopping/Models/SubCategoryListMOdel.dart';
import 'package:four_deals_shopping/Models/getallsubcategoryvariantsmodel.dart';
import 'package:four_deals_shopping/Screens/DashboardScreen.dart';
import 'package:four_deals_shopping/Screens/Fragments/HomeFragment.dart';
import 'package:four_deals_shopping/Utils/BaseUrl.dart';
import 'package:http/io_client.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class PostNormalAdsViewModel extends BaseViewModel {
  BaseUrl baseurl = new BaseUrl();

  List<GetCategoryModel> categorylist = [];
  List<SubCategoryListModel> subcategorylist = [];
  List<GetVariantOfSubcategoryModel> subcatvariants = [];
  Future<List<GetCategoryModel>> getcategpry() async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var url = Uri.parse("${baseurl.baseurl}app/category");

    final response = await ioClient.get(
      url,
      headers: {
        "app-lang": prefs.getString("Language").toString(),
        "device-type": "2",
        "Content-Type": 'application/json; charset=UTF-8'
      },
    );
    var jsonData = json.decode(response.body);

    var status = jsonData["status"];
    var data = jsonData["data"];

    if (status == "success") {
      var peoplelist = data["data"].cast<Map<String, dynamic>>();
      print("DATAA${peoplelist}");
      notifyListeners();

      categorylist = peoplelist
          .map<GetCategoryModel>((json) => GetCategoryModel.fromJson(json))
          .toList();
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(backgroundColor: Color(0xffFF4D4E), content: Text(message)));
    }

    return categorylist;
  }

  Future<List<SubCategoryListModel>> fetchsubcategory(String catid) async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final queryParameters = {"parentCategoryId": catid};

    final uri =
        Uri.http('${"test.aswaag.net"}', '/api/app/category', queryParameters);

    // Uri url = Uri.parse("${baseurl.baseurl}/app/sales-list");
    // url.replace(queryParameters: queryParameters);

    final response = await ioClient.get(
      uri,
      headers: {
        "app-lang": prefs.getString("Language").toString(),
        "device-type": "2",
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

      subcategorylist = peoplelist
          .map<SubCategoryListModel>(
              (json) => SubCategoryListModel.fromJson(json))
          .toList();
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(backgroundColor: Color(0xffFF4D4E), content: Text(message)));
    }

    return subcategorylist;
  }

  Future<List<GetVariantOfSubcategoryModel>> getsubcategoryvariants() async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Uri.parse(
        "http://test.aswaag.net/api/app/subcategory/${36}/all-variant");

    final response = await ioClient.get(
      url,
      headers: {
        "app-lang": prefs.getString("Language").toString(),
        "device-type": "2",
        "Content-Type": 'application/json; charset=UTF-8'
      },
    );
    var jsonData = json.decode(response.body);

    var status = jsonData["status"];
    var data = jsonData["data"];

    if (status == "success") {
      var peoplelist = data["data"].cast<Map<String, dynamic>>();
      print("DATAA${peoplelist}");
      notifyListeners();

      subcatvariants = peoplelist
          .map<GetVariantOfSubcategoryModel>(
              (json) => GetVariantOfSubcategoryModel.fromJson(json))
          .toList();
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(backgroundColor: Color(0xffFF4D4E), content: Text(message)));
    }

    return subcatvariants;
  }

  Future<void> postnormalads(
      String title,
      String description,
      String sellingprice,
      String catid,
      String subcatid,
      XFile thumnaililage,
      XFile image,
      List variantgroup,
      String name,
      String number,
      BuildContext context) async {
    bool trustSelfSigned = true;
    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final uri = Uri.parse("http://test.aswaag.net/api/app/post/normal/ad");

    Map<String, String> headers = {
      "app-lang": prefs.getString("Language").toString(),
      "device-type": "2",
      "x-auth-token": prefs.getString("token").toString(),
    };

    var request = http.MultipartRequest(
      'POST',
      uri,
    );
    request.headers.addAll(headers);
    request.fields['title'] = title;
    request.fields['description'] = description;
    request.fields['sellingPrice'] = sellingprice;
    request.fields['categoryId'] = catid;
    request.fields['subCategoryId'] = subcatid;
    request.fields['variationGroup'] = variantgroup.toString();
    request.fields['name'] = name.toString();
    request.fields['mobile'] = number.toString();

    var image1 =
        await http.MultipartFile.fromPath("thumbnailImage", thumnaililage.path);
    var image2 = await http.MultipartFile.fromPath("image", image.path);

    request.files.add(image1);
    request.files.add(image2);

    var response = await ioClient.send(request);
    var responseData = await response.stream.toBytes();

    var responseString = String.fromCharCodes(responseData);

    var d = jsonDecode(responseString);
    if (response.statusCode == 200) {
      print("DONE");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => DashboardScreen()));
    } else {
      print(d);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color(0xff2696CC), content: Text(d.toString())));
    }
  }
}
