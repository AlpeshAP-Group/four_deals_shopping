import 'package:cupertino_progress_bar/cupertino_progress_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_deals_shopping/Screens/CheckOutScreen.dart';
import 'package:four_deals_shopping/Screens/StoreProductDetailsScreen.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:toast/toast.dart';

import '../Controller/StoreDetailsViewModel.dart';

class StoreDetailsPageScreen extends StatefulWidget {
  String? storeid = null;
  StoreDetailsPageScreen(this.storeid);
  @override
  State<StoreDetailsPageScreen> createState() => StoreDetailsPageScreenState();
}

class StoreDetailsPageScreenState extends State<StoreDetailsPageScreen>
    with SingleTickerProviderStateMixin {
  double _ratingStar = 0;
  final email = TextEditingController();
  late String emails = "";
  late String follow = "";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductDetailsViewModel>.reactive(
        viewModelBuilder: () => ProductDetailsViewModel(),
        onModelReady: (model) => {
              model.fetchstoredetails(widget.storeid.toString()),
              model.fetchstoreproducts(widget.storeid.toString()),
              model.fetchstorecartlist(widget.storeid.toString()),
              model.fetchrattings(widget.storeid.toString()),
              model.storeid = widget.storeid.toString()
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
                    actions: [
                      GestureDetector(
                        onTap: () {
                          Toast.show("Coming Soon", context,
                              duration: Toast.LENGTH_SHORT,
                              gravity: Toast.BOTTOM);
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height / 25,
                          width: MediaQuery.of(context).size.width / 25,
                          margin: EdgeInsets.only(right: 20, left: 15),
                          child: Icon(
                            Icons.notifications,
                            color: Colors.black,
                          ),
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
                                  width: MediaQuery.of(context).size.width,
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
                                      image: DecorationImage(
                                          image:
                                              NetworkImage(model.bannerimage),
                                          fit: BoxFit.fill)),
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () {
                                            if (follow == "") {
                                              setState(() {
                                                follow = "Following";
                                                model.followuser(model.storeid,
                                                    "FOLLOW", context);
                                              });
                                            } else {
                                              setState(() {
                                                follow = "";
                                                model.followuser(model.storeid,
                                                    "UNFOLLOW", context);
                                              });
                                            }
                                          },
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                25,
                                            decoration: BoxDecoration(
                                                color: Color(0xff67A400)),
                                            child: Row(
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 12, right: 12),
                                                  child: (follow == "Following")
                                                      ? Text(
                                                          "Following",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  60),
                                                        )
                                                      : Text(
                                                          "Follow",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
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
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      model.logoimage)),
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
                                            onTap: () {},
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
                                                  color: Color(0xffACACAC),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              10)),
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
                        Container(
                          margin: EdgeInsets.only(top: 3),
                          child: Text(
                            "Member since : Jan, 2019",
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height / 50,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
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
                                        "40",
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
                                        "128",
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
                                        "4.0",
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
                                  showModalBottomSheet(
                                      context: context,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) {
                                        return Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              2.1,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight:
                                                      Radius.circular(20))),
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
                                                          "Store Cart",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Color(
                                                                  0xff707070)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 15),
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 1,
                                                  color: Color(0xff707070),
                                                ),
                                                Expanded(
                                                    child: Container(
                                                        child: ListView.builder(
                                                            itemCount: model
                                                                .storecartslist
                                                                .length,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    index) {
                                                              return Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        bottom:
                                                                            0),
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  boxShadow: [
                                                                    //background color of box
                                                                    BoxShadow(
                                                                      color: Colors
                                                                          .grey
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
                                                                          left:
                                                                              10,
                                                                          top:
                                                                              10,
                                                                          bottom:
                                                                              10),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: <
                                                                        Widget>[
                                                                      Container(
                                                                        height: MediaQuery.of(context).size.height /
                                                                            8.5,
                                                                        width:
                                                                            MediaQuery.of(context).size.width /
                                                                                4,
                                                                        decoration: BoxDecoration(
                                                                            color: Colors.white,
                                                                            borderRadius: BorderRadius.circular(10),
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
                                                                            image: DecorationImage(image: NetworkImage("https://aswagbuckets3.s3.me-south-1.amazonaws.com/${model.storecartslist[index].image}"), fit: BoxFit.fill)),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          margin: EdgeInsets.only(
                                                                              left: 10,
                                                                              right: 10),
                                                                          child:
                                                                              Column(
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
                                                                                        model.storecartslist[index].title,
                                                                                        style: TextStyle(color: Color(0xff707070), fontWeight: FontWeight.w700, fontSize: MediaQuery.of(context).size.height / 50),
                                                                                      ),
                                                                                    )),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                child: Container(
                                                                                  margin: EdgeInsets.only(top: 20),
                                                                                  child: Text(
                                                                                    "Price",
                                                                                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 60, color: Color(0xff707070)),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                margin: EdgeInsets.only(top: 5),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: <Widget>[
                                                                                    Container(
                                                                                      child: Text(
                                                                                        model.storecartslist[index].price,
                                                                                        style: TextStyle(color: Color(0xff707070), fontWeight: FontWeight.w700, fontSize: MediaQuery.of(context).size.height / 50),
                                                                                      ),
                                                                                    ),
                                                                                    GestureDetector(
                                                                                      onTap: () {
                                                                                        setState(() {
                                                                                          model.deletecart(model.storecartslist[index].cartid.toString(), model.storecartslist[index].storeid.toString(), context);
                                                                                        });
                                                                                      },
                                                                                      child: Container(
                                                                                        margin: EdgeInsets.only(left: 10),
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.circular(5),
                                                                                          color: Colors.white,
                                                                                          boxShadow: [
                                                                                            //background color of box
                                                                                            BoxShadow(
                                                                                              color: Colors.grey.withOpacity(0.3),
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
                                                                                          margin: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 5),
                                                                                          child: Row(
                                                                                            children: <Widget>[
                                                                                              Container(
                                                                                                margin: EdgeInsets.only(left: 5),
                                                                                                child: Text(
                                                                                                  "Remove",
                                                                                                  style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xffB3B3B3)),
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
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            }))),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                CheckOutScreen(
                                                                    widget
                                                                        .storeid
                                                                        .toString())));
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 30,
                                                        right: 30,
                                                        top: 20,
                                                        bottom: 20),
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            18,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Color(0xff2696CC),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: Center(
                                                      child: Text(
                                                        "Checkout",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      });
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
                                        "Cart",
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
                                        return GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          StoreProductDetailsScreen(
                                                              model
                                                                  .storeproducts[
                                                                      index]
                                                                  .adid
                                                                  .toString())));
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
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
                                                    left: 10,
                                                    top: 10,
                                                    bottom: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              6.5,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          boxShadow: [
                                                            //background color of box
                                                            BoxShadow(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.5),
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
                                                              fit:
                                                                  BoxFit.fill)),
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
                                                              child: Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left: 5,
                                                                        right:
                                                                            5,
                                                                        top: 5,
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
                                                                            child:
                                                                                Row(
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
                                                                            margin:
                                                                                EdgeInsets.only(left: 8),
                                                                            child:
                                                                                Row(
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
                                                    Expanded(
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10,
                                                            right: 10),
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
                                                                children: <
                                                                    Widget>[
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
                                                                          fontWeight: FontWeight
                                                                              .w700,
                                                                          fontSize:
                                                                              MediaQuery.of(context).size.height / 45),
                                                                    ),
                                                                  )),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 5),
                                                                child: Text(
                                                                  model
                                                                      .storeproducts[
                                                                          index]
                                                                      .description,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          MediaQuery.of(context).size.height /
                                                                              60,
                                                                      color: Color(
                                                                          0xff707070)),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 15),
                                                              child: Text(
                                                                "Price",
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xff707070),
                                                                    fontSize: MediaQuery.of(context)
                                                                            .size
                                                                            .height /
                                                                        60),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 10),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: <
                                                                    Widget>[
                                                                  Container(
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: <
                                                                          Widget>[
                                                                        Container(
                                                                          child:
                                                                              Text(
                                                                            model.storeproducts[index].amount,
                                                                            style: TextStyle(
                                                                                color: Color(0xff707070),
                                                                                fontSize: MediaQuery.of(context).size.height / 50,
                                                                                fontWeight: FontWeight.w700),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                            child:
                                                                                RatingBar.readOnly(
                                                                          filledIcon:
                                                                              Icons.star,
                                                                          emptyIcon:
                                                                              Icons.star,
                                                                          emptyColor:
                                                                              Colors.grey,
                                                                          filledColor:
                                                                              Colors.amber,
                                                                          size:
                                                                              13,
                                                                          maxRating:
                                                                              5,
                                                                        ))
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      model.addtocart(
                                                                          model
                                                                              .storeproducts[
                                                                                  index]
                                                                              .adid
                                                                              .toString(),
                                                                          model
                                                                              .storeproducts[index]
                                                                              .storeid
                                                                              .toString(),
                                                                          "1",
                                                                          context);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      margin: EdgeInsets.only(
                                                                          left:
                                                                              10),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                        color: Colors
                                                                            .white,
                                                                        boxShadow: [
                                                                          //background color of box
                                                                          BoxShadow(
                                                                            color:
                                                                                Color(0xff2696CC),
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
                                                                            top:
                                                                                5,
                                                                            left:
                                                                                5,
                                                                            bottom:
                                                                                5,
                                                                            right:
                                                                                5),
                                                                        child:
                                                                            Row(
                                                                          children: <
                                                                              Widget>[
                                                                            Container(
                                                                              child: Icon(
                                                                                Icons.shopping_cart,
                                                                                color: Color(0xff2696CC),
                                                                                size: MediaQuery.of(context).size.height / 43,
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              margin: EdgeInsets.only(left: 5),
                                                                              child: Text(
                                                                                "Add to Cart",
                                                                                style: TextStyle(color: Color(0xff2696CC), fontWeight: FontWeight.w600),
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
                                            ));
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
                                              "Fenti Shoe Shop",
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
                                              "Kuwait City",
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
                                              "+915-23344XX",
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
                ))));
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
