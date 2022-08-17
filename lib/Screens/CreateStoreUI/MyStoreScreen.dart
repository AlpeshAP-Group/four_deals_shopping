import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_deals_shopping/Screens/CreateStoreUI/MyOrdersScreen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:stacked/stacked.dart';

import '../../Controller/StoreDetailsViewModel.dart';

class MyStoreSCreen extends StatefulWidget {
  @override
  State<MyStoreSCreen> createState() => MyStoreSCreenState();
}

class MyStoreSCreenState extends State<MyStoreSCreen>
    with SingleTickerProviderStateMixin {
  late String? imagepath = "";
  PickedFile? imageFile = null;
  late String? imagepath2 = "";
  PickedFile? imageFile2 = null;

  double _ratingStar = 0;
  final email = TextEditingController();
  late String emails = "";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductDetailsViewModel>.reactive(
        viewModelBuilder: () => ProductDetailsViewModel(),
        onModelReady: (model) => {
              model.fetchstoredetails("1"),
              model.fetchstoreproducts("1"),
              model.fetchstorecartlist("1"),
              model.fetchrattings("1"),
              model.storeid = "1"
            },
        builder: (context, model, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              home: DefaultTabController(
                length: 3,
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Color(0xffF6F6F6),
                    elevation: 1,
                    titleSpacing: 0,
                    leading: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                    actions: [
                      Container(
                        height: MediaQuery.of(context).size.height / 25,
                        width: MediaQuery.of(context).size.width / 25,
                        margin: EdgeInsets.only(right: 20, left: 15),
                        child: Icon(
                          Icons.notifications,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height / 3.5,
                          child: Stack(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 4.5,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        //background color of box
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          blurRadius: 1.0, // soften the shadow
                                          spreadRadius: 1.0, //extend the shadow
                                          offset: Offset(
                                            0.0, // Move to right 10  horizontally
                                            2.0, // Move to bottom 10 Vertically
                                          ),
                                        )
                                      ],
                                      image: (imagepath2 == "")
                                          ? DecorationImage(
                                              image: NetworkImage(
                                                  model.bannerimage),
                                              fit: BoxFit.fill)
                                          : DecorationImage(
                                              image: FileImage(
                                                  File(imageFile2!.path)),
                                              fit: BoxFit.fill)),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (ctx) => AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20.0))),
                                                title: Text(
                                                  "Choose Options",
                                                  textAlign: TextAlign.center,
                                                ),
                                                actions: <Widget>[
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: 15),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          GestureDetector(
                                                            onTap: () {
                                                              _openCamera2(
                                                                  context);
                                                              Navigator.of(ctx)
                                                                  .pop();
                                                            },
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              width: 100,
                                                              height: 40,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  gradient: LinearGradient(
                                                                      begin: Alignment
                                                                          .topCenter,
                                                                      end: Alignment.bottomCenter,
                                                                      colors: [
                                                                        Color(
                                                                            0xff960E7A),
                                                                        Color(
                                                                            0xffFD3E40)
                                                                      ])),
                                                              child: Text(
                                                                "Camera",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              _openGallary2(
                                                                  context);
                                                              Navigator.of(ctx)
                                                                  .pop();
                                                            },
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 10),
                                                              width: 100,
                                                              height: 40,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  gradient: LinearGradient(
                                                                      begin: Alignment
                                                                          .topCenter,
                                                                      end: Alignment.bottomCenter,
                                                                      colors: [
                                                                        Color(
                                                                            0xff960E7A),
                                                                        Color(
                                                                            0xffFD3E40)
                                                                      ])),
                                                              child: Text(
                                                                "Gallery",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .white),
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
                                            margin: EdgeInsets.only(
                                                left: 10, top: 10),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                30,
                                            decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withOpacity(0.7)),
                                            child: Row(
                                              children: <Widget>[
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 5),
                                                  child: Icon(
                                                    Icons.edit,
                                                    color: Colors.white,
                                                    size: MediaQuery.of(context)
                                                            .size
                                                            .height /
                                                        54,
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 5, right: 5),
                                                  child: Text(
                                                    "Edit",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            60),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 8,
                                    width:
                                        MediaQuery.of(context).size.height / 8,
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              8,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              8,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              image: (imagepath == "")
                                                  ? DecorationImage(
                                                      image: NetworkImage(
                                                          model.logoimage))
                                                  : DecorationImage(
                                                      image: FileImage(File(
                                                          imageFile!.path)),
                                                      fit: BoxFit.fill),
                                              boxShadow: [
                                                //background color of box
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  blurRadius:
                                                      1.0, // soften the shadow
                                                  spreadRadius:
                                                      1.0, //extend the shadow
                                                  offset: Offset(
                                                    0.0, // Move to right 10  horizontally
                                                    0.0, // Move to bottom 10 Vertically
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          10)),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (ctx) => AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20.0))),
                                                  title: Text(
                                                    "Choose Options",
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  actions: <Widget>[
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            bottom: 15),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            GestureDetector(
                                                              onTap: () {
                                                                _openCamera(
                                                                    context);
                                                                Navigator.of(
                                                                        ctx)
                                                                    .pop();
                                                              },
                                                              child: Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                width: 100,
                                                                height: 40,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    gradient: LinearGradient(
                                                                        begin: Alignment
                                                                            .topCenter,
                                                                        end: Alignment.bottomCenter,
                                                                        colors: [
                                                                          Color(
                                                                              0xff960E7A),
                                                                          Color(
                                                                              0xffFD3E40)
                                                                        ])),
                                                                child: Text(
                                                                  "Camera",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                _openGallary(
                                                                    context);
                                                                Navigator.of(
                                                                        ctx)
                                                                    .pop();
                                                              },
                                                              child: Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            10),
                                                                width: 100,
                                                                height: 40,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    gradient: LinearGradient(
                                                                        begin: Alignment
                                                                            .topCenter,
                                                                        end: Alignment.bottomCenter,
                                                                        colors: [
                                                                          Color(
                                                                              0xff960E7A),
                                                                          Color(
                                                                              0xffFD3E40)
                                                                        ])),
                                                                child: Text(
                                                                  "Gallery",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .white),
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
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  30,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  30,
                                              decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              10)),
                                              child: Center(
                                                child: Icon(
                                                  Icons.edit,
                                                  size: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      55,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            model.storename,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 45,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => MyStoreSCreen()));
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height / 20,
                            width: MediaQuery.of(context).size.width,
                            margin:
                                EdgeInsets.only(left: 15, right: 15, top: 15),
                            decoration: BoxDecoration(
                              color: Color(0xff2696CC),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Post your Ads",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height / 50,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          width: MediaQuery.of(context).size.width,
                          height: 1,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        "0",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                50,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      child: Text(
                                        "Products",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                50,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 12,
                                width: 1,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        "0",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                50,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      child: Text(
                                        "Followers",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                50,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 12,
                                width: 1,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        "0",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                50,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      child: Text(
                                        "Ratings",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                50,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 12,
                                width: 1,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MyOrderScreen()));
                                },
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        "0",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                50,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      child: Text(
                                        "Orders",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                50,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 1,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        Container(
                          child: TabBar(
                            labelColor: Colors.black,
                            // controller: _tabController,
                            // unselectedLabelColor: Colors.black,
                            indicatorColor: Colors.green,
                            // indicatorSize: TabBarIndicatorSize.tab,
                            // indicator: BoxDecoration(
                            //     border: Border.all(
                            //         width: 1, color: Colors.grey.withOpacity(0.3))),
                            tabs: [
                              Tab(
                                child: Container(
                                  child: Text(
                                    "Ads",
                                  ),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  child: Text(
                                    "Info.",
                                  ),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  child: Text(
                                    "Ratings",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 2,
                          child: TabBarView(
                            children: [
                              Container(
                                  child: ListView.builder(
                                      itemCount: model.storeproducts.length,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        return Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              //background color of box
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                blurRadius:
                                                    0.5, // soften the shadow
                                                spreadRadius:
                                                    0.5, //extend the shadow
                                                offset: Offset(
                                                  0.0, // Move to right 10  horizontally
                                                  0.0, // Move to bottom 10 Vertically
                                                ),
                                              )
                                            ],
                                          ),
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 10, top: 10, bottom: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      6.5,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      boxShadow: [
                                                        //background color of box
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(0.5),
                                                          blurRadius:
                                                              0.5, // soften the shadow
                                                          spreadRadius:
                                                              0.5, //extend the shadow
                                                          offset: Offset(
                                                            0.0, // Move to right 10  horizontally
                                                            0.0, // Move to bottom 10 Vertically
                                                          ),
                                                        )
                                                      ],
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              "https://aswagbuckets3.s3.me-south-1.amazonaws.com/${model.storeproducts[index].thumnails}"),
                                                          fit: BoxFit.fill)),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 10, right: 10),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Container(
                                                          child: Row(
                                                            children: <Widget>[
                                                              Expanded(
                                                                  child:
                                                                      Container(
                                                                child: Text(
                                                                  model
                                                                      .storeproducts[
                                                                          index]
                                                                      .title,
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xff707070),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          MediaQuery.of(context).size.height /
                                                                              50),
                                                                ),
                                                              )),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 5),
                                                            child: Text(
                                                              model
                                                                  .storeproducts[
                                                                      index]
                                                                  .description,
                                                              style: TextStyle(
                                                                  fontSize: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height /
                                                                      60,
                                                                  color: Color(
                                                                      0xff707070)),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 15),
                                                          child: Text(
                                                            "Price",
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xff707070),
                                                                fontSize: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    60),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 10),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: <Widget>[
                                                              Container(
                                                                child: Text(
                                                                  model
                                                                      .storeproducts[
                                                                          index]
                                                                      .amount,
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xff707070),
                                                                      fontSize:
                                                                          MediaQuery.of(context).size.height /
                                                                              50,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700),
                                                                ),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            10),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                  color: Colors
                                                                      .white,
                                                                  boxShadow: [
                                                                    //background color of box
                                                                    BoxShadow(
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.5),
                                                                      blurRadius:
                                                                          0.5, // soften the shadow
                                                                      spreadRadius:
                                                                          0.5, //extend the shadow
                                                                      offset:
                                                                          Offset(
                                                                        0.0, // Move to right 10  horizontally
                                                                        0.0, // Move to bottom 10 Vertically
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              5,
                                                                          left:
                                                                              5,
                                                                          bottom:
                                                                              5,
                                                                          right:
                                                                              5),
                                                                  child: Row(
                                                                    children: <
                                                                        Widget>[
                                                                      Container(
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .edit,
                                                                          size: MediaQuery.of(context).size.height /
                                                                              43,
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            left:
                                                                                5),
                                                                        child:
                                                                            Text(
                                                                          "Edit Product",
                                                                          style:
                                                                              TextStyle(fontWeight: FontWeight.w600),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      })),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 1,
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 20),
                                      height:
                                          MediaQuery.of(context).size.height /
                                              18,
                                      color: Color(0xffF6F6F6),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                20,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                20,
                                            child: SvgPicture.asset(
                                                "assets/images/storeicons.svg"),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 15),
                                            child: Text(
                                              model.storename,
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          50,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 1,
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 20),
                                      height:
                                          MediaQuery.of(context).size.height /
                                              18,
                                      color: Color(0xffF6F6F6),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                25,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                25,
                                            child: SvgPicture.asset(
                                                "assets/images/icon_locations.svg"),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 15),
                                            child: Text(
                                              model.location,
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          50,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 1,
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 20),
                                      height:
                                          MediaQuery.of(context).size.height /
                                              18,
                                      color: Color(0xffF6F6F6),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                23,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                23,
                                            child: SvgPicture.asset(
                                                "assets/images/icon_wait.svg"),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 15),
                                            child: Text(
                                              "Call Anytime",
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          50,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 1,
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 20),
                                      height:
                                          MediaQuery.of(context).size.height /
                                              18,
                                      color: Color(0xffF6F6F6),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                22,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                22,
                                            child: SvgPicture.asset(
                                                "assets/images/icon_call.svg"),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 15),
                                            child: Text(
                                              model.mobile,
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          50,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 1,
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            child: Text(
                                              "Write a review",
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          45,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              ratingreviewdailog(model);
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(left: 10),
                                              decoration: BoxDecoration(
                                                  color: Color(0xff2696CC),
                                                  borderRadius:
                                                      BorderRadius.circular(3)),
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    top: 5,
                                                    bottom: 5),
                                                child: Text(
                                                  "Add Review",
                                                  style: TextStyle(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              50,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Color(0xffEEF9FF),
                                                borderRadius:
                                                    BorderRadius.circular(3)),
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  left: 10,
                                                  right: 10,
                                                  top: 5,
                                                  bottom: 5),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                      child: RatingBar.readOnly(
                                                    filledIcon: Icons.star,
                                                    emptyIcon: Icons.star,
                                                    emptyColor: Colors.grey,
                                                    filledColor: Colors.amber,
                                                    size: 13,
                                                    maxRating: 5,
                                                    initialRating: 3,
                                                  )),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 15),
                                                    child: Text(
                                                      "4.5 out of 5",
                                                      style: TextStyle(
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            50,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 12),
                                      child: Text(
                                        "40 Customer Rating",
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              55,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        child: ListView.builder(
                                            itemCount: model.ratinglist.length,
                                            scrollDirection: Axis.vertical,
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemBuilder:
                                                (BuildContext context, index) {
                                              return Container(
                                                margin: EdgeInsets.only(
                                                    left: 20,
                                                    top: 20,
                                                    right: 20),
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      child: Text(
                                                        "${model.ratinglist[index].ratting.toString()} Star",
                                                        style: TextStyle(
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                55,
                                                            color: Color(
                                                                0xff2696CC)),
                                                      ),
                                                    ),
                                                    Expanded(
                                                        child: Container(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                40,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 10,
                                                                    right: 15),
                                                            decoration: BoxDecoration(
                                                                color: Color(
                                                                    0xffEEF9FF),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            child: Container(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  40,
                                                              margin: EdgeInsets.only(
                                                                  right: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      8),
                                                              decoration: BoxDecoration(
                                                                  color: Color(
                                                                      0xffF1BA09),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                              child: Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            10,
                                                                        right:
                                                                            10,
                                                                        top: 5,
                                                                        bottom:
                                                                            5),
                                                              ),
                                                            ))),
                                                    Container(
                                                      child: Text(
                                                        "${model.ratinglist[index].percentage} %",
                                                        style: TextStyle(
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              55,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }))
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ));
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

  void ratingreviewdailog(ProductDetailsViewModel model) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (ctx) {
          bool isChecked = false;
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              insetPadding: EdgeInsets.symmetric(horizontal: 25),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              content: Container(
                height: MediaQuery.of(context).size.height / 3.6,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Add Ratting and Review",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      child: RatingBar(
                        onRatingChanged: (rating) =>
                            setState(() => _ratingStar = rating),
                        filledIcon: Icons.star,
                        emptyIcon: Icons.star_border,
                        halfFilledIcon: Icons.star_half,
                        isHalfAllowed: true,
                        filledColor: Colors.amber,
                        emptyColor: Colors.grey,
                        size: 48,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.grey)),
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            setState(() {
                              emails = value;
                            });
                          },
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.greenAccent,
                          decoration: InputDecoration(
                              hintText: "Write Review",
                              hintStyle: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 70),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          model.reportads(
                              "1", _ratingStar.toString(), email.text, context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(bottom: 10),
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: MediaQuery.of(context).size.height / 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffFF2626)),
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          });
        });
  }
}
