import 'dart:convert';
import 'dart:io';

import 'package:four_deals_shopping/Models/DriverQuatationListModel.dart';
import 'package:http/io_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class DriverQuatationListViewModel extends BaseViewModel {
  List<DriverQuatationListModel> driverquatation = [];

  Future<List<DriverQuatationListModel>> fetchcurrentorder(
      String orderid) async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);
    final queryParameters = {"storeId": "1", "pageNumber": "1"};

    // final uri = Uri.http(
    //     '${"test.aswaag.net"}', 'app/store/order-list', queryParameters);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    Uri url = Uri.parse(
        "http://test.aswaag.net/api/driver/order/quotation?orderId=${orderid}");
    // url.replace(queryParameters: queryParameters);

    final response = await ioClient.get(
      url,
      headers: {
        "app-lang": prefs.getString("Language").toString(),
        "device-type": "2",
        // "x-auth-token": prefs.getString("token").toString(),
        "Content-Type": 'application/json; charset=UTF-8',
        "x-auth-token": prefs.getString("token").toString(),
      },
    );
    var jsonData = json.decode(response.body);

    var status = jsonData["status"];
    var data = jsonData["data"];
    var data1 = data["data"];

    if (status == "success") {
      var peoplelist = data1["quotationList"].cast<Map<String, dynamic>>();
      print("DATAA${data}");
      notifyListeners();

      driverquatation = peoplelist
          .map<DriverQuatationListModel>(
              (json) => DriverQuatationListModel.fromJson(json))
          .toList();
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(backgroundColor: Color(0xffFF4D4E), content: Text(message)));
    }

    return driverquatation;
  }
}
