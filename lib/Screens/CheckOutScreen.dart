import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_deals_shopping/Screens/AddAddressCart.dart';
import 'package:four_deals_shopping/Screens/SelectAddressScreen.dart';
import 'package:stacked/stacked.dart';

import '../Controller/StoreDetailsViewModel.dart';

class CheckOutScreen extends StatefulWidget {
  String? storeid = null;
  CheckOutScreen(this.storeid);
  @override
  State<CheckOutScreen> createState() => CheckOutScreenState();
}

class CheckOutScreenState extends State<CheckOutScreen> {
  late int totalprice = 0;
  late int qunatity = 1;

  void addqunatity() {
    setState(() {
      qunatity++;
    });
  }

  void reducequnatity() {
    setState(() {
      qunatity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductDetailsViewModel>.reactive(
        viewModelBuilder: () => ProductDetailsViewModel(),
        onModelReady: (model) => {
              model.fetchstorecartlist(widget.storeid.toString()),
              model.storeid = widget.storeid.toString(),
            },
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xffF6F6F6),
                elevation: 3,
                titleSpacing: 0,
                title: Text("Store Cart",
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
              body: Container(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                              child: ListView.builder(
                                  itemCount: model.storecartslist.length,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (BuildContext context, index) {
                                    return Container(
                                      margin: EdgeInsets.only(bottom: 0),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          //background color of box
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
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
                                                  8.5,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
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
                                                          "https://aswagbuckets3.s3.me-south-1.amazonaws.com/${model.storecartslist[index].image}"),
                                                      fit: BoxFit.fill)),
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    left: 10, right: 10),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                      child: Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                              child: Container(
                                                            child: Text(
                                                              model
                                                                  .storecartslist[
                                                                      index]
                                                                  .title,
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
                                                          )),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            top: 20),
                                                        child: Text(
                                                          "Price",
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
                                                      margin: EdgeInsets.only(
                                                          top: 5),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Container(
                                                            child: Text(
                                                              model
                                                                  .storecartslist[
                                                                      index]
                                                                  .price,
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
                                                                    left: 10),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              color:
                                                                  Colors.white,
                                                              boxShadow: [
                                                                //background color of box
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .grey
                                                                      .withOpacity(
                                                                          0.3),
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
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 5,
                                                                      left: 5,
                                                                      bottom: 5,
                                                                      right: 5),
                                                              child: Row(
                                                                children: <
                                                                    Widget>[
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      model.updatecart(
                                                                          model
                                                                              .storecartslist[
                                                                                  index]
                                                                              .cartid
                                                                              .toString(),
                                                                          model.cartlist[index].quantity -
                                                                              1,
                                                                          context,
                                                                          "1");
                                                                    },
                                                                    child: SvgPicture
                                                                        .asset(
                                                                            "assets/images/minusiconss.svg"),
                                                                  ),
                                                                  Container(
                                                                    margin: EdgeInsets.only(
                                                                        left: 7,
                                                                        right:
                                                                            7),
                                                                    child: Text(
                                                                      model
                                                                          .storecartslist[
                                                                              index]
                                                                          .quantity
                                                                          .toString(),
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        model.updatecart(
                                                                            model.storecartslist[index].cartid
                                                                                .toString(),
                                                                            model.cartlist[index].quantity +
                                                                                1,
                                                                            context,
                                                                            "1");
                                                                      });
                                                                    },
                                                                    child: SvgPicture
                                                                        .asset(
                                                                            "assets/images/plushliness.svg"),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  })),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 10, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              "Sub Total",
                              style: TextStyle(
                                  color: Color(0xffADADAD),
                                  fontSize:
                                      MediaQuery.of(context).size.height / 50),
                            ),
                          ),
                          Container(
                            child: Text(
                              "240.00 KD",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 45,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: EdgeInsets.only(right: 15),
                        child: Text(
                          "(Total doesn't include shipping charges)",
                          style: TextStyle(
                              color: Color(0xffADADAD),
                              fontSize:
                                  MediaQuery.of(context).size.height / 55),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => AddAddressCartScreen()));

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectAddressScreen(
                                    widget.storeid.toString())));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 30, right: 30, top: 20, bottom: 20),
                        height: MediaQuery.of(context).size.height / 18,
                        decoration: BoxDecoration(
                            color: Color(0xff2696CC),
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            "Checkout",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height / 15,
                            top: 20),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Continue Shopping",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              45,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: SvgPicture.asset(
                                    "assets/images/arroebottomicons.svg"),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  "Swipe Down",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              55,
                                      color: Color(0xffB3B3B3)),
                                ),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ));
  }
}
