import 'dart:convert';
import 'dart:io';

import 'package:four_deals_shopping/Models/VariantProductListModel.dart';
import 'package:http/io_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class VariantProductDetails extends BaseViewModel {
  List<VariantProductListModel> variantproductlist = [];

  Future<List<VariantProductListModel>> fetchvariantproduct(
      String catid, String subcateid) async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var url = Uri.parse('${"http://test.aswaag.net/api/"}app/normal/ad');

    // Uri url = Uri.parse("${baseurl.baseurl}/app/sales-list");
    // url.replace(queryParameters: queryParameters);

    final response = await ioClient.post(url,
        headers: {
          "app-lang": prefs.getString("Language").toString(),
          "device-type": "2",
          HttpHeaders.contentTypeHeader: "application/json"
        },
        body: jsonEncode({
          "categoryId": catid,
          "subCategoryId": subcateid,
          "variantListId": "",
          "country": "KW",
          "pageNumber": "1",
          "minimumSellingPrice": "",
          "maximumSellingPrice": "",
          "sortColumn": "sellingPrice",
          "sortDirection": ""
        }));
    var jsonData = json.decode(response.body);

    var status = jsonData["status"];
    var data = jsonData["data"];

    if (status == "success") {
      var peoplelist = data["data"].cast<Map<String, dynamic>>();
      print("DATAA${data}");
      notifyListeners();

      variantproductlist = peoplelist
          .map<VariantProductListModel>(
              (json) => VariantProductListModel.fromJson(json))
          .toList();
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(backgroundColor: Color(0xffFF4D4E), content: Text(message)));
    }

    return variantproductlist;
  }
}
