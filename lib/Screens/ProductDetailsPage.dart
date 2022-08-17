import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_deals_shopping/Screens/ChatMessageActivity.dart';
import 'package:share/share.dart';
import 'package:stacked/stacked.dart';

import '../Controller/ProductDetailsViewModel.dart';

class ProductDetailsPage extends StatefulWidget {
  String? aidid = null;
  ProductDetailsPage(this.aidid);
  @override
  State<ProductDetailsPage> createState() => ProductDetailsPageState();
}

class ProductDetailsPageState extends State<ProductDetailsPage> {
  bool value = false;
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  bool value5 = false;
  bool value6 = false;
  bool value7 = false;

  late String follow = "";

  final email = TextEditingController();
  late String emails = "";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductDetailsViewModel>.reactive(
        viewModelBuilder: () => ProductDetailsViewModel(),
        onModelReady: (model) => {model.fetchproduct(widget.aidid.toString())},
        builder: (context, model, child) => Scaffold(
                body: Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 20),
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
                                    image: NetworkImage(
                                        "https://aswagbuckets3.s3.me-south-1.amazonaws.com/${model.adsimage}"),
                                    fit: BoxFit.cover)),
                            child: Stack(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(top: 10, left: 15),
                                      height:
                                          MediaQuery.of(context).size.height /
                                              28,
                                      width: MediaQuery.of(context).size.width /
                                          13,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Colors.white.withOpacity(0.7)),
                                      child: Center(
                                        child: Icon(
                                          Icons.arrow_back,
                                          color: Colors.black,
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
                                            left: 8,
                                            right: 8,
                                            top: 3,
                                            bottom: 3),
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
                                                  fontSize:
                                                      MediaQuery.of(context)
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
                                                    margin: EdgeInsets.only(
                                                        left: 3),
                                                    child: Icon(Icons.star,
                                                        size: MediaQuery.of(
                                                                    context)
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
                                      margin: EdgeInsets.only(right: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(top: 5),
                                            child: Text(
                                              "Posted on: 27 Jan 2021",
                                              style: TextStyle(
                                                color: Color(0xff707070),
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    50,
                                              ),
                                            ),
                                          ),
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
                                    )
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
                                        width:
                                            MediaQuery.of(context).size.width /
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        width:
                                            MediaQuery.of(context).size.width /
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
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
                                          MediaQuery.of(context).size.height /
                                              55,
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
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 15, right: 15, top: 10, bottom: 15),
                            child: Row(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    dialogbutton(model);
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
                                                "assets/images/reportusericons.svg"),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 5),
                                            child: Text(
                                              "Report",
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
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
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                child: Text(
                                                  "Share",
                                                  style: TextStyle(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              52,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color(0xff2696CC)),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                                Container(
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
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
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
                                                    "https://aswagbuckets3.s3.me-south-1.amazonaws.com/${model.owenerimage}"),
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
                                                    fontWeight:
                                                        FontWeight.w600),
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
                                          setState(() {
                                            if (follow == "") {
                                              follow = "1";
                                            } else {
                                              follow = "";
                                            }
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(right: 20),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: (follow == "1")
                                                  ? Color(0xff67A400)
                                                  : Colors.white,
                                              border: Border.all(
                                                  width: 1,
                                                  color: Color(0xff67A400))),
                                          child: Center(
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  top: 6,
                                                  bottom: 6,
                                                  left: 15,
                                                  right: 15),
                                              child: (follow == "1")
                                                  ? Text(
                                                      "Following",
                                                      style: TextStyle(
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              55,
                                                          color: Colors.white),
                                                    )
                                                  : Text(
                                                      "Follow",
                                                      style: TextStyle(
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              55),
                                                    ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                            margin: EdgeInsets.only(top: 10, bottom: 10),
                            width: MediaQuery.of(context).size.width,
                            height: 1,
                            color: Color(0xff707070),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: 10, left: 20, right: 20, bottom: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              bool? res =
                                  await FlutterPhoneDirectCaller.callNumber(
                                      "7046636420");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xff67A400),
                                boxShadow: [
                                  //background color of box
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    blurRadius: 0.5, // soften the shadow
                                    spreadRadius: 0.5, //extend the shadow
                                    offset: Offset(
                                      0.0, // Move to right 10  horizontally
                                      0.0, // Move to bottom 10 Vertically
                                    ),
                                  )
                                ],
                              ),
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 10, left: 5, bottom: 10, right: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      child: Icon(
                                        Icons.call,
                                        color: Colors.white,
                                        size:
                                            MediaQuery.of(context).size.height /
                                                38,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 15),
                                      child: Text(
                                        "99442XXX",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                40,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChatMessageActivity(
                                          model.ownerid, model.ownername, "")));
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                boxShadow: [
                                  //background color of box
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    blurRadius: 0.5, // soften the shadow
                                    spreadRadius: 0.5, //extend the shadow
                                    offset: Offset(
                                      0.0, // Move to right 10  horizontally
                                      0.0, // Move to bottom 10 Vertically
                                    ),
                                  )
                                ],
                              ),
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 10, left: 30, bottom: 10, right: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      child: Icon(
                                        Icons.chat,
                                        size:
                                            MediaQuery.of(context).size.height /
                                                38,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 15),
                                      child: Text(
                                        "Chat",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff707070),
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              40,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            )));
  }

  void dialogbutton(ProductDetailsViewModel model) {
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
                height: MediaQuery.of(context).size.height / 3.2,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        "Report this Ad",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 40,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff707070)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 40,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        child: Checkbox(
                                            value: this.value,
                                            onChanged: (value) {
                                              setState(() {
                                                this.value = value!;
                                              });
                                            }),
                                      ),
                                      Container(
                                        child: Text(
                                          "Fake Ads",
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  55),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 8),
                                  height:
                                      MediaQuery.of(context).size.height / 40,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        child: Checkbox(
                                            value: this.value2,
                                            onChanged: (value) {
                                              setState(() {
                                                this.value2 = value!;
                                              });
                                            }),
                                      ),
                                      Container(
                                        child: Text(
                                          "Abusive",
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  55),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 8),
                                  height:
                                      MediaQuery.of(context).size.height / 40,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        child: Checkbox(
                                            value: this.value3,
                                            onChanged: (value) {
                                              setState(() {
                                                this.value3 = value!;
                                              });
                                            }),
                                      ),
                                      Container(
                                        child: Text(
                                          "Explicit Content",
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  55),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 8),
                                  height:
                                      MediaQuery.of(context).size.height / 40,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        child: Checkbox(
                                            value: this.value4,
                                            onChanged: (value) {
                                              setState(() {
                                                this.value4 = value!;
                                              });
                                            }),
                                      ),
                                      Container(
                                        child: Text(
                                          "Unknown",
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  55),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 40,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        child: Checkbox(
                                            value: this.value5,
                                            onChanged: (value) {
                                              setState(() {
                                                this.value5 = value!;
                                              });
                                            }),
                                      ),
                                      Container(
                                        child: Text(
                                          "Spam",
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  55),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 8),
                                  height:
                                      MediaQuery.of(context).size.height / 40,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        child: Checkbox(
                                            value: this.value6,
                                            onChanged: (value) {
                                              setState(() {
                                                this.value6 = value!;
                                              });
                                            }),
                                      ),
                                      Container(
                                        child: Text(
                                          "illegal activity",
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  55),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 8),
                                  height:
                                      MediaQuery.of(context).size.height / 40,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        child: Checkbox(
                                            value: this.value7,
                                            onChanged: (value) {
                                              setState(() {
                                                this.value7 = value!;
                                              });
                                            }),
                                      ),
                                      Container(
                                        child: Text(
                                          "Abusive",
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  55),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 8),
                                  height:
                                      MediaQuery.of(context).size.height / 40,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        child: Checkbox(
                                            value: this.value1,
                                            onChanged: (value) {
                                              setState(() {
                                                this.value1 = value!;
                                              });
                                            }),
                                      ),
                                      Container(
                                        child: Text(
                                          "Other",
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  55),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
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
                              hintText: "Description (Optional)",
                              hintStyle: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 70),
                              border: InputBorder.none),
                        ),
                      ),
                    )
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
                              value.toString(),
                              value2.toString(),
                              value3.toString(),
                              value4.toString(),
                              value5.toString(),
                              value6.toString(),
                              value7.toString(),
                              value1.toString(),
                              context);
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
