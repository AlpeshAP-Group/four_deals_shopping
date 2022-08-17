import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_deals_shopping/Screens/DashboardScreen.dart';
import 'package:image_picker/image_picker.dart';

class PostMyAdsScreen extends StatefulWidget {
  @override
  State<PostMyAdsScreen> createState() => PostMyAdsScreenStateState();
}

class PostMyAdsScreenStateState extends State<PostMyAdsScreen> {
  final seacrh = TextEditingController();
  late String searchs;
  final description = TextEditingController();
  late String descriptions;
  final price = TextEditingController();
  late String prices;

  final username = TextEditingController();
  late String usernames;

  final mobile = TextEditingController();
  late String mobiles;

  final email = TextEditingController();
  late String emails;

  final location = TextEditingController();
  late String locations;

  late String? imagepath = "";
  late String? imagepath2 = "";
  late String? imagepath3 = "";
  late String? imagepath4 = "";

  PickedFile? imageFile = null;
  PickedFile? imageFile2 = null;
  PickedFile? imageFile3 = null;
  PickedFile? imageFile4 = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF6F6F6),
        elevation: 1,
        titleSpacing: 0,
        title: Text(
          "Add Post",
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 45,
              color: Colors.black),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 15),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              title: Text(
                                "Choose Options",
                                textAlign: TextAlign.center,
                              ),
                              actions: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(bottom: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () {
                                            _openCamera(context);
                                            Navigator.of(ctx).pop();
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 100,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      Color(0xff960E7A),
                                                      Color(0xffFD3E40)
                                                    ])),
                                            child: Text(
                                              "Camera",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            _openGallary(context);
                                            Navigator.of(ctx).pop();
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            margin: EdgeInsets.only(left: 10),
                                            width: 100,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      Color(0xff960E7A),
                                                      Color(0xffFD3E40)
                                                    ])),
                                            child: Text(
                                              "Gallery",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                      ],
                                    ))
                              ],
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 7),
                          height: MediaQuery.of(context).size.height / 5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              //background color of box
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 0.5, // soften the shadow
                                spreadRadius: 0.5, //extend the shadow
                                offset: Offset(
                                  0.0, // Move to right 10  horizontally
                                  0.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ],
                          ),
                          child: (imagepath == "")
                              ? Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                15,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                7,
                                        child: SvgPicture.asset(
                                          "assets/images/addframeiconspost.svg",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 7),
                                        child: Text(
                                          "Add Frame",
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  50,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : Container(
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                          image: FileImage(
                                              File(imageFile!.path)))),
                                ),
                        )),
                  ),
                  Expanded(
                    child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              title: Text(
                                "Choose Options",
                                textAlign: TextAlign.center,
                              ),
                              actions: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(bottom: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () {
                                            _openCamera2(context);
                                            Navigator.of(ctx).pop();
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 100,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      Color(0xff960E7A),
                                                      Color(0xffFD3E40)
                                                    ])),
                                            child: Text(
                                              "Camera",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            _openGallary2(context);
                                            Navigator.of(ctx).pop();
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            margin: EdgeInsets.only(left: 10),
                                            width: 100,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      Color(0xff960E7A),
                                                      Color(0xffFD3E40)
                                                    ])),
                                            child: Text(
                                              "Gallery",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                      ],
                                    ))
                              ],
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 7),
                          height: MediaQuery.of(context).size.height / 5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              //background color of box
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 0.5, // soften the shadow
                                spreadRadius: 0.5, //extend the shadow
                                offset: Offset(
                                  0.0, // Move to right 10  horizontally
                                  0.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ],
                          ),
                          child: (imagepath2 == "")
                              ? Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                15,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                7,
                                        child: SvgPicture.asset(
                                          "assets/images/addphotoiconss.svg",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 7),
                                        child: Text(
                                          "Add Photo",
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  50,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : Container(
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                          image: FileImage(
                                              File(imageFile2!.path)))),
                                ),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 14),
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width / 4,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0))),
                                      title: Text(
                                        "Choose Options",
                                        textAlign: TextAlign.center,
                                      ),
                                      actions: <Widget>[
                                        Container(
                                            margin: EdgeInsets.only(bottom: 15),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                GestureDetector(
                                                  onTap: () {
                                                    _openCamera3(context);
                                                    Navigator.of(ctx).pop();
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    width: 100,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        gradient: LinearGradient(
                                                            begin: Alignment
                                                                .topCenter,
                                                            end: Alignment
                                                                .bottomCenter,
                                                            colors: [
                                                              Color(0xff960E7A),
                                                              Color(0xffFD3E40)
                                                            ])),
                                                    child: Text(
                                                      "Camera",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    _openGallary3(context);
                                                    Navigator.of(ctx).pop();
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    margin: EdgeInsets.only(
                                                        left: 10),
                                                    width: 100,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        gradient: LinearGradient(
                                                            begin: Alignment
                                                                .topCenter,
                                                            end: Alignment
                                                                .bottomCenter,
                                                            colors: [
                                                              Color(0xff960E7A),
                                                              Color(0xffFD3E40)
                                                            ])),
                                                    child: Text(
                                                      "Gallery",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ))
                                      ],
                                    ),
                                  );
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.only(bottom: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      //background color of box
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        blurRadius: 0.5, // soften the shadow
                                        spreadRadius: 0.5, //extend the shadow
                                        offset: Offset(
                                          0.0, // Move to right 10  horizontally
                                          0.0, // Move to bottom 10 Vertically
                                        ),
                                      )
                                    ],
                                  ),
                                  child: (imagepath3 == "")
                                      ? Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    27,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    15,
                                                child: SvgPicture.asset(
                                                  "assets/images/addimageblackicons.svg",
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 3),
                                                child: Text(
                                                  "Add more photo",
                                                  style: TextStyle(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              80,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      : Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              5,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              image: DecorationImage(
                                                  image: FileImage(
                                                      File(imageFile3!.path)))),
                                        ),
                                )),
                          ),
                          Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0))),
                                      title: Text(
                                        "Choose Options",
                                        textAlign: TextAlign.center,
                                      ),
                                      actions: <Widget>[
                                        Container(
                                            margin: EdgeInsets.only(bottom: 15),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                GestureDetector(
                                                  onTap: () {
                                                    _openCamera4(context);
                                                    Navigator.of(ctx).pop();
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    width: 100,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        gradient: LinearGradient(
                                                            begin: Alignment
                                                                .topCenter,
                                                            end: Alignment
                                                                .bottomCenter,
                                                            colors: [
                                                              Color(0xff960E7A),
                                                              Color(0xffFD3E40)
                                                            ])),
                                                    child: Text(
                                                      "Camera",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    _openGallary4(context);
                                                    Navigator.of(ctx).pop();
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    margin: EdgeInsets.only(
                                                        left: 10),
                                                    width: 100,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        gradient: LinearGradient(
                                                            begin: Alignment
                                                                .topCenter,
                                                            end: Alignment
                                                                .bottomCenter,
                                                            colors: [
                                                              Color(0xff960E7A),
                                                              Color(0xffFD3E40)
                                                            ])),
                                                    child: Text(
                                                      "Gallery",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ))
                                      ],
                                    ),
                                  );
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.only(top: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      //background color of box
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        blurRadius: 0.5, // soften the shadow
                                        spreadRadius: 0.5, //extend the shadow
                                        offset: Offset(
                                          0.0, // Move to right 10  horizontally
                                          0.0, // Move to bottom 10 Vertically
                                        ),
                                      )
                                    ],
                                  ),
                                  child: (imagepath4 == "")
                                      ? Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    27,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    15,
                                                child: SvgPicture.asset(
                                                  "assets/images/addimageblackicons.svg",
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 3),
                                                child: Text(
                                                  "Add more photo",
                                                  style: TextStyle(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              80,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      : Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              5,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              image: DecorationImage(
                                                  image: FileImage(
                                                      File(imageFile4!.path)))),
                                        ),
                                )),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 15, right: 10),
              height: MediaQuery.of(context).size.height / 18,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    //background color of box
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 0.5, // soften the shadow
                      spreadRadius: 0.5, //extend the shadow
                      offset: Offset(
                        0.0, // Move to right 10  horizontally
                        0.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "What kind of Ads are you planning to add?",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 60,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child:
                        SvgPicture.asset("assets/images/iconsarrorowright.svg"),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 15, right: 10),
              height: MediaQuery.of(context).size.height / 18,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    //background color of box
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 0.5, // soften the shadow
                      spreadRadius: 0.5, //extend the shadow
                      offset: Offset(
                        0.0, // Move to right 10  horizontally
                        0.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      onChanged: (value) => searchs = value,
                      controller: seacrh,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.greenAccent,
                      decoration: InputDecoration(
                          hintText: "Enter your title here",
                          hintStyle: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height / 60),
                          border: InputBorder.none),
                    ),
                  )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 15, right: 10),
              height: MediaQuery.of(context).size.height / 7.3,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    //background color of box
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 0.5, // soften the shadow
                      spreadRadius: 0.5, //extend the shadow
                      offset: Offset(
                        0.0, // Move to right 10  horizontally
                        0.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  onChanged: (value) => descriptions = value,
                  controller: description,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.greenAccent,
                  decoration: InputDecoration(
                      hintText: "Add Description",
                      hintStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 60),
                      border: InputBorder.none),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 15, right: 10),
              height: MediaQuery.of(context).size.height / 18,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    //background color of box
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 0.5, // soften the shadow
                      spreadRadius: 0.5, //extend the shadow
                      offset: Offset(
                        0.0, // Move to right 10  horizontally
                        0.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      onChanged: (value) => prices = value,
                      controller: price,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.greenAccent,
                      decoration: InputDecoration(
                          hintText: "Price",
                          hintStyle: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height / 60),
                          border: InputBorder.none),
                    ),
                  )),
                  Container(
                    height: MediaQuery.of(context).size.height / 18,
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: BoxDecoration(
                        color: Color(0xff2696CC),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "KWD",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.height / 55),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 13, top: 15),
              child: Text(
                "User's Details",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 50,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 15, right: 10),
              height: MediaQuery.of(context).size.height / 18,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    //background color of box
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 0.5, // soften the shadow
                      spreadRadius: 0.5, //extend the shadow
                      offset: Offset(
                        0.0, // Move to right 10  horizontally
                        0.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      onChanged: (value) => usernames = value,
                      controller: username,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.greenAccent,
                      decoration: InputDecoration(
                          hintText: "User Name",
                          hintStyle: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height / 60),
                          border: InputBorder.none),
                    ),
                  )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 15, right: 10),
              height: MediaQuery.of(context).size.height / 18,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    //background color of box
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 0.5, // soften the shadow
                      spreadRadius: 0.5, //extend the shadow
                      offset: Offset(
                        0.0, // Move to right 10  horizontally
                        0.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      onChanged: (value) => mobiles = value,
                      controller: mobile,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.greenAccent,
                      decoration: InputDecoration(
                          hintText: "Mobile Number",
                          hintStyle: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height / 60),
                          border: InputBorder.none),
                    ),
                  )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 15, right: 10),
              height: MediaQuery.of(context).size.height / 18,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    //background color of box
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 0.5, // soften the shadow
                      spreadRadius: 0.5, //extend the shadow
                      offset: Offset(
                        0.0, // Move to right 10  horizontally
                        0.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      onChanged: (value) => emails = value,
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.greenAccent,
                      decoration: InputDecoration(
                          hintText: "Email Address",
                          hintStyle: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height / 60),
                          border: InputBorder.none),
                    ),
                  )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 15, right: 10),
              height: MediaQuery.of(context).size.height / 18,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    //background color of box
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 0.5, // soften the shadow
                      spreadRadius: 0.5, //extend the shadow
                      offset: Offset(
                        0.0, // Move to right 10  horizontally
                        0.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      onChanged: (value) => locations = value,
                      controller: location,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.greenAccent,
                      decoration: InputDecoration(
                          hintText: "Location",
                          hintStyle: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height / 60),
                          border: InputBorder.none),
                    ),
                  )),
                  Container(
                    height: MediaQuery.of(context).size.height / 18,
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: BoxDecoration(
                        color: Color(0xff2696CC),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Icon(Icons.location_on, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardScreen()));
                  },
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(left: 25, right: 25, bottom: 30),
                      height: MediaQuery.of(context).size.height / 18,
                      decoration: BoxDecoration(
                          color: Color(0xff2696CC),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          "Insert the Ad",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  void _openCamera(BuildContext context) async {
    // ignore: deprecated_member_use
    var pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );

    setState(() {
      imagepath = pickedFile!.path.toString();
      imageFile = pickedFile;
      final bytes = File(pickedFile.path).readAsBytesSync();

      // String base64Image = "data:image/png;base64," + base64Encode(bytes);
      File file = File(pickedFile.path);

      Uint8List bytess = file.readAsBytesSync();
      String base64Image = base64Encode(bytes);

      print(base64Image);
    });
    //   Navigator.pop(context);
  }

  void _openGallary(BuildContext context) async {
    // ignore: deprecated_member_use
    var pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );

    setState(() {
      imagepath = pickedFile!.path.toString();
      imageFile = pickedFile;
      final bytes = File(pickedFile.path).readAsBytesSync();

      // String base64Image = "data:image/png;base64," + base64Encode(bytes);
      File file = File(pickedFile.path);

      Uint8List bytess = file.readAsBytesSync();
      String base64Image = base64Encode(bytes);
      print(base64Image);
    });
    //   Navigator.pop(context);
  }

  void _openCamera2(BuildContext context) async {
    // ignore: deprecated_member_use
    var pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );

    setState(() {
      imagepath2 = pickedFile!.path.toString();
      imageFile2 = pickedFile;
      final bytes = File(pickedFile.path).readAsBytesSync();

      // String base64Image = "data:image/png;base64," + base64Encode(bytes);
      File file = File(pickedFile.path);

      Uint8List bytess = file.readAsBytesSync();
      String base64Image = base64Encode(bytes);
    });
    //   Navigator.pop(context);
  }

  void _openGallary2(BuildContext context) async {
    // ignore: deprecated_member_use
    var pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );

    setState(() {
      imagepath2 = pickedFile!.path.toString();
      imageFile2 = pickedFile;
      final bytes = File(pickedFile.path).readAsBytesSync();

      // String base64Image = "data:image/png;base64," + base64Encode(bytes);
      File file = File(pickedFile.path);

      Uint8List bytess = file.readAsBytesSync();
      String base64Image = base64Encode(bytes);
    });
    //   Navigator.pop(context);
  }

  void _openCamera3(BuildContext context) async {
    // ignore: deprecated_member_use
    var pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );

    setState(() {
      imagepath3 = pickedFile!.path.toString();
      imageFile = pickedFile;
      final bytes = File(pickedFile.path).readAsBytesSync();

      // String base64Image = "data:image/png;base64," + base64Encode(bytes);
      File file = File(pickedFile.path);

      Uint8List bytess = file.readAsBytesSync();
      String base64Image = base64Encode(bytes);
    });
    //   Navigator.pop(context);
  }

  void _openGallary3(BuildContext context) async {
    // ignore: deprecated_member_use
    var pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );

    setState(() {
      imagepath3 = pickedFile!.path.toString();
      imageFile3 = pickedFile;
      final bytes = File(pickedFile.path).readAsBytesSync();

      // String base64Image = "data:image/png;base64," + base64Encode(bytes);
      File file = File(pickedFile.path);

      Uint8List bytess = file.readAsBytesSync();
      String base64Image = base64Encode(bytes);
    });
    //   Navigator.pop(context);
  }

  void _openCamera4(BuildContext context) async {
    // ignore: deprecated_member_use
    var pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );

    setState(() {
      imagepath4 = pickedFile!.path.toString();
      imageFile4 = pickedFile;
      final bytes = File(pickedFile.path).readAsBytesSync();

      // String base64Image = "data:image/png;base64," + base64Encode(bytes);
      File file = File(pickedFile.path);

      Uint8List bytess = file.readAsBytesSync();
      String base64Image = base64Encode(bytes);
    });
    //   Navigator.pop(context);
  }

  void _openGallary4(BuildContext context) async {
    // ignore: deprecated_member_use
    var pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );

    setState(() {
      imagepath4 = pickedFile!.path.toString();
      imageFile4 = pickedFile;
      final bytes = File(pickedFile.path).readAsBytesSync();

      // String base64Image = "data:image/png;base64," + base64Encode(bytes);
      File file = File(pickedFile.path);

      Uint8List bytess = file.readAsBytesSync();
      String base64Image = base64Encode(bytes);
    });
    //   Navigator.pop(context);
  }
}
