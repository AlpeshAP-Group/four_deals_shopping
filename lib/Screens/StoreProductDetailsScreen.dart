import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_deals_shopping/Controller/ProductDetailsViewModel.dart';
import 'package:share/share.dart';
import 'package:stacked/stacked.dart';
import 'package:toast/toast.dart';

class StoreProductDetailsScreen extends StatefulWidget {
  String? aidid = null;
  StoreProductDetailsScreen(this.aidid);
  @override
  State<StoreProductDetailsScreen> createState() =>
      StoreProductDetailsScreenState();
}

class StoreProductDetailsScreenState extends State<StoreProductDetailsScreen> {
  late String follow = "";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductDetailsViewModel>.reactive(
        viewModelBuilder: () => ProductDetailsViewModel(),
        onModelReady: (model) => {model.fetchproduct(widget.aidid.toString())},
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xffF6F6F6),
                elevation: 3,
                titleSpacing: 0,
                title: Text("Shop Profile",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 45,
                        color: Colors.black)),
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
              body: Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height / 3.0,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Color(0xffEBEFF2),
                              boxShadow: [
                                //background color of box
                                BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 0.5, // soften the shadow
                                  spreadRadius: 0.5, //extend the shadow
                                  offset: Offset(
                                    0.0, // Move to right 10  horizontally
                                    0.0, // Move to bottom 10 Vertically
                                  ),
                                )
                              ],
                              image: DecorationImage(
                                  image: NetworkImage(model.adsimage),
                                  fit: BoxFit.cover)),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10, right: 15),
                                    height:
                                        MediaQuery.of(context).size.height / 28,
                                    width:
                                        MediaQuery.of(context).size.width / 13,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white),
                                    child: Center(
                                      child: Icon(
                                        Icons.bookmark_outline,
                                        size:
                                            MediaQuery.of(context).size.height /
                                                40,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.5)),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: 8, right: 8, top: 3, bottom: 3),
                                      child: Text(
                                        "1/9",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              //background color of box
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 1.5, // soften the shadow
                                spreadRadius: 1.5, //extend the shadow
                                offset: Offset(
                                  0.0, // Move to right 10  horizontally
                                  2.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ],
                          ),
                          child: Container(
                              margin: EdgeInsets.only(
                                  left: 15, top: 10, bottom: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      model.title,
                                      style: TextStyle(
                                          color: Color(0xff707070),
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              40,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            model.price,
                                            style: TextStyle(
                                                color: Color(0xff707070),
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    33,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 10),
                                          decoration: BoxDecoration(
                                              color: Color(0xff78BC05),
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 5,
                                                right: 5,
                                                top: 3,
                                                bottom: 3),
                                            child: Row(
                                              children: <Widget>[
                                                Container(
                                                  child: Text(
                                                    "4.5",
                                                    style: TextStyle(
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            70,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 3),
                                                  child: Icon(Icons.star,
                                                      size:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              60,
                                                      color: Colors.white),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: Text(
                                      "Posted on: 27 Jan 2021",
                                      style: TextStyle(
                                        color: Color(0xff707070),
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50,
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      height: 1,
                                      width: MediaQuery.of(context).size.width /
                                          18,
                                      color: Colors.black,
                                    ),
                                    Container(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 5),
                                        child: Text(
                                          "Product Details",
                                          style: TextStyle(
                                              color: Color(0xff707070),
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  55,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 5),
                                        height: 1,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                18,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 15, top: 15, right: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              child: Text(
                                                "Color",
                                                style: TextStyle(
                                                  color: Color(0xff707070),
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          55,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: Text(
                                                "White",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            55,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              child: Text(
                                                "Outer material",
                                                style: TextStyle(
                                                  color: Color(0xff707070),
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          55,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: Text(
                                                "Mesh",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            55,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              child: Text(
                                                "Model name",
                                                style: TextStyle(
                                                  color: Color(0xff707070),
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          55,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: Text(
                                                "SOLAR BOOST 3 M",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            55,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              child: Text(
                                                "Ideal for",
                                                style: TextStyle(
                                                  color: Color(0xff707070),
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          55,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: Text(
                                                "Men",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            55,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              child: Text(
                                                "Occasion",
                                                style: TextStyle(
                                                  color: Color(0xff707070),
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          55,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: Text(
                                                "Sports",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            55,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Text(
                                          "More...",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  52,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      height: 1,
                                      width: MediaQuery.of(context).size.width /
                                          18,
                                      color: Colors.black,
                                    ),
                                    Container(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 5),
                                        child: Text(
                                          "Product Details",
                                          style: TextStyle(
                                              color: Color(0xff707070),
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  55,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 5),
                                        height: 1,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                18,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15, top: 10),
                                child: Text(
                                  model.description,
                                  style: TextStyle(
                                    color: Color(0xff707070),
                                    fontSize:
                                        MediaQuery.of(context).size.height / 55,
                                  ),
                                ),
                              ),
                              Container(
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: 10,
                                    left: 15,
                                  ),
                                  child: Text(
                                    "View more...",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                52,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 15, right: 15, top: 10, bottom: 15),
                          child: Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Toast.show("Coming Soon", context,
                                      duration: Toast.LENGTH_SHORT,
                                      gravity: Toast.BOTTOM);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      //background color of box
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 0.5, // soften the shadow
                                        spreadRadius: 0.5, //extend the shadow
                                        offset: Offset(
                                          1.0, // Move to right 10  horizontally
                                          1.0, // Move to bottom 10 Vertically
                                        ),
                                      )
                                    ],
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: 15,
                                        right: 15,
                                        top: 10,
                                        bottom: 10),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          child: SvgPicture.asset(
                                              "assets/images/reviewicons.svg"),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 5),
                                          child: Text(
                                            "Review",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    60,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                    onTap: () {
                                      final RenderBox box = context
                                          .findRenderObject() as RenderBox;
                                      Share.share("Hello",
                                          subject: "Four Deals",
                                          sharePositionOrigin:
                                              box.localToGlobal(Offset.zero) &
                                                  box.size);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(left: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          //background color of box
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius:
                                                0.5, // soften the shadow
                                            spreadRadius:
                                                0.5, //extend the shadow
                                            offset: Offset(
                                              1.0, // Move to right 10  horizontally
                                              1.0, // Move to bottom 10 Vertically
                                            ),
                                          )
                                        ],
                                      ),
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: 15,
                                            right: 15,
                                            top: 15,
                                            bottom: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              child: SvgPicture.asset(
                                                  "assets/images/shareiconss.svg"),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 10),
                                              child: Text(
                                                "Share",
                                                style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            52,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff2696CC)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Toast.show("Coming Soon", context,
                                      duration: Toast.LENGTH_SHORT,
                                      gravity: Toast.BOTTOM);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      //background color of box
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 0.5, // soften the shadow
                                        spreadRadius: 0.5, //extend the shadow
                                        offset: Offset(
                                          1.0, // Move to right 10  horizontally
                                          1.0, // Move to bottom 10 Vertically
                                        ),
                                      )
                                    ],
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: 15,
                                        right: 15,
                                        top: 10,
                                        bottom: 10),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          child: SvgPicture.asset(
                                              "assets/images/commercialiconss.svg"),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 5),
                                          child: Text(
                                            "Notify",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    60,
                                                fontWeight: FontWeight.w600),
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
                          width: MediaQuery.of(context).size.width,
                          height: 1,
                          color: Color(0xff707070),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, top: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Container(
                                  child: Text(
                                    "Post owner",
                                    style: TextStyle(
                                        color: Color(0xff707070),
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                48,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              14,
                                      width:
                                          MediaQuery.of(context).size.height /
                                              14,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                              width: 1.5,
                                              color: Color(0xff2696CC)),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  model.owenerimage),
                                              fit: BoxFit.fill)),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                              child: Container(
                                            margin: EdgeInsets.only(left: 10),
                                            child: Text(
                                              model.ownername,
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          50,
                                                  color: Color(0xff707070),
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )),
                                          Container(
                                              child: Container(
                                            margin: EdgeInsets.only(
                                                left: 10, top: 5),
                                            child: Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    child: SvgPicture.asset(
                                                        "assets/images/locationiconss.svg"),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 10),
                                                    child: Text(
                                                      "Hawalli, Kuwait",
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
                                            ),
                                          ))
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (follow == "") {
                                          setState(() {
                                            follow = "Follow";
                                            model.followuser(model.ownerid,
                                                "FOLLOW", context);
                                          });
                                        } else {
                                          setState(() {
                                            follow = "";
                                            model.followuser(model.ownerid,
                                                "UNFOLLOW", context);
                                          });
                                        }
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4.5,
                                        margin: EdgeInsets.only(right: 20),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                width: 1,
                                                color: Color(0xff67A400))),
                                        child: Center(
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                top: 6, bottom: 6),
                                            child: (follow == "Follow")
                                                ? Text("UnFollow")
                                                : Text("Follow"),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 15, right: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              child: Text(
                                                "Member Since",
                                                style: TextStyle(
                                                  color: Color(0xff707070),
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          55,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: Text(
                                                "11/12/2020",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            55,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              child: Text(
                                                "Number of Ads",
                                                style: TextStyle(
                                                  color: Color(0xff707070),
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          55,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: Text(
                                                "12",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            55,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              child: Text(
                                                "Rating",
                                                style: TextStyle(
                                                  color: Color(0xff707070),
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          55,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: Text(
                                                "SOLAR BOOST 3 M",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            55,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 70),
                          width: MediaQuery.of(context).size.width,
                          height: 1,
                          color: Color(0xff707070),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () {
                        model.addtocart(
                            model.addid, model.ownerid, "1", context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 15, bottom: 15),
                        height: MediaQuery.of(context).size.height,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xff2696CC)),
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 12, bottom: 12, left: 10, right: 10),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      child: Icon(
                                        Icons.shopping_cart,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 7),
                                      child: Text(
                                        "Add to Cart",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                55,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
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
                  )
                ],
              ),
            ));
  }
}
