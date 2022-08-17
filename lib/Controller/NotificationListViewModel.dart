import 'dart:convert';
import 'dart:io';

import 'package:four_deals_shopping/Models/NotificationListModel.dart';
import 'package:http/io_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class NotificationListViewModel extends BaseViewModel {
  List<NotificationListModel> notificationlist = [];

  Future<List<NotificationListModel>> fetchnotificationlist() async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final queryParameters = {
      "userId": "1",
    };

    final uri = Uri.http(
        '${"test.aswaag.net"}', '/api/app/notification-list', queryParameters);

    final response = await ioClient.get(
      uri,
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

      notificationlist = peoplelist
          .map<NotificationListModel>(
              (json) => NotificationListModel.fromJson(json))
          .toList();
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(backgroundColor: Color(0xffFF4D4E), content: Text(message)));
    }

    return notificationlist;
  }
}
