import 'dart:convert';
import 'dart:io';

import 'package:four_deals_shopping/Models/SubCategoryListMOdel.dart';
import 'package:four_deals_shopping/Models/SubCategoryVarientList.dart';
import 'package:http/io_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class CategoryDetailsViewModel extends BaseViewModel {
  List<SubCategoryListModel> subcategorylist = [];
  List<SubCategoryVarientListModel> subvarientlist = [];

  List<SubCategoryVarientListModel> get subvarientlists => subvarientlist;

  late String brandname = "";

  Future<List<SubCategoryListModel>> fetchsubcategory(String catid) async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);
    final queryParameters = {"parentCategoryId": catid};
    SharedPreferences prefs = await SharedPreferences.getInstance();

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

      print("categorruidss${subcategorylist[0].subcat}");

      brandname = subcategorylist[0].catname;

      fetchsubcategoryvarientslist(subcategorylist[0].subcat.toString());
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(backgroundColor: Color(0xffFF4D4E), content: Text(message)));
    }

    return subcategorylist;
  }

  Future<List<SubCategoryVarientListModel>> fetchsubcategoryvarientslist(
      String subcatid) async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Uri uri = Uri.parse(
        "http://test.aswaag.net/api/app/subcategory/${subcatid}/variant");

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
      var data1 = data["data"];
      var peoplelist = data1["variantList"].cast<Map<String, dynamic>>();
      print("DATAA${data}");
      notifyListeners();

      subvarientlist = peoplelist
          .map<SubCategoryVarientListModel>(
              (json) => SubCategoryVarientListModel.fromJson(json))
          .toList();
    } else {
      notifyListeners();
      subvarientlist = [];
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(backgroundColor: Color(0xffFF4D4E), content: Text(message)));
    }

    return subvarientlist;
  }
}
