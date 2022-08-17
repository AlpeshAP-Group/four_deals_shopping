import 'dart:convert';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:four_deals_shopping/Models/AdsBannerModel.dart';
import 'package:four_deals_shopping/Models/HorDealsListModel.dart';
import 'package:four_deals_shopping/Models/StoresListModel.dart';
import 'package:four_deals_shopping/Utils/BaseUrl.dart';
import 'package:http/io_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import '../Models/GetCategoryModel.dart';

import 'package:http/http.dart' as http;

import '../main.dart';

class HomeFragmentViewModel extends BaseViewModel {
  List<GetCategoryModel> categorylist = [];
  List<AdsBannerModel> adsbannerlist = [];
  List<HotDealsModel> hotdealslist = [];

  List<StoresListModel> storelists = [];

  List<GetCategoryModel> get catlist => categorylist;

  BaseUrl baseurl = new BaseUrl();

  late String Token = "";

  late String name = "";
  late String followers = "";
  late String following = "";
  late String userid = "";
  late String username = "";
  late String userimage = "";
  Future<http.Response> fetchmyprofile() async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    //final response = await http.post('$url', // Previous Code
    var url = Uri.parse('http://test.aswaag.net/api/auth/user-profile');

    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response = await ioClient.get(
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
    var data1 = data["data"];

    if (status == "success") {
      notifyListeners();

      this.name = data1["firstName"];
      this.followers = data1["totalFollower"].toString();
      this.following = data1["totalFollowing"].toString();
      this.userid = data1["userId"].toString();
      this.userimage = data1["profileImage"].toString();

      firebaseCloudMessaging_Listeners(data1["userId"].toString());

      prefs.setString("UserId", data1["userId"].toString());
      prefs.setString("UserName", data1["firstName"]);
      prefs.setString("UserImage", data1["profileImage"]);
    } else {}

    return response;
  }

  Future<List<GetCategoryModel>> fetchstatelist() async {
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

  Future<List<AdsBannerModel>> fetchbannerads() async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);
    final queryParameters = {
      "userId": "1",
    };

    final uri =
        Uri.http('${"test.aswaag.net"}', '/api/app/banner/ad', queryParameters);

    // Uri url = Uri.parse("${baseurl.baseurl}/app/sales-list");
    // url.replace(queryParameters: queryParameters);

    SharedPreferences prefs = await SharedPreferences.getInstance();

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

      adsbannerlist = peoplelist
          .map<AdsBannerModel>((json) => AdsBannerModel.fromJson(json))
          .toList();
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(backgroundColor: Color(0xffFF4D4E), content: Text(message)));
    }

    return adsbannerlist;
  }

  Future<List<StoresListModel>> fetchstorelist() async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final queryParameters = {
      "country": prefs.getString("CuntryISO").toString(),
      "pageNumber": "1"
    };

    final uri =
        Uri.http('${"test.aswaag.net"}', '/api/app/store', queryParameters);

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

      storelists = peoplelist
          .map<StoresListModel>((json) => StoresListModel.fromJson(json))
          .toList();
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(backgroundColor: Color(0xffFF4D4E), content: Text(message)));
    }

    return storelists;
  }

  Future<List<HotDealsModel>> fetchhotdeals() async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);
    final queryParameters = {
      "country": "KW",
    };

    final uri =
        Uri.http('${"test.aswaag.net"}', '/api/app/hot-deals', queryParameters);

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
      var peoplelist = data["data"].cast<Map<String, dynamic>>();
      print("DATAA${data}");
      notifyListeners();

      hotdealslist = peoplelist
          .map<HotDealsModel>((json) => HotDealsModel.fromJson(json))
          .toList();
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(backgroundColor: Color(0xffFF4D4E), content: Text(message)));
    }

    return hotdealslist;
  }

  void firebaseCloudMessaging_Listeners(String UserId) {
    Firebase.initializeApp().whenComplete(() {
      FirebaseMessaging.instance.getToken().then((value) {
        notifyListeners();

        Token = value!;
        print(Token);

        if (Token.isNotEmpty) {
          savetokentofirebase(UserId, value);
          SaveToken(value, UserId);
        }
      });
    });
  }

  void savetokentofirebase(String userid, String token) {
    var _firebaseRef2 = FirebaseDatabase.instance.reference().child("Token");
    _firebaseRef2.child(userid.toString()).child('Token').set(token);
  }

  Future<http.Response> SaveToken(String token, String userid) async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    //final response = await http.post('$url', // Previous Code
    var url = Uri.parse('http://test.aswaag.net/api/auth/device-token');

    final response = await ioClient.post(url,
        headers: {
          "app-lang": "1",
          "device-type": "2",
          "Content-Type": 'application/json; charset=UTF-8'
        },
        body: jsonEncode({
          "deviceId": "Vivo",
          "token": token,
          "userId": userid,
          "appName": "USER",
        }));
    var jsonData = json.decode(response.body);

    print(jsonData);

    // var message = jsonData["message"];
    var status = jsonData["status"];
    var data = jsonData["data"];

    if (status == "success") {
      print("TOKENS${token}");
    } else {}

    return response;
  }

  Future<void> getdataorsharedpref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    userid = prefs.getString("UserId").toString();
    username = prefs.getString("UserName").toString();
    userimage = prefs.getString("UserImage").toString();

    print("MyUSERIDPREF${userid}");
  }

  void getfirebase() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification!.android;

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(channel.id, channel.name,
                    color: Colors.blue,
                    playSound: true,
                    channelShowBadge: true,
                    groupAlertBehavior: GroupAlertBehavior.all,
                    icon: '@mipmap/ic_launcher')));
      }
    });
  }
}
