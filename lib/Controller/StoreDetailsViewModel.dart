import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:four_deals_shopping/Models/RattingListModel.dart';
import 'package:four_deals_shopping/Models/StoreCartListModel.dart';
import 'package:four_deals_shopping/Models/StoreDetailsProductModel.dart';
import 'package:four_deals_shopping/Screens/StoreCheckoutWebView.dart';
import 'package:http/io_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class ProductDetailsViewModel extends BaseViewModel {
  late String storename = "";
  late String description = "";
  late String logoimage = "";
  late String bannerimage = "";
  late String owenerimage = "";
  late String storeid = "";
  late String mobile = "";
  late String location = "";
  List<StoreCartListModel> cartlist = [];

  List<StoreDetailsListModel> storeproducts = [];

  List<StoreCartListModel> storecartslist = [];
  List<RattingListModel> ratinglist = [];

  Future<http.Response> fetchstoredetails(String storeid) async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    //final response = await http.post('$url', // Previous Code
    var url = Uri.parse(
        'http://test.aswaag.net/api/app/store-profile?storeId=${storeid}');

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

      this.storename = data1["storeName"];
      this.description = data1["description"].toString();
      this.logoimage =
          "https://aswagbuckets3.s3.me-south-1.amazonaws.com/${data1["logoImage"].toString()}";
      this.bannerimage =
          "https://aswagbuckets3.s3.me-south-1.amazonaws.com/${data1["bannerImage"].toString()}";
      this.mobile = data1["mobile"];
      this.location = data1["location"];
    } else {}

    return response;
  }

  Future<List<StoreDetailsListModel>> fetchstoreproducts(String storeid) async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final queryParameters = {"storeId": storeid, "pageNumber": "1"};

    final uri = Uri.http(
        '${"test.aswaag.net"}', '/api/app/store/product-list', queryParameters);

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

      storeproducts = peoplelist
          .map<StoreDetailsListModel>(
              (json) => StoreDetailsListModel.fromJson(json))
          .toList();
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(backgroundColor: Color(0xffFF4D4E), content: Text(message)));
    }

    return storeproducts;
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
    } else {}

    return response;
  }

  Future<http.Response> addtocart(String adid, String storeid, String qunatity,
      BuildContext context) async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    //final response = await http.post('$url', // Previous Code
    var url = Uri.parse('http://test.aswaag.net/api/app/store/cart');

    final response = await ioClient.post(url,
        headers: {
          "app-lang": prefs.getString("Language").toString(),
          "device-type": "2",
          "Content-Type": 'application/json; charset=UTF-8',
          "x-auth-token": prefs.getString("token").toString(),
        },
        body: jsonEncode({
          "adId": adid,
          "storeId": storeid,
          "quantity": qunatity,
        }));
    var jsonData = json.decode(response.body);

    print(jsonData);

    // var message = jsonData["message"];
    var status = jsonData["status"];
    var data = jsonData["data"];

    if (status == "success") {
      print("DONE");
    } else {}

    return response;
  }

  Future<List<StoreCartListModel>> fetchstorecartlist(String storeid) async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final queryParameters = {
      "storeId": storeid,
    };

    final uri = Uri.http(
        '${"test.aswaag.net"}', '/api/app/store/cart', queryParameters);

    // Uri url = Uri.parse("${baseurl.baseurl}/app/sales-list");
    // url.replace(queryParameters: queryParameters);

    final response = await ioClient.get(
      uri,
      headers: {
        "app-lang": prefs.getString("Language").toString(),
        "device-type": "2",
        HttpHeaders.contentTypeHeader: "application/json",
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

      storecartslist = peoplelist
          .map<StoreCartListModel>((json) => StoreCartListModel.fromJson(json))
          .toList();

      cartlist = peoplelist
          .map<StoreCartListModel>((json) => StoreCartListModel.fromJson(json))
          .toList();
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(backgroundColor: Color(0xffFF4D4E), content: Text(message)));
    }

    return storecartslist;
  }

  Future<http.Response> deletecart(
      String cartid, String storeid, BuildContext context) async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    //final response = await http.post('$url', // Previous Code
    var url = Uri.parse('http://test.aswaag.net/api/app/store/cart/${cartid}');

    final response = await ioClient.delete(
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

    if (status == "success") {
      notifyListeners();
      fetchstorecartlist(storeid);
    } else {}

    return response;
  }

  Future<http.Response> updatecart(
      String cartid, int quantity, BuildContext context, String storeid) async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    //final response = await http.post('$url', // Previous Code
    var url = Uri.parse('http://test.aswaag.net/api/app/store/cart/${cartid}');

    final response = await ioClient.put(url,
        headers: {
          "app-lang": prefs.getString("Language").toString(),
          "device-type": "2",
          "Content-Type": 'application/json; charset=UTF-8',
          "x-auth-token": prefs.getString("token").toString(),
        },
        body: jsonEncode({
          "quantity": quantity.toString(),
        }));
    var jsonData = json.decode(response.body);

    print(jsonData);

    // var message = jsonData["message"];
    var status = jsonData["status"];
    var data = jsonData["data"];

    if (status == "success") {
      print("DONE");
      notifyListeners();
      fetchstorecartlist(storeid);
    } else {}

    return response;
  }

  Future<http.Response> reportads(String storid, String ratting, String comment,
      BuildContext context) async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    //final response = await http.post('$url', // Previous Code
    var url = Uri.parse('http://test.aswaag.net/api/app/store/rating');

    final response = await ioClient.post(url,
        headers: {
          "app-lang": prefs.getString("Language").toString(),
          "device-type": "2",
          "Content-Type": 'application/json; charset=UTF-8',
          "x-auth-token": prefs.getString("token").toString(),
        },
        body: jsonEncode(
            {"rating": ratting, "storeId": storid, "comment": comment}));
    var jsonData = json.decode(response.body);

    print(jsonData);

    // var message = jsonData["message"];
    var status = jsonData["status"];
    var data = jsonData["data"];

    if (status == "success") {
      print("DONE");
    } else {}

    return response;
  }

  Future<List<RattingListModel>> fetchrattings(String storeid) async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final queryParameters = {
      "storeId": storeid,
    };

    final uri =
        Uri.parse("http://test.aswaag.net/api/app/store/rating-breakdown/${1}");

    // Uri url = Uri.parse("${baseurl.baseurl}/app/sales-list");
    // url.replace(queryParameters: queryParameters);

    final response = await ioClient.get(
      uri,
      headers: {
        "app-lang": prefs.getString("Language").toString(),
        "device-type": "2",
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    var jsonData = json.decode(response.body);

    var status = jsonData["status"];
    var data = jsonData["data"];

    if (status == "success") {
      var peoplelist = data["data"].cast<Map<String, dynamic>>();
      print("DATAA${data}");
      notifyListeners();

      ratinglist = peoplelist
          .map<RattingListModel>((json) => RattingListModel.fromJson(json))
          .toList();
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(backgroundColor: Color(0xffFF4D4E), content: Text(message)));
    }

    return ratinglist;
  }

  Future<http.Response> checkoutcart(
      String deleverycost,
      String paidamount,
      String totalamount,
      String Paymentmethod,
      String useraddressid,
      List<StoreCartListModel> cartlists,
      BuildContext context) async {
    bool trustSelfSigned = true;

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    //final response = await http.post('$url', // Previous Code
    var url = Uri.parse('http://test.aswaag.net/api/app/store/checkout');

    StoreCartListModel storecartlist;

    final response = await ioClient.post(url,
        headers: {
          "app-lang": prefs.getString("Language").toString(),
          "device-type": "2",
          "Content-Type": 'application/json; charset=UTF-8',
          "x-auth-token": prefs.getString("token").toString(),
        },
        body: jsonEncode({
          "deliveryCost": deleverycost,
          "paidAmount": paidamount,
          "totalAmount": totalamount,
          "paymentMethod": Paymentmethod,
          "userAddressId": useraddressid,
          "cartItem": cartlist,
          // "cartItem": [
          //   {
          //     "cartId": 17,
          //     "adId": 5,
          //     "quantity": 1,
          //     "storeId": "1",
          //     "adTitle": "iphone 11",
          //     "amount": "290.000",
          //     "ds": "1550"
          //   }
          // ],
        }));
    var jsonData = json.decode(response.body);

    // var message = jsonData["message"];
    var status = jsonData["status"];
    var data = jsonData["data"];

    if (status == "success") {
      print(data["paymentUrl"]);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => StoreCheckoutWebview(data["paymentUrl"])));
    } else {}

    return response;
  }
}
