import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:four_deals_shopping/Models/FollowingListModel.dart';
import 'package:http/io_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import 'package:http/http.dart' as http;

class FollowingListViewModel extends BaseViewModel {
  List<FollowingListModel> followinglist = [];

  Future<List<FollowingListModel>> fetchfollowinglist(String type) async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final queryParameters = {"followType": type};

    final uri = Uri.http(
        '${"test.aswaag.net"}', '/api/app/user/follow', queryParameters);

    final response = await ioClient.get(
      uri,
      headers: {
        "app-lang": prefs.getString("Language").toString(),
        "device-type": "2",
        HttpHeaders.contentTypeHeader: "application/json",
        // "x-auth-token": prefs.getString("token").toString(),
        "x-auth-token": prefs.getString("token").toString(),
      },
    );
    var jsonData = json.decode(response.body);

    var status = jsonData["status"];
    var data = jsonData["data"];

    if (status == "success") {
      var peoplelist = data["data"].cast<Map<String, dynamic>>();
      print("DATAA${data}");
      notifyListeners();

      followinglist = peoplelist
          .map<FollowingListModel>((json) => FollowingListModel.fromJson(json))
          .toList();
    } else {
      followinglist = [];
      notifyListeners();
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(backgroundColor: Color(0xffFF4D4E), content: Text(message)));
    }

    return followinglist;
  }

  Future<http.Response> followuser(
      String ownerid, String actions, BuildContext context) async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    //final response = await http.post('$url', // Previous Code
    var url = Uri.parse('http://test.aswaag.net/api/app/user/follow');

    final response = await ioClient.post(url,
        headers: {
          "app-lang": prefs.getString("Language").toString(),
          "device-type": "2",
          "Content-Type": 'application/json; charset=UTF-8',
          "x-auth-token": prefs.getString("token").toString(),
        },
        body: jsonEncode({
          "followingUserId": ownerid,
          "action": actions,
        }));
    var jsonData = json.decode(response.body);

    print(jsonData);

    // var message = jsonData["message"];
    var status = jsonData["status"];
    var data = jsonData["data"];

    if (status == "success") {
      print("DONE");
      fetchfollowinglist("FOLLOWING");
    } else {}

    return response;
  }

  Future<http.Response> unfollowuser(
      String ownerid, BuildContext context) async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    //final response = await http.post('$url', // Previous Code
    var url = Uri.parse('http://test.aswaag.net/api/app/user/remove-follower');

    final response = await ioClient.post(url,
        headers: {
          "app-lang": prefs.getString("Language").toString(),
          "device-type": "2",
          "Content-Type": 'application/json; charset=UTF-8',
          // "x-auth-token": prefs.getString("token").toString(),
          "x-auth-token": prefs.getString("token").toString(),
        },
        body: jsonEncode({
          "followerUserId": ownerid,
        }));
    var jsonData = json.decode(response.body);

    print(jsonData);

    // var message = jsonData["message"];
    var status = jsonData["status"];
    var data = jsonData["data"];

    if (status == "success") {
      print("DONE");
      fetchfollowinglist("FOLLOWING");
      fetchfollowinglist("FOLLOWER");
    } else {}

    return response;
  }
}
