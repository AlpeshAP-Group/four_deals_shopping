import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_deals_shopping/Controller/VariantProductDetailsVIewModel.dart';
import 'package:four_deals_shopping/Screens/ChatMessageActivity.dart';
import 'package:four_deals_shopping/Screens/ProductDetailsPage.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:toast/toast.dart';

class BrandProductDetailsScreen extends StatefulWidget {
  String? categoryid = null;
  String? subcatid = null;
  String? subcatpname = null;
  BrandProductDetailsScreen(this.categoryid, this.subcatid, this.subcatpname);
  @override
  State<BrandProductDetailsScreen> createState() =>
      BrandProductDetailsScreenState();
}

class BrandProductDetailsScreenState extends State<BrandProductDetailsScreen> {
  late String zoom = "";
  String radioButtonItem = "";

  SfRangeValues _values = SfRangeValues(40.0, 80.0);

  int id = 0;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VariantProductDetails>.reactive(
        viewModelBuilder: () => VariantProductDetails(),
        onModelReady: (model) => {
              model.fetchvariantproduct(
                  widget.categoryid.toString(), widget.subcatid.toString())
            },
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
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
                title: Text(
                  widget.subcatpname.toString(),
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 45,
                      color: Colors.black),
                ),
              ),
              body: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 0.5,
                      color: Colors.grey,
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            height: MediaQuery.of(context).size.height / 20,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                          context: context,
                                          backgroundColor: Colors.transparent,
                                          builder: (context) {
                                            return Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  2.5,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20))),
                                              child: Container(
                                                child: Column(
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 15,
                                                          left: 15,
                                                          right: 15),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Container(
                                                            child: Text(
                                                              "Sorting",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Color(
                                                                      0xff707070)),
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: Icon(Icons
                                                                .cancel_outlined),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 15),
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height: 1,
                                                      color: Color(0xff707070),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 20,
                                                          left: 20,
                                                          right: 20),
                                                      child: Column(
                                                        children: <Widget>[
                                                          Container(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: <
                                                                  Widget>[
                                                                Container(
                                                                  child: Text(
                                                                      "Most Popular",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          color:
                                                                              Color(0xff707070))),
                                                                ),
                                                                Radio(
                                                                  value: 1,
                                                                  groupValue:
                                                                      id,
                                                                  activeColor:
                                                                      Colors
                                                                          .black,
                                                                  onChanged:
                                                                      (val) {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                    _handleRadioValueChange(val
                                                                        as int);
                                                                    setState(
                                                                        () {
                                                                      radioButtonItem =
                                                                          'Male';

                                                                      // id = val
                                                                      //     as int;
                                                                    });
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: <
                                                                  Widget>[
                                                                Container(
                                                                  child: Text(
                                                                      "Price (Low to High)",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          color:
                                                                              Color(0xff707070))),
                                                                ),
                                                                Radio(
                                                                  value: 2,
                                                                  groupValue:
                                                                      id,
                                                                  activeColor:
                                                                      Colors
                                                                          .black,
                                                                  onChanged:
                                                                      (val) {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                    _handleRadioValueChange(val
                                                                        as int);
                                                                    setState(
                                                                        () {
                                                                      radioButtonItem =
                                                                          'Male';
                                                                    });
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: <
                                                                  Widget>[
                                                                Container(
                                                                  child: Text(
                                                                      "Price (High to Low)",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          color:
                                                                              Color(0xff707070))),
                                                                ),
                                                                Radio(
                                                                  value: 3,
                                                                  groupValue:
                                                                      id,
                                                                  activeColor:
                                                                      Colors
                                                                          .black,
                                                                  onChanged:
                                                                      (val) {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                    _handleRadioValueChange(val
                                                                        as int);
                                                                    setState(
                                                                        () {
                                                                      radioButtonItem =
                                                                          'Male';
                                                                    });
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: <
                                                                  Widget>[
                                                                Container(
                                                                  child: Text(
                                                                      "Rating (High to Low)",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          color:
                                                                              Color(0xff707070))),
                                                                ),
                                                                Radio(
                                                                  value: 4,
                                                                  groupValue:
                                                                      id,
                                                                  activeColor:
                                                                      Colors
                                                                          .black,
                                                                  onChanged:
                                                                      (val) {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                    _handleRadioValueChange(val
                                                                        as int);
                                                                    setState(
                                                                        () {
                                                                      radioButtonItem =
                                                                          'Male';
                                                                    });
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                40,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                40,
                                            child: SvgPicture.asset(
                                                "assets/images/updownicons.svg"),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 5),
                                            child: Text(
                                              "Sorting",
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          60,
                                                  color: Color(0xff707070),
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 20,
                                  width: 0.5,
                                  color: Colors.grey,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      showFlexibleBottomSheet(
                                          context: context,
                                          builder: _buildBottomSheet);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                40,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                40,
                                            child: SvgPicture.asset(
                                                "assets/images/filtericons.svg"),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 5),
                                            child: Text(
                                              "Filters",
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          60,
                                                  color: Color(0xff707070),
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                          Container(
                            height: MediaQuery.of(context).size.height / 20,
                            width: 0.5,
                            color: Colors.grey,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (zoom == "") {
                                  zoom = "ViewAll";
                                } else {
                                  zoom = "";
                                }
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 5,
                              child: Container(
                                height: MediaQuery.of(context).size.height / 43,
                                width: MediaQuery.of(context).size.height / 43,
                                child: (zoom == "")
                                    ? SvgPicture.asset(
                                        "assets/images/viewalliconss.svg")
                                    : SvgPicture.asset(
                                        "assets/images/viewallicons.svg"),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 0.5,
                      color: Colors.grey,
                    ),
                    Expanded(
                        child: (zoom == "")
                            ? Container(
                                margin: EdgeInsets.only(top: 20),
                                child: ListView.builder(
                                    itemCount: model.variantproductlist.length,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (BuildContext context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProductDetailsPage(model
                                                          .variantproductlist[
                                                              index]
                                                          .adid
                                                          .toString())));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(bottom: 20),
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
                                                              "https://aswagbuckets3.s3.me-south-1.amazonaws.com/${model.variantproductlist[index].thumnailimage}"),
                                                          fit: BoxFit.fill)),
                                                  child: Stack(
                                                    children: <Widget>[
                                                      Container(
                                                        child: Row(
                                                          children: <Widget>[
                                                            Align(
                                                              alignment: Alignment
                                                                  .bottomLeft,
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.only(
                                                                        bottomLeft: Radius.circular(
                                                                          10,
                                                                        ),
                                                                        topRight: Radius.circular(
                                                                          10,
                                                                        )),
                                                                    color: Color(0xffCFCFCF).withOpacity(0.5)),
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              5,
                                                                          right:
                                                                              5,
                                                                          top:
                                                                              5,
                                                                          bottom:
                                                                              5),
                                                                  child: Row(
                                                                    children: <
                                                                        Widget>[
                                                                      Container(
                                                                        child:
                                                                            Row(
                                                                          children: <
                                                                              Widget>[
                                                                            Container(
                                                                              child: Row(
                                                                                children: <Widget>[
                                                                                  Container(
                                                                                    child: Icon(
                                                                                      Icons.camera,
                                                                                      color: Colors.white,
                                                                                      size: MediaQuery.of(context).size.height / 60,
                                                                                    ),
                                                                                  ),
                                                                                  Container(
                                                                                    margin: EdgeInsets.only(left: 5),
                                                                                    child: Text(
                                                                                      "10",
                                                                                      style: TextStyle(
                                                                                        fontSize: MediaQuery.of(context).size.height / 70,
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              margin: EdgeInsets.only(left: 8),
                                                                              child: Row(
                                                                                children: <Widget>[
                                                                                  Container(
                                                                                    child: Icon(
                                                                                      Icons.message,
                                                                                      size: MediaQuery.of(context).size.height / 60,
                                                                                      color: Colors.white,
                                                                                    ),
                                                                                  ),
                                                                                  Container(
                                                                                    margin: EdgeInsets.only(left: 5, right: 5),
                                                                                    child: Text(
                                                                                      "10",
                                                                                      style: TextStyle(
                                                                                        fontSize: MediaQuery.of(context).size.height / 70,
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                    ),
                                                                                  )
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
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Align(
                                                          alignment: Alignment
                                                              .topRight,
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 6,
                                                                    right: 6),
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                30,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                15,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30),
                                                                color: Colors
                                                                    .white
                                                                    .withOpacity(
                                                                        0.5)),
                                                            child: Center(
                                                              child: Icon(
                                                                Icons
                                                                    .bookmark_outline,
                                                                size: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    40,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
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
                                                                      .variantproductlist[
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
                                                              Container(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    25,
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    25,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30),
                                                                    image: DecorationImage(
                                                                        image: AssetImage(
                                                                            "assets/images/carimages.png"),
                                                                        fit: BoxFit
                                                                            .fill)),
                                                              )
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
                                                                  .variantproductlist[
                                                                      index]
                                                                  .descriptions,
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
                                                                  top: 5),
                                                          child: Text(
                                                            model
                                                                .variantproductlist[
                                                                    index]
                                                                .sellingprice,
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xff707070),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    50),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 10),
                                                          child: Row(
                                                            children: <Widget>[
                                                              GestureDetector(
                                                                onTap:
                                                                    () async {
                                                                  bool? res = await FlutterPhoneDirectCaller.callNumber(model
                                                                      .variantproductlist[
                                                                          index]
                                                                      .mobile);
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                    color: Color(
                                                                        0xff67A400),
                                                                    boxShadow: [
                                                                      //background color of box
                                                                      BoxShadow(
                                                                        color: Colors
                                                                            .black
                                                                            .withOpacity(0.5),
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
                                                                    margin: EdgeInsets.only(
                                                                        top: 5,
                                                                        left: 5,
                                                                        bottom:
                                                                            5,
                                                                        right:
                                                                            10),
                                                                    child: Row(
                                                                      children: <
                                                                          Widget>[
                                                                        Container(
                                                                          child:
                                                                              Icon(
                                                                            Icons.call,
                                                                            color:
                                                                                Colors.white,
                                                                            size:
                                                                                MediaQuery.of(context).size.height / 43,
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          margin:
                                                                              EdgeInsets.only(left: 5),
                                                                          child:
                                                                              Text(
                                                                            model.variantproductlist[index].mobile,
                                                                            style:
                                                                                TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                                                                          ),
                                                                        )
                                                                      ],
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
                                                                              model.variantproductlist[index].adid.toString(),
                                                                              model.variantproductlist[index].userfirstname,
                                                                              "")));
                                                                },
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              10),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                    color: Colors
                                                                        .white,
                                                                    boxShadow: [
                                                                      //background color of box
                                                                      BoxShadow(
                                                                        color: Colors
                                                                            .black
                                                                            .withOpacity(0.5),
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
                                                                    margin: EdgeInsets.only(
                                                                        top: 5,
                                                                        left: 5,
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
                                                                            Icons.chat,
                                                                            size:
                                                                                MediaQuery.of(context).size.height / 43,
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          margin:
                                                                              EdgeInsets.only(left: 5),
                                                                          child:
                                                                              Text(
                                                                            "Chat",
                                                                            style:
                                                                                TextStyle(fontWeight: FontWeight.w600),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
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
                                        ),
                                      );
                                    }))
                            : Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: GridView.count(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 0,
                                  mainAxisSpacing: 0,
                                  childAspectRatio: 2 / 2.5,
                                  controller: new ScrollController(
                                      keepScrollOffset: false),
                                  scrollDirection: Axis.vertical,
                                  children: model.variantproductlist.map((e) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductDetailsPage(
                                                        e.adid.toString())));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: 10,
                                            right: 5,
                                            top: 10,
                                            bottom: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            //background color of box
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
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
                                        ),
                                        child: Container(
                                          child: Column(
                                            children: <Widget>[
                                              Expanded(
                                                  child: Container(
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            "https://aswagbuckets3.s3.me-south-1.amazonaws.com/${e.thumnailimage}"),
                                                        fit: BoxFit.fill)),
                                                child: Align(
                                                  alignment: Alignment.topRight,
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        top: 6, right: 6),
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            30,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            13,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        color: Colors.white
                                                            .withOpacity(0.5)),
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.bookmark_outline,
                                                        size: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            40,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )),
                                              Container(
                                                margin: EdgeInsets.only(top: 5),
                                                child: Text(
                                                  e.title,
                                                  style: TextStyle(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              60,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 5),
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    25,
                                                child: Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            25,
                                                        decoration:
                                                            BoxDecoration(
                                                                boxShadow: [
                                                              //background color of box
                                                              BoxShadow(
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.5),
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
                                                                color: Color(
                                                                    0xff67A400),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          10),
                                                                )),
                                                        child: Container(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: <Widget>[
                                                              Container(
                                                                child: Icon(
                                                                  Icons.call,
                                                                  color: Colors
                                                                      .white,
                                                                  size: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height /
                                                                      43,
                                                                ),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            5),
                                                                child: Text(
                                                                  "Call",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
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
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    ChatMessageActivity(
                                                                        e.adid
                                                                            .toString(),
                                                                        e.userfirstname
                                                                            .toString(),
                                                                        "")));
                                                      },
                                                      child: Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            25,
                                                        decoration: BoxDecoration(
                                                            boxShadow: [
                                                              //background color of box
                                                              BoxShadow(
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.5),
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
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius.only(
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            10))),
                                                        child: Container(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: <Widget>[
                                                              Container(
                                                                child: Icon(
                                                                  Icons.chat,
                                                                  color: Color(
                                                                      0xff707070),
                                                                  size: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height /
                                                                      43,
                                                                ),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            5),
                                                                child: Text(
                                                                  "Chat",
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xff707070),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ))
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                )))
                  ],
                ),
              ),
            ));
  }

  Widget _buildBottomSheet(
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    return Material(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Sorting",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff707070)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.cancel_outlined),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: Color(0xff707070),
            ),
            Container(
              margin: EdgeInsets.only(top: 12, left: 15),
              child: Text(
                "Category",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff707070)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12, left: 15),
              child: Text(
                "Price",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff707070)),
              ),
            ),
            Container(
              child: SfRangeSlider(
                min: 0.0,
                max: 100.0,
                values: _values,
                interval: 20,
                showTicks: true,
                showLabels: true,
                labelPlacement: LabelPlacement.betweenTicks,
                dateIntervalType: DateIntervalType.years,
                enableTooltip: true,
                dragMode: SliderDragMode.both,
                enableIntervalSelection: true,
                minorTicksPerInterval: 1,
                onChanged: (SfRangeValues values) {
                  setState(() {
                    _values == values;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      id = value;
    });
    print("first" + value.toString() + "radiovalue" + id.toString());
  }
}
