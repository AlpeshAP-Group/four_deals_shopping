import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_deals_shopping/Controller/HomeHragmentViewModel.dart';
import 'package:four_deals_shopping/Models/GetCategoryModel.dart';
import 'package:four_deals_shopping/Models/HorDealsListModel.dart';
import 'package:four_deals_shopping/Screens/CategoryDetailsPageScreen.dart';
import 'package:four_deals_shopping/Screens/ChatMessageActivity.dart';
import 'package:four_deals_shopping/Screens/Fragments/ChatFragment.dart';
import 'package:four_deals_shopping/Screens/Fragments/HomeFragment2.dart';
import 'package:four_deals_shopping/Screens/Fragments/MyAccountFragment.dart';
import 'package:four_deals_shopping/Screens/NotificationScreen.dart';
import 'package:four_deals_shopping/Screens/SeacrhScreen.dart';
import 'package:four_deals_shopping/Screens/StoreDetailsPageScreen.dart';
import 'package:four_deals_shopping/Screens/StoreProductDetailsScreen.dart';
import 'package:four_deals_shopping/Screens/UpgradYouPlanScreen2.dart';
import 'package:four_deals_shopping/Screens/UploadProductScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

// hello
class HomeFragment extends StatefulWidget {
  int? index = null;

  HomeFragment(this.index);
  @override
  State<HomeFragment> createState() => HomeFragmentState();
}

class HomeFragmentState extends State<HomeFragment> {
  late String categorytext = "Category";
  final CarouselController _controller = CarouselController();
  dynamic selected;
  var heart = false;
  late String resulr = "";
  int _currentIndex = 0;
  int _currentIndex2 = 0;
  List<Widget> _screens = [];

  @override
  void initState() {
    setindex();
    super.initState();
  }

  void setindex() {
    setState(() {
      _currentIndex = widget.index!;
    });
  }

  final ScrollController _scrollController = ScrollController();

  final _firebaseRef = FirebaseDatabase().reference().child("Viewed");

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeFragmentViewModel>.reactive(
        viewModelBuilder: () => HomeFragmentViewModel(),
        onModelReady: (model) => {
              model.fetchstatelist(),
              model.fetchstorelist(),
              model.fetchbannerads(),
              model.fetchhotdeals(),
              model.fetchmyprofile(),
              model.getfirebase(),
            },
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              elevation: 0,
              actions: [
                GestureDetector(
                  onTap: () {
                    Toast.show("Coming Soon", context,
                        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 25,
                    width: MediaQuery.of(context).size.width / 25,
                    child: SvgPicture.asset("assets/images/bookmarkimae.svg"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationScreen()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 25,
                    width: MediaQuery.of(context).size.width / 25,
                    margin: EdgeInsets.only(right: 20, left: 15),
                    child:
                        SvgPicture.asset("assets/images/notificationicon.svg"),
                  ),
                )
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/appbarbackground.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
              ),
              leadingWidth: 80,
              titleSpacing: 0,
              title: Container(
                child: Container(
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.width / 2.5,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/dashboardappbaricons.png"),
                          fit: BoxFit.fill)),
                ),
              ),
              leading: Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchScreen()));
                        },
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            floatingActionButton: const SizedBox(
              height: 60,
              width: 60,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: Container(
                color: Colors.transparent,
                child: (categorytext == "Store")
                    ? Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 28.7),
                        child: Scaffold(
                          appBar: AppBar(
                            elevation: 0,
                            actions: [
                              GestureDetector(
                                onTap: () {
                                  Toast.show("Coming Soon", context,
                                      duration: Toast.LENGTH_SHORT,
                                      gravity: Toast.BOTTOM);
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 25,
                                  width: MediaQuery.of(context).size.width / 25,
                                  child: SvgPicture.asset(
                                      "assets/images/bookmarkimae.svg"),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NotificationScreen()));
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 25,
                                  width: MediaQuery.of(context).size.width / 25,
                                  margin: EdgeInsets.only(right: 20, left: 15),
                                  child: SvgPicture.asset(
                                      "assets/images/notificationicon.svg"),
                                ),
                              )
                            ],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                            ),
                            flexibleSpace: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/appbarbackground.png'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                              ),
                            ),
                            leadingWidth: 80,
                            titleSpacing: 0,
                            title: Container(
                              child: Container(
                                height: MediaQuery.of(context).size.height / 20,
                                width: MediaQuery.of(context).size.width / 2.5,
                                margin: EdgeInsets.symmetric(horizontal: 30),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/dashboardappbaricons.png"),
                                        fit: BoxFit.fill)),
                              ),
                            ),
                            leading: Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SearchScreen()));
                                      },
                                      child: Icon(
                                        Icons.search,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          body: Container(
                            color: Colors.transparent,
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: CarouselSlider(
                                    carouselController: _controller,
                                    options: CarouselOptions(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      autoPlay: true,
                                      enlargeCenterPage: true,
                                    ),
                                    items: model.adsbannerlist.map((i) {
                                      return Builder(
                                        builder: (BuildContext context) {
                                          return GestureDetector(
                                            onTap: () {
                                              if (i.RedirectType ==
                                                  "STORE_PAGE") {
                                                // Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //         builder: (context) =>
                                                //             StoreDetailsPageScreen(i
                                                //                 .bannerid
                                                //                 .toString())));
                                              } else {
                                                final Uri _url =
                                                    Uri.parse(i.Redirectvalue);
                                                _launchUrl(_url);
                                              }
                                              print(
                                                  "HELLOPPSSS${i.RedirectType}");
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5.0),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.white,
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          "https://aswagbuckets3.s3.me-south-1.amazonaws.com/${i.bannerimage}"),
                                                      fit: BoxFit.fill)),
                                            ),
                                          );
                                        },
                                      );
                                    }).toList(),
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 15,
                                  child: ListView.builder(
                                      itemCount: 1,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        return Container(
                                          margin: EdgeInsets.only(
                                              left: 20, top: 15, right: 20),
                                          child: Row(
                                            children: <Widget>[
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    categorytext = "Category";
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    boxShadow: [
                                                      //background color of box
                                                      BoxShadow(
                                                        color: Colors.grey,
                                                        blurRadius:
                                                            3.0, // soften the shadow
                                                        spreadRadius:
                                                            1.0, //extend the shadow
                                                        offset: Offset(
                                                          0.0, // Move to right 10  horizontally
                                                          2.0, // Move to bottom 10 Vertically
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 5,
                                                        left: 8,
                                                        right: 8),
                                                    child: Row(
                                                      children: <Widget>[
                                                        Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              60,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              60,
                                                          child: (categorytext ==
                                                                  "Category")
                                                              ? SvgPicture.asset(
                                                                  "assets/images/categoriesicon.svg")
                                                              : SvgPicture.asset(
                                                                  "assets/images/categoryiconblack.svg"),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 5),
                                                          child: Text(
                                                            "Categories",
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                color: (categorytext ==
                                                                        "Category")
                                                                    ? Color(
                                                                        0xff2696CC)
                                                                    : Color(
                                                                        0xff707070)),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    categorytext = "Store";
                                                  });
                                                },
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    boxShadow: [
                                                      //background color of box
                                                      BoxShadow(
                                                        color: Colors.grey,
                                                        blurRadius:
                                                            3.0, // soften the shadow
                                                        spreadRadius:
                                                            1.0, //extend the shadow
                                                        offset: Offset(
                                                          0.0, // Move to right 10  horizontally
                                                          2.0, // Move to bottom 10 Vertically
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 5,
                                                        left: 8,
                                                        right: 8),
                                                    child: Row(
                                                      children: <Widget>[
                                                        Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              60,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              60,
                                                          child: (categorytext ==
                                                                  "Store")
                                                              ? SvgPicture.asset(
                                                                  "assets/images/storeiconblue.svg")
                                                              : SvgPicture.asset(
                                                                  "assets/images/storeicon.svg"),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 5),
                                                          child: Text(
                                                            "Store",
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                color: (categorytext ==
                                                                        "Store")
                                                                    ? Color(
                                                                        0xff2696CC)
                                                                    : Color(
                                                                        0xff707070)),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    categorytext = "Hot Deals";
                                                  });
                                                },
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    boxShadow: [
                                                      //background color of box
                                                      BoxShadow(
                                                        color: Colors.grey,
                                                        blurRadius:
                                                            3.0, // soften the shadow
                                                        spreadRadius:
                                                            1.0, //extend the shadow
                                                        offset: Offset(
                                                          0.0, // Move to right 10  horizontally
                                                          2.0, // Move to bottom 10 Vertically
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 5,
                                                        left: 8,
                                                        right: 8),
                                                    child: Row(
                                                      children: <Widget>[
                                                        Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              60,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              60,
                                                          child: (categorytext ==
                                                                  "Hot Deals")
                                                              ? SvgPicture.asset(
                                                                  "assets/images/hotdealsiconblue.svg")
                                                              : SvgPicture.asset(
                                                                  "assets/images/hotdealsicon.svg"),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 5),
                                                          child: Text(
                                                            "Hot Deals",
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                color: (categorytext ==
                                                                        "Hot Deals")
                                                                    ? Color(
                                                                        0xff2696CC)
                                                                    : Color(
                                                                        0xff707070)),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    categorytext = "Viewed";
                                                  });
                                                },
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    boxShadow: [
                                                      //background color of box
                                                      BoxShadow(
                                                        color: Colors.grey,
                                                        blurRadius:
                                                            3.0, // soften the shadow
                                                        spreadRadius:
                                                            1.0, //extend the shadow
                                                        offset: Offset(
                                                          0.0, // Move to right 10  horizontally
                                                          2.0, // Move to bottom 10 Vertically
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 5,
                                                        left: 8,
                                                        right: 8),
                                                    child: Row(
                                                      children: <Widget>[
                                                        Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              60,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              60,
                                                          child: (categorytext ==
                                                                  "Viewed")
                                                              ? SvgPicture.asset(
                                                                  "assets/images/viewiconblue.svg")
                                                              : SvgPicture.asset(
                                                                  "assets/images/viewdicons.svg"),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 5),
                                                          child: Text(
                                                            "Viewed",
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                color: (categorytext ==
                                                                        "Viewed")
                                                                    ? Color(
                                                                        0xff2696CC)
                                                                    : Color(
                                                                        0xff707070)),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      }),
                                ),
                                (categorytext == "Category")
                                    ? categorydridview(model.catlist)
                                    : Expanded(
                                        child: (categorytext == "Store")
                                            ? Column(children: <Widget>[
                                                Expanded(
                                                    child: Container(
                                                  child: Stack(
                                                    children: <Widget>[
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            bottom: 40),
                                                        child: Column(
                                                          children: <Widget>[
                                                            Expanded(
                                                              child: ListView
                                                                  .builder(
                                                                      itemCount: model
                                                                          .storelists
                                                                          .length,
                                                                      scrollDirection:
                                                                          Axis
                                                                              .vertical,
                                                                      itemBuilder:
                                                                          (BuildContext context,
                                                                              index) {
                                                                        return GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            Navigator.push(context,
                                                                                MaterialPageRoute(builder: (context) => StoreDetailsPageScreen(model.storelists[index].storeid.toString())));
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            margin: EdgeInsets.only(
                                                                                left: 20,
                                                                                top: 10,
                                                                                right: 20,
                                                                                bottom: 10),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.circular(10),
                                                                              boxShadow: [
                                                                                //background color of box
                                                                                BoxShadow(
                                                                                  color: Colors.grey.withOpacity(0.5),
                                                                                  blurRadius: 2, // soften the shadow
                                                                                  spreadRadius: 2, //extend the shadow
                                                                                  offset: Offset(
                                                                                    0.0, // Move to right 10  horizontally
                                                                                    2.5, // Move to bottom 10 Vertically
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            ),
                                                                            child:
                                                                                Stack(
                                                                              children: <Widget>[
                                                                                Container(
                                                                                  child: Column(
                                                                                    children: <Widget>[
                                                                                      Container(height: MediaQuery.of(context).size.height / 6, width: MediaQuery.of(context).size.width, decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)), image: DecorationImage(image: NetworkImage("https://aswagbuckets3.s3.me-south-1.amazonaws.com/${model.storelists[index].bannerimage}"), fit: BoxFit.fill))),
                                                                                      Container(
                                                                                        margin: EdgeInsets.only(bottom: 10),
                                                                                        color: Colors.white,
                                                                                        child: Row(
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: <Widget>[
                                                                                            Container(
                                                                                              width: MediaQuery.of(context).size.width / 4.5,
                                                                                            ),
                                                                                            Expanded(
                                                                                                child: Column(
                                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: <Widget>[
                                                                                                Container(
                                                                                                  margin: EdgeInsets.only(top: 5),
                                                                                                  child: Text(
                                                                                                    model.storelists[index].storename,
                                                                                                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 50, fontWeight: FontWeight.w600),
                                                                                                  ),
                                                                                                ),
                                                                                                Container(
                                                                                                  margin: EdgeInsets.only(top: 10, right: 10),
                                                                                                  child: Row(
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: <Widget>[
                                                                                                      Container(
                                                                                                        child: Row(
                                                                                                          children: <Widget>[
                                                                                                            Container(
                                                                                                              child: SvgPicture.asset("assets/images/locationiconss.svg"),
                                                                                                            ),
                                                                                                            Container(
                                                                                                              margin: EdgeInsets.only(left: 10),
                                                                                                              child: Text(
                                                                                                                model.storelists[index].address,
                                                                                                                style: TextStyle(
                                                                                                                  fontSize: MediaQuery.of(context).size.height / 55,
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Container(
                                                                                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), border: Border.all(width: 1, color: Colors.black.withOpacity(0.5))),
                                                                                                        child: Container(
                                                                                                          margin: EdgeInsets.only(top: 3, bottom: 3, left: 3, right: 3),
                                                                                                          child: Row(
                                                                                                            children: <Widget>[
                                                                                                              Container(
                                                                                                                child: Text(
                                                                                                                  "Ad Posts :",
                                                                                                                  style: TextStyle(
                                                                                                                    fontSize: MediaQuery.of(context).size.height / 68,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Container(
                                                                                                                margin: EdgeInsets.only(left: 5),
                                                                                                                child: Text(
                                                                                                                  "84",
                                                                                                                  style: TextStyle(
                                                                                                                    fontSize: MediaQuery.of(context).size.height / 62,
                                                                                                                  ),
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
                                                                                            ))
                                                                                          ],
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: Alignment.bottomLeft,
                                                                                  child: Container(
                                                                                    margin: EdgeInsets.only(top: 90, left: 10),
                                                                                    height: MediaQuery.of(context).size.height / 12,
                                                                                    width: MediaQuery.of(context).size.height / 12,
                                                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), image: DecorationImage(image: NetworkImage("https://aswagbuckets3.s3.me-south-1.amazonaws.com/${model.storelists[index].bannerimage}"), fit: BoxFit.fill)),
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }),
                                                            ),
                                                            Container()
                                                          ],
                                                        ),
                                                      ),
                                                      Align(
                                                          alignment: Alignment
                                                              .bottomCenter,
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              UpgradeYourPlanScreenTwo()));
                                                              // Navigator.push(
                                                              //     context,
                                                              //     MaterialPageRoute(
                                                              //         builder:
                                                              //             (context) =>
                                                              //                 UpgradeYouPlanActivity()));
                                                            },
                                                            child: Container(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  15,
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  1.8,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              25),
                                                                  color: Color(
                                                                      0xff67A400)),
                                                              child: Container(
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: <
                                                                      Widget>[
                                                                    Container(),
                                                                    Container(
                                                                        child: Text(
                                                                            "Open Your Shop Here",
                                                                            style: TextStyle(
                                                                                fontSize: MediaQuery.of(context).size.height / 60,
                                                                                color: Colors.white,
                                                                                fontWeight: FontWeight.w600)))
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                )),
                                              ])
                                            : Container(
                                                child: (categorytext ==
                                                        "Hot Deals")
                                                    ? Container(
                                                        child: Text(
                                                            "Hot Dealsdsdsdds"),
                                                      )
                                                    : Container(
                                                        child: Text("Viewed"),
                                                      ),
                                              ),
                                      )
                              ],
                            ),
                          ),
                        ))
                    : Container(
                        child: (categorytext == "Hot Deals")
                            ? Container(
                                height: 10,
                              )
                            : Container(
                                child: (categorytext == "Viewed")
                                    ? Container(
                                        height: 10,
                                      )
                                    : AnimatedBottomNavigationBar(
                                        bottomBarItems: [
                                          BottomBarItemsModel(
                                            icon: Container(
                                                height: 20,
                                                width: 20,
                                                child: SvgPicture.asset(
                                                    "assets/images/homeicondashboard.svg")),
                                            iconSelected: Container(
                                                height: 20,
                                                width: 20,
                                                child: SvgPicture.asset(
                                                    "assets/images/homeicondashboard.svg")),
                                            title: "Home",
                                            dotColor: Colors.red,
                                            onTap: () {
                                              setState(() {
                                                _currentIndex = 0;
                                                _currentIndex2 = 0;
                                              });
                                            },
                                          ),
                                          BottomBarItemsModel(
                                            icon: Container(
                                              height: 20,
                                              width: 20,
                                              child: SvgPicture.asset(
                                                  "assets/images/storeicon.svg"),
                                            ),
                                            iconSelected: Container(
                                              height: 20,
                                              width: 20,
                                              child: SvgPicture.asset(
                                                  "assets/images/storeicon.svg"),
                                            ),
                                            title: "Store",
                                            dotColor: Colors.red,
                                            onTap: () {
                                              setState(() {
                                                _currentIndex = 1;
                                                _currentIndex2 = 1;
                                              });
                                            },
                                          ),
                                          BottomBarItemsModel(
                                            icon: Container(
                                              height: 20,
                                              width: 20,
                                              child: SvgPicture.asset(
                                                  "assets/images/chaticondashboard.svg"),
                                            ),
                                            iconSelected: Container(
                                              height: 20,
                                              width: 20,
                                              child: SvgPicture.asset(
                                                  "assets/images/chaticondashboard.svg"),
                                            ),
                                            title: "Chat",
                                            dotColor: Colors.red,
                                            onTap: () {
                                              setState(() {
                                                _currentIndex = 2;
                                                _currentIndex2 = 2;
                                              });
                                            },
                                          ),
                                          BottomBarItemsModel(
                                            icon: Container(
                                              height: 20,
                                              width: 20,
                                              child: SvgPicture.asset(
                                                  "assets/images/accounticonsdashboard.svg"),
                                            ),
                                            iconSelected: Container(
                                              height: 20,
                                              width: 20,
                                              child: SvgPicture.asset(
                                                  "assets/images/accounticonsdashboard.svg"),
                                            ),
                                            title: "Account",
                                            dotColor: Colors.red,
                                            onTap: () async {
                                              _navigateAndDisplaySelection(
                                                  context);
                                            },
                                          ),
                                        ],
                                        bottomBarCenterModel:
                                            BottomBarCenterModel(
                                          centerBackgroundColor:
                                              Color(0xff0178AE),
                                          centerIcon:
                                              const FloatingCenterButton(
                                            child: Icon(
                                              Icons.add,
                                              color: AppColors.white,
                                            ),
                                          ),
                                          centerIconChild: [
                                            FloatingCenterButtonChild(
                                              child: const Icon(
                                                Icons.cancel,
                                                color: Colors.white,
                                              ),
                                              onTap: () {},
                                            ),
                                            FloatingCenterButtonChild(
                                              child: const Icon(
                                                Icons.add,
                                                color: AppColors.white,
                                              ),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            UploadProductScreen()));
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                              ))),
            body: Container(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: (categorytext == "Store")
                      ? Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: CarouselSlider(
                                  carouselController: _controller,
                                  options: CarouselOptions(
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    autoPlay: true,
                                    enlargeCenterPage: true,
                                  ),
                                  items: model.adsbannerlist.map((i) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return GestureDetector(
                                          onTap: () {
                                            if (i.RedirectType ==
                                                "STORE_PAGE") {
                                              // Navigator.push(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: (context) =>
                                              //             StoreDetailsPageScreen(i
                                              //                 .bannerid
                                              //                 .toString())));
                                            } else {
                                              final Uri _url =
                                                  Uri.parse(i.Redirectvalue);
                                              _launchUrl(_url);
                                            }
                                            print(
                                                "HELLOPPSSS${i.RedirectType}");
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.white,
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        "https://aswagbuckets3.s3.me-south-1.amazonaws.com/${i.bannerimage}"),
                                                    fit: BoxFit.fill)),
                                          ),
                                        );
                                      },
                                    );
                                  }).toList(),
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 15,
                                child: ListView.builder(
                                    itemCount: 1,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (BuildContext context, index) {
                                      return Container(
                                        margin: EdgeInsets.only(
                                            left: 20, top: 15, right: 20),
                                        child: Row(
                                          children: <Widget>[
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  categorytext = "Category";
                                                });
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  boxShadow: [
                                                    //background color of box
                                                    BoxShadow(
                                                      color: Colors.grey,
                                                      blurRadius:
                                                          3.0, // soften the shadow
                                                      spreadRadius:
                                                          1.0, //extend the shadow
                                                      offset: Offset(
                                                        0.0, // Move to right 10  horizontally
                                                        2.0, // Move to bottom 10 Vertically
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      top: 5,
                                                      bottom: 5,
                                                      left: 8,
                                                      right: 8),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            60,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            60,
                                                        child: (categorytext ==
                                                                "Category")
                                                            ? SvgPicture.asset(
                                                                "assets/images/categoriesicon.svg")
                                                            : SvgPicture.asset(
                                                                "assets/images/categoryiconblack.svg"),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 5),
                                                        child: Text(
                                                          "Categories",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: (categorytext ==
                                                                      "Category")
                                                                  ? Color(
                                                                      0xff2696CC)
                                                                  : Color(
                                                                      0xff707070)),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  categorytext = "Store";
                                                });
                                              },
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  boxShadow: [
                                                    //background color of box
                                                    BoxShadow(
                                                      color: Colors.grey,
                                                      blurRadius:
                                                          3.0, // soften the shadow
                                                      spreadRadius:
                                                          1.0, //extend the shadow
                                                      offset: Offset(
                                                        0.0, // Move to right 10  horizontally
                                                        2.0, // Move to bottom 10 Vertically
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      top: 5,
                                                      bottom: 5,
                                                      left: 8,
                                                      right: 8),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            60,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            60,
                                                        child: (categorytext ==
                                                                "Store")
                                                            ? SvgPicture.asset(
                                                                "assets/images/storeiconblue.svg")
                                                            : SvgPicture.asset(
                                                                "assets/images/storeicon.svg"),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 5),
                                                        child: Text(
                                                          "Store",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: (categorytext ==
                                                                      "Store")
                                                                  ? Color(
                                                                      0xff2696CC)
                                                                  : Color(
                                                                      0xff707070)),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  categorytext = "Hot Deals";
                                                });
                                              },
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  boxShadow: [
                                                    //background color of box
                                                    BoxShadow(
                                                      color: Colors.grey,
                                                      blurRadius:
                                                          3.0, // soften the shadow
                                                      spreadRadius:
                                                          1.0, //extend the shadow
                                                      offset: Offset(
                                                        0.0, // Move to right 10  horizontally
                                                        2.0, // Move to bottom 10 Vertically
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      top: 5,
                                                      bottom: 5,
                                                      left: 8,
                                                      right: 8),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            60,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            60,
                                                        child: (categorytext ==
                                                                "Hot Deals")
                                                            ? SvgPicture.asset(
                                                                "assets/images/hotdealsiconblue.svg")
                                                            : SvgPicture.asset(
                                                                "assets/images/hotdealsicon.svg"),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 5),
                                                        child: Text(
                                                          "Hot Deals",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: (categorytext ==
                                                                      "Hot Deals")
                                                                  ? Color(
                                                                      0xff2696CC)
                                                                  : Color(
                                                                      0xff707070)),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  categorytext = "Viewed";
                                                });
                                              },
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  boxShadow: [
                                                    //background color of box
                                                    BoxShadow(
                                                      color: Colors.grey,
                                                      blurRadius:
                                                          3.0, // soften the shadow
                                                      spreadRadius:
                                                          1.0, //extend the shadow
                                                      offset: Offset(
                                                        0.0, // Move to right 10  horizontally
                                                        2.0, // Move to bottom 10 Vertically
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      top: 5,
                                                      bottom: 5,
                                                      left: 8,
                                                      right: 8),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            60,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            60,
                                                        child: (categorytext ==
                                                                "Viewed")
                                                            ? SvgPicture.asset(
                                                                "assets/images/viewiconblue.svg")
                                                            : SvgPicture.asset(
                                                                "assets/images/viewdicons.svg"),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 5),
                                                        child: Text(
                                                          "Viewed",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: (categorytext ==
                                                                      "Viewed")
                                                                  ? Color(
                                                                      0xff2696CC)
                                                                  : Color(
                                                                      0xff707070)),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                              (categorytext == "Category")
                                  ? categorydridview(model.catlist)
                                  : Container(
                                      child: (categorytext == "Store")
                                          ? Expanded(
                                              child: Container(
                                                  child: ListView.builder(
                                                      itemCount: 4,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              index) {
                                                        return Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 20,
                                                                  top: 15,
                                                                  right: 20),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            boxShadow: [
                                                              //background color of box
                                                              BoxShadow(
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.5),
                                                                blurRadius:
                                                                    2, // soften the shadow
                                                                spreadRadius:
                                                                    2, //extend the shadow
                                                                offset: Offset(
                                                                  0.0, // Move to right 10  horizontally
                                                                  2.5, // Move to bottom 10 Vertically
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          child: Stack(
                                                            children: <Widget>[
                                                              Container(
                                                                child: Column(
                                                                  children: <
                                                                      Widget>[
                                                                    Container(
                                                                      height:
                                                                          MediaQuery.of(context).size.height /
                                                                              7,
                                                                      width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.only(
                                                                              topLeft: Radius.circular(
                                                                                  10),
                                                                              topRight: Radius.circular(
                                                                                  10)),
                                                                          image: DecorationImage(
                                                                              image: AssetImage("assets/images/shoesbannershop.png"),
                                                                              fit: BoxFit.fill)),
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets.only(
                                                                          bottom:
                                                                              10),
                                                                      color: Colors
                                                                          .white,
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: <
                                                                            Widget>[
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width / 4.5,
                                                                          ),
                                                                          Expanded(
                                                                              child: Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: <Widget>[
                                                                              Container(
                                                                                child: Text(
                                                                                  "Sneakers Spot",
                                                                                  style: TextStyle(fontSize: MediaQuery.of(context).size.height / 50, fontWeight: FontWeight.w600),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                margin: EdgeInsets.only(top: 10, right: 10),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: <Widget>[
                                                                                    Container(
                                                                                      child: Row(
                                                                                        children: <Widget>[
                                                                                          Container(
                                                                                            child: SvgPicture.asset("assets/images/locationiconss.svg"),
                                                                                          ),
                                                                                          Container(
                                                                                            margin: EdgeInsets.only(left: 10),
                                                                                            child: Text(
                                                                                              "Hawalli, Kuwait",
                                                                                              style: TextStyle(
                                                                                                fontSize: MediaQuery.of(context).size.height / 55,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), border: Border.all(width: 1, color: Colors.black.withOpacity(0.5))),
                                                                                      child: Container(
                                                                                        margin: EdgeInsets.only(top: 3, bottom: 3, left: 3, right: 3),
                                                                                        child: Row(
                                                                                          children: <Widget>[
                                                                                            Container(
                                                                                              child: Text(
                                                                                                "Ad Posts :",
                                                                                                style: TextStyle(
                                                                                                  fontSize: MediaQuery.of(context).size.height / 68,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              margin: EdgeInsets.only(left: 5),
                                                                                              child: Text(
                                                                                                "84",
                                                                                                style: TextStyle(
                                                                                                  fontSize: MediaQuery.of(context).size.height / 62,
                                                                                                ),
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
                                                                          ))
                                                                        ],
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment: Alignment
                                                                    .bottomLeft,
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              60,
                                                                          left:
                                                                              10),
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height /
                                                                      12,
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height /
                                                                      12,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              50),
                                                                      image: DecorationImage(
                                                                          image: AssetImage(
                                                                              "assets/images/carimages.png"),
                                                                          fit: BoxFit
                                                                              .fill)),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        );
                                                      })),
                                            )
                                          : Container(
                                              child: (categorytext ==
                                                      "Hot Deals")
                                                  ? Container(
                                                      child: ListView.builder(
                                                          itemCount: 3,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  index) {
                                                            return Container(
                                                              width:
                                                                  MediaQuery.of(
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
                                                            );
                                                          }))
                                                  : Container(
                                                      child: Text("Viewed"),
                                                    ),
                                            ),
                                    )
                            ],
                          ),
                        )
                      : Container(
                          child: (_currentIndex == 0)
                              ? Container(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(top: 20),
                                        child: CarouselSlider(
                                          carouselController: _controller,
                                          options: CarouselOptions(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                6,
                                            autoPlay: true,
                                            enlargeCenterPage: true,
                                          ),
                                          items: model.adsbannerlist.map((i) {
                                            return Builder(
                                              builder: (BuildContext context) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    if (i.RedirectType ==
                                                        "STORE_PAGE") {
                                                      // Navigator.push(
                                                      //     context,
                                                      //     MaterialPageRoute(
                                                      //         builder: (context) =>
                                                      //             StoreDetailsPageScreen(i
                                                      //                 .bannerid
                                                      //                 .toString())));
                                                    } else {
                                                      final Uri _url =
                                                          Uri.parse(
                                                              i.Redirectvalue);
                                                      _launchUrl(_url);
                                                    }
                                                    print(
                                                        "HELLOPPSSS${i.RedirectType}");
                                                  },
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5.0),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: Colors.white,
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                "https://aswagbuckets3.s3.me-south-1.amazonaws.com/${i.bannerimage}"),
                                                            fit: BoxFit.fill)),
                                                  ),
                                                );
                                              },
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                15,
                                        child: ListView.builder(
                                            itemCount: 1,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder:
                                                (BuildContext context, index) {
                                              return Container(
                                                margin: EdgeInsets.only(
                                                    left: 20,
                                                    top: 15,
                                                    right: 20),
                                                child: Row(
                                                  children: <Widget>[
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          categorytext =
                                                              "Category";
                                                        });
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          boxShadow: [
                                                            //background color of box
                                                            BoxShadow(
                                                              color:
                                                                  Colors.grey,
                                                              blurRadius:
                                                                  3.0, // soften the shadow
                                                              spreadRadius:
                                                                  1.0, //extend the shadow
                                                              offset: Offset(
                                                                0.0, // Move to right 10  horizontally
                                                                2.0, // Move to bottom 10 Vertically
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 5,
                                                                  bottom: 5,
                                                                  left: 8,
                                                                  right: 8),
                                                          child: Row(
                                                            children: <Widget>[
                                                              Container(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    60,
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    60,
                                                                child: (categorytext ==
                                                                        "Category")
                                                                    ? SvgPicture
                                                                        .asset(
                                                                            "assets/images/categoriesicon.svg")
                                                                    : SvgPicture
                                                                        .asset(
                                                                            "assets/images/categoryiconblack.svg"),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            5),
                                                                child: Text(
                                                                  "Categories",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      color: (categorytext ==
                                                                              "Category")
                                                                          ? Color(
                                                                              0xff2696CC)
                                                                          : Color(
                                                                              0xff707070)),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          categorytext =
                                                              "Store";
                                                        });
                                                      },
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          boxShadow: [
                                                            //background color of box
                                                            BoxShadow(
                                                              color:
                                                                  Colors.grey,
                                                              blurRadius:
                                                                  3.0, // soften the shadow
                                                              spreadRadius:
                                                                  1.0, //extend the shadow
                                                              offset: Offset(
                                                                0.0, // Move to right 10  horizontally
                                                                2.0, // Move to bottom 10 Vertically
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 5,
                                                                  bottom: 5,
                                                                  left: 8,
                                                                  right: 8),
                                                          child: Row(
                                                            children: <Widget>[
                                                              Container(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    60,
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    60,
                                                                child: (categorytext ==
                                                                        "Store")
                                                                    ? SvgPicture
                                                                        .asset(
                                                                            "assets/images/storeiconblue.svg")
                                                                    : SvgPicture
                                                                        .asset(
                                                                            "assets/images/storeicon.svg"),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            5),
                                                                child: Text(
                                                                  "Store",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      color: (categorytext ==
                                                                              "Store")
                                                                          ? Color(
                                                                              0xff2696CC)
                                                                          : Color(
                                                                              0xff707070)),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          categorytext =
                                                              "Hot Deals";
                                                        });
                                                      },
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          boxShadow: [
                                                            //background color of box
                                                            BoxShadow(
                                                              color:
                                                                  Colors.grey,
                                                              blurRadius:
                                                                  3.0, // soften the shadow
                                                              spreadRadius:
                                                                  1.0, //extend the shadow
                                                              offset: Offset(
                                                                0.0, // Move to right 10  horizontally
                                                                2.0, // Move to bottom 10 Vertically
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 5,
                                                                  bottom: 5,
                                                                  left: 8,
                                                                  right: 8),
                                                          child: Row(
                                                            children: <Widget>[
                                                              Container(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    60,
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    60,
                                                                child: (categorytext ==
                                                                        "Hot Deals")
                                                                    ? SvgPicture
                                                                        .asset(
                                                                            "assets/images/hotdealsiconblue.svg")
                                                                    : SvgPicture
                                                                        .asset(
                                                                            "assets/images/hotdealsicon.svg"),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            5),
                                                                child: Text(
                                                                  "Hot Deals",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      color: (categorytext ==
                                                                              "Hot Deals")
                                                                          ? Color(
                                                                              0xff2696CC)
                                                                          : Color(
                                                                              0xff707070)),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          categorytext =
                                                              "Viewed";
                                                        });
                                                      },
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          boxShadow: [
                                                            //background color of box
                                                            BoxShadow(
                                                              color:
                                                                  Colors.grey,
                                                              blurRadius:
                                                                  3.0, // soften the shadow
                                                              spreadRadius:
                                                                  1.0, //extend the shadow
                                                              offset: Offset(
                                                                0.0, // Move to right 10  horizontally
                                                                2.0, // Move to bottom 10 Vertically
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 5,
                                                                  bottom: 5,
                                                                  left: 8,
                                                                  right: 8),
                                                          child: Row(
                                                            children: <Widget>[
                                                              Container(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    60,
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    60,
                                                                child: (categorytext ==
                                                                        "Viewed")
                                                                    ? SvgPicture
                                                                        .asset(
                                                                            "assets/images/viewiconblue.svg")
                                                                    : SvgPicture
                                                                        .asset(
                                                                            "assets/images/viewdicons.svg"),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            5),
                                                                child: Text(
                                                                  "Viewed",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      color: (categorytext ==
                                                                              "Viewed")
                                                                          ? Color(
                                                                              0xff2696CC)
                                                                          : Color(
                                                                              0xff707070)),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              );
                                            }),
                                      ),
                                      (categorytext == "Category")
                                          ? categorydridview(model.catlist)
                                          : Container(
                                              child: (categorytext == "Store")
                                                  ? Expanded(
                                                      child: Container(
                                                          child:
                                                              ListView.builder(
                                                                  itemCount: 4,
                                                                  scrollDirection:
                                                                      Axis
                                                                          .vertical,
                                                                  itemBuilder:
                                                                      (BuildContext
                                                                              context,
                                                                          index) {
                                                                    return Container(
                                                                      margin: EdgeInsets.only(
                                                                          left:
                                                                              20,
                                                                          top:
                                                                              15,
                                                                          right:
                                                                              20),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                        boxShadow: [
                                                                          //background color of box
                                                                          BoxShadow(
                                                                            color:
                                                                                Colors.grey.withOpacity(0.5),
                                                                            blurRadius:
                                                                                2, // soften the shadow
                                                                            spreadRadius:
                                                                                2, //extend the shadow
                                                                            offset:
                                                                                Offset(
                                                                              0.0, // Move to right 10  horizontally
                                                                              2.5, // Move to bottom 10 Vertically
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                      child:
                                                                          Stack(
                                                                        children: <
                                                                            Widget>[
                                                                          Container(
                                                                            child:
                                                                                Column(
                                                                              children: <Widget>[
                                                                                Container(
                                                                                  height: MediaQuery.of(context).size.height / 7,
                                                                                  width: MediaQuery.of(context).size.width,
                                                                                  decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)), image: DecorationImage(image: AssetImage("assets/images/shoesbannershop.png"), fit: BoxFit.fill)),
                                                                                ),
                                                                                Container(
                                                                                  margin: EdgeInsets.only(bottom: 10),
                                                                                  color: Colors.white,
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: <Widget>[
                                                                                      Container(
                                                                                        width: MediaQuery.of(context).size.width / 4.5,
                                                                                      ),
                                                                                      Expanded(
                                                                                          child: Column(
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: <Widget>[
                                                                                          Container(
                                                                                            child: Text(
                                                                                              "Sneakers Spot",
                                                                                              style: TextStyle(fontSize: MediaQuery.of(context).size.height / 50, fontWeight: FontWeight.w600),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            margin: EdgeInsets.only(top: 10, right: 10),
                                                                                            child: Row(
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: <Widget>[
                                                                                                Container(
                                                                                                  child: Row(
                                                                                                    children: <Widget>[
                                                                                                      Container(
                                                                                                        child: SvgPicture.asset("assets/images/locationiconss.svg"),
                                                                                                      ),
                                                                                                      Container(
                                                                                                        margin: EdgeInsets.only(left: 10),
                                                                                                        child: Text(
                                                                                                          "Hawalli, Kuwait",
                                                                                                          style: TextStyle(
                                                                                                            fontSize: MediaQuery.of(context).size.height / 55,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                Container(
                                                                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), border: Border.all(width: 1, color: Colors.black.withOpacity(0.5))),
                                                                                                  child: Container(
                                                                                                    margin: EdgeInsets.only(top: 3, bottom: 3, left: 3, right: 3),
                                                                                                    child: Row(
                                                                                                      children: <Widget>[
                                                                                                        Container(
                                                                                                          child: Text(
                                                                                                            "Ad Posts :",
                                                                                                            style: TextStyle(
                                                                                                              fontSize: MediaQuery.of(context).size.height / 68,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          margin: EdgeInsets.only(left: 5),
                                                                                                          child: Text(
                                                                                                            "84",
                                                                                                            style: TextStyle(
                                                                                                              fontSize: MediaQuery.of(context).size.height / 62,
                                                                                                            ),
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
                                                                                      ))
                                                                                    ],
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                Alignment.bottomLeft,
                                                                            child:
                                                                                Container(
                                                                              margin: EdgeInsets.only(top: 60, left: 10),
                                                                              height: MediaQuery.of(context).size.height / 12,
                                                                              width: MediaQuery.of(context).size.height / 12,
                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), image: DecorationImage(image: AssetImage("assets/images/carimages.png"), fit: BoxFit.fill)),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    );
                                                                  })),
                                                    )
                                                  : Container(
                                                      child: (categorytext ==
                                                              "Hot Deals")
                                                          ? Expanded(
                                                              child: Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              15,
                                                                          right:
                                                                              15,
                                                                          top:
                                                                              15),
                                                                  child: ListView
                                                                      .builder(
                                                                          itemCount: model
                                                                              .hotdealslist
                                                                              .length,
                                                                          scrollDirection: Axis
                                                                              .vertical,
                                                                          shrinkWrap:
                                                                              true,
                                                                          itemBuilder: (BuildContext context,
                                                                              index) {
                                                                            return GestureDetector(
                                                                                onTap: () {
                                                                                  final _firebaseRefs = FirebaseDatabase().reference().child("Viewed");
                                                                                  _firebaseRefs.child(model.userid).child(model.hotdealslist[index].addid.toString()).set({
                                                                                    "ProName": model.hotdealslist[index].title,
                                                                                    "timelft": model.hotdealslist[index].endingtime,
                                                                                    "sellingprice": model.hotdealslist[index].sellingprice,
                                                                                    "price": model.hotdealslist[index].price,
                                                                                    "storeid": model.hotdealslist[index].storeid,
                                                                                    "image": "https://aswagbuckets3.s3.me-south-1.amazonaws.com/${model.hotdealslist[index].thumnail}",
                                                                                  });
                                                                                  int valuess = 0;
                                                                                  _firebaseRefs.child(model.userid).once().then((values) {
                                                                                    Map lists = values.value;
                                                                                    setState(() {
                                                                                      valuess = lists.length;
                                                                                      if (valuess == 11) {
                                                                                        _firebaseRefs.child(model.userid).remove();
                                                                                      } else {
                                                                                        _firebaseRefs.child(model.userid).child(model.hotdealslist[index].addid.toString()).set({
                                                                                          "ProName": model.hotdealslist[index].title,
                                                                                          "timelft": model.hotdealslist[index].endingtime,
                                                                                          "sellingprice": model.hotdealslist[index].sellingprice,
                                                                                          "price": model.hotdealslist[index].price,
                                                                                          "storeid": model.hotdealslist[index].storeid,
                                                                                          "image": "https://aswagbuckets3.s3.me-south-1.amazonaws.com/${model.hotdealslist[index].thumnail}",
                                                                                        });
                                                                                      }
                                                                                    });
                                                                                  });

                                                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => StoreProductDetailsScreen(model.hotdealslist[index].addid.toString())));
                                                                                },
                                                                                child: Container(
                                                                                  margin: EdgeInsets.only(bottom: 10),
                                                                                  width: MediaQuery.of(context).size.width,
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
                                                                                  child: Container(
                                                                                      margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                                                                                      child: Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: <Widget>[
                                                                                          Container(
                                                                                            height: MediaQuery.of(context).size.height / 6.5,
                                                                                            width: MediaQuery.of(context).size.width / 3,
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
                                                                                                image: DecorationImage(image: NetworkImage("https://aswagbuckets3.s3.me-south-1.amazonaws.com/${model.hotdealslist[index].thumnail}"), fit: BoxFit.fill)),
                                                                                            child: Stack(
                                                                                              children: <Widget>[
                                                                                                Container(
                                                                                                  child: Align(
                                                                                                    alignment: Alignment.topRight,
                                                                                                    child: Container(
                                                                                                      margin: EdgeInsets.only(top: 6, right: 6),
                                                                                                      height: MediaQuery.of(context).size.height / 30,
                                                                                                      width: MediaQuery.of(context).size.width / 15,
                                                                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.white.withOpacity(0.5)),
                                                                                                      child: Center(
                                                                                                        child: Icon(
                                                                                                          Icons.bookmark_outline,
                                                                                                          size: MediaQuery.of(context).size.height / 40,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                )
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                              child: Stack(
                                                                                            children: <Widget>[
                                                                                              Container(
                                                                                                  child: Container(
                                                                                                margin: EdgeInsets.only(left: 10, right: 10),
                                                                                                child: Column(
                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: <Widget>[
                                                                                                    Container(
                                                                                                        child: Container(
                                                                                                      margin: EdgeInsets.only(right: MediaQuery.of(context).size.height / 18),
                                                                                                      child: Text(
                                                                                                        model.hotdealslist[index].title,
                                                                                                        maxLines: 3,
                                                                                                        overflow: TextOverflow.ellipsis,
                                                                                                        style: TextStyle(color: Color(0xff707070), fontWeight: FontWeight.w700, fontSize: MediaQuery.of(context).size.height / 40),
                                                                                                      ),
                                                                                                    )),
                                                                                                    Container(
                                                                                                        margin: EdgeInsets.only(top: 3),
                                                                                                        child: Row(
                                                                                                          children: <Widget>[
                                                                                                            Container(),
                                                                                                            Container(
                                                                                                                child: Container(
                                                                                                              child: Text(
                                                                                                                "Time Left : ${model.hotdealslist[index].startingtime.toString()}",
                                                                                                                style: TextStyle(color: Color(0xff707070), fontSize: MediaQuery.of(context).size.width / 30),
                                                                                                              ),
                                                                                                            ))
                                                                                                          ],
                                                                                                        )),
                                                                                                    Container(
                                                                                                        margin: EdgeInsets.only(top: 7),
                                                                                                        child: Container(
                                                                                                          child: Text(
                                                                                                            model.hotdealslist[index].sellingprice,
                                                                                                            style: TextStyle(color: Color(0xff707070), fontWeight: FontWeight.w700, fontSize: MediaQuery.of(context).size.height / 40),
                                                                                                          ),
                                                                                                        )),
                                                                                                    Container(
                                                                                                        child: Container(
                                                                                                      child: Text(
                                                                                                        model.hotdealslist[index].price,
                                                                                                        style: TextStyle(color: Color(0xffC6C6C6), fontSize: MediaQuery.of(context).size.height / 55, decoration: TextDecoration.lineThrough),
                                                                                                      ),
                                                                                                    )),
                                                                                                    Container(
                                                                                                      margin: EdgeInsets.only(top: 5),
                                                                                                      child: Row(
                                                                                                        children: <Widget>[
                                                                                                          Expanded(
                                                                                                              child: GestureDetector(
                                                                                                                  onTap: () async {
                                                                                                                    bool? res = await FlutterPhoneDirectCaller.callNumber("8000641473");
                                                                                                                  },
                                                                                                                  child: Container(
                                                                                                                    margin: EdgeInsets.only(right: 10),
                                                                                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Color(0xff2696CC)),
                                                                                                                    child: Container(
                                                                                                                      margin: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                                                                                                                      child: Row(
                                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                        children: <Widget>[
                                                                                                                          Container(
                                                                                                                            child: Icon(Icons.call, size: MediaQuery.of(context).size.height / 50, color: Colors.white),
                                                                                                                          ),
                                                                                                                          Container(
                                                                                                                            child: Text(
                                                                                                                              "800064xxxx",
                                                                                                                              style: TextStyle(fontSize: MediaQuery.of(context).size.height / 65, color: Colors.white),
                                                                                                                            ),
                                                                                                                          )
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ))),
                                                                                                          Expanded(
                                                                                                              child: GestureDetector(
                                                                                                                  onTap: () {
                                                                                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChatMessageActivity(model.hotdealslist[index].storeid.toString(), model.hotdealslist[index].title, "")));
                                                                                                                  },
                                                                                                                  child: Container(
                                                                                                                    margin: EdgeInsets.only(left: 10),
                                                                                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white, border: Border.all(width: 1, color: Color(0xff2696CC))),
                                                                                                                    child: Container(
                                                                                                                      margin: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                                                                                                                      child: Row(
                                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                        children: <Widget>[
                                                                                                                          Container(
                                                                                                                            child: Icon(Icons.chat, size: MediaQuery.of(context).size.height / 50, color: Color(0xff2696CC)),
                                                                                                                          ),
                                                                                                                          Container(
                                                                                                                            margin: EdgeInsets.only(left: 5),
                                                                                                                            child: Text(
                                                                                                                              "Chat",
                                                                                                                              style: TextStyle(fontSize: MediaQuery.of(context).size.height / 65, color: Color(0xff2696CC)),
                                                                                                                            ),
                                                                                                                          )
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  )))
                                                                                                        ],
                                                                                                      ),
                                                                                                    )
                                                                                                  ],
                                                                                                ),
                                                                                              )),
                                                                                              Align(
                                                                                                  alignment: Alignment.centerRight,
                                                                                                  child: Container(
                                                                                                    margin: EdgeInsets.only(top: 15),
                                                                                                    height: MediaQuery.of(context).size.height / 15,
                                                                                                    width: MediaQuery.of(context).size.height / 17,
                                                                                                    child: Image.asset("assets/images/hotdeals.png", fit: BoxFit.fill),
                                                                                                  ))
                                                                                            ],
                                                                                          ))
                                                                                        ],
                                                                                      )),
                                                                                ));
                                                                          })))
                                                          : Expanded(
                                                              child: Container(
                                                                  margin: EdgeInsets.only(
                                                                      left: 15,
                                                                      right: 15,
                                                                      top: 15),
                                                                  child: FirebaseAnimatedList(
                                                                      query: _firebaseRef.child(model.userid),
                                                                      controller: _scrollController,
                                                                      reverse: false,
                                                                      itemBuilder: (_, DataSnapshot snapshot, Animation<double> animation, int x) {
                                                                        return Container(
                                                                          margin:
                                                                              EdgeInsets.only(bottom: 10),
                                                                          width: MediaQuery.of(context)
                                                                              .size
                                                                              .width,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            borderRadius:
                                                                                BorderRadius.circular(5),
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
                                                                          child: Container(
                                                                              margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: <Widget>[
                                                                                  Container(
                                                                                    height: MediaQuery.of(context).size.height / 6.5,
                                                                                    width: MediaQuery.of(context).size.width / 3,
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
                                                                                        image: DecorationImage(image: NetworkImage(snapshot.value["image"]), fit: BoxFit.fill)),
                                                                                    child: Stack(
                                                                                      children: <Widget>[
                                                                                        Container(
                                                                                          child: Align(
                                                                                            alignment: Alignment.topRight,
                                                                                            child: Container(
                                                                                              margin: EdgeInsets.only(top: 6, right: 6),
                                                                                              height: MediaQuery.of(context).size.height / 30,
                                                                                              width: MediaQuery.of(context).size.width / 15,
                                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.white.withOpacity(0.5)),
                                                                                              child: Center(
                                                                                                child: Icon(
                                                                                                  Icons.bookmark_outline,
                                                                                                  size: MediaQuery.of(context).size.height / 40,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        )
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                      child: Stack(
                                                                                    children: <Widget>[
                                                                                      Container(
                                                                                          child: Container(
                                                                                        margin: EdgeInsets.only(left: 10, right: 10),
                                                                                        child: Column(
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: <Widget>[
                                                                                            Container(
                                                                                                child: Container(
                                                                                              margin: EdgeInsets.only(right: MediaQuery.of(context).size.height / 18),
                                                                                              child: Text(
                                                                                                snapshot.value["ProName"],
                                                                                                maxLines: 3,
                                                                                                overflow: TextOverflow.ellipsis,
                                                                                                style: TextStyle(color: Color(0xff707070), fontWeight: FontWeight.w700, fontSize: MediaQuery.of(context).size.height / 40),
                                                                                              ),
                                                                                            )),
                                                                                            Container(
                                                                                                margin: EdgeInsets.only(top: 3),
                                                                                                child: Row(
                                                                                                  children: <Widget>[
                                                                                                    Container(),
                                                                                                    Container(
                                                                                                        child: Container(
                                                                                                      child: Text(
                                                                                                        "Time Left : ${snapshot.value["timelft"].toString()}",
                                                                                                        style: TextStyle(color: Color(0xff707070), fontSize: MediaQuery.of(context).size.width / 30),
                                                                                                      ),
                                                                                                    ))
                                                                                                  ],
                                                                                                )),
                                                                                            Container(
                                                                                                margin: EdgeInsets.only(top: 7),
                                                                                                child: Container(
                                                                                                  child: Text(
                                                                                                    "${snapshot.value["sellingprice"].toString()} KD",
                                                                                                    style: TextStyle(color: Color(0xff707070), fontWeight: FontWeight.w700, fontSize: MediaQuery.of(context).size.height / 40),
                                                                                                  ),
                                                                                                )),
                                                                                            Container(
                                                                                                child: Container(
                                                                                              child: Text(
                                                                                                "${snapshot.value["price"].toString()} KD",
                                                                                                style: TextStyle(color: Color(0xffC6C6C6), fontSize: MediaQuery.of(context).size.height / 55, decoration: TextDecoration.lineThrough),
                                                                                              ),
                                                                                            )),
                                                                                            Container(
                                                                                              margin: EdgeInsets.only(top: 5),
                                                                                              child: Row(
                                                                                                children: <Widget>[
                                                                                                  Expanded(
                                                                                                    child: GestureDetector(
                                                                                                        onTap: () async {
                                                                                                          bool? res = await FlutterPhoneDirectCaller.callNumber("8000641473");
                                                                                                        },
                                                                                                        child: Container(
                                                                                                          margin: EdgeInsets.only(right: 10),
                                                                                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Color(0xff2696CC)),
                                                                                                          child: Container(
                                                                                                            margin: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                                                                                                            child: Row(
                                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                              children: <Widget>[
                                                                                                                Container(
                                                                                                                  child: Icon(Icons.call, size: MediaQuery.of(context).size.height / 50, color: Colors.white),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  margin: EdgeInsets.only(left: 5),
                                                                                                                  child: Text(
                                                                                                                    "9457XXX",
                                                                                                                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 65, color: Colors.white),
                                                                                                                  ),
                                                                                                                )
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        )),
                                                                                                  ),
                                                                                                  Expanded(
                                                                                                      child: GestureDetector(
                                                                                                          onTap: () {
                                                                                                            Navigator.push(context, MaterialPageRoute(builder: (context) => ChatMessageActivity(snapshot.value["storeid"].toString(), snapshot.value["ProName"].toString(), "")));
                                                                                                          },
                                                                                                          child: Container(
                                                                                                            margin: EdgeInsets.only(left: 10),
                                                                                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white, border: Border.all(width: 1, color: Color(0xff2696CC))),
                                                                                                            child: Container(
                                                                                                              margin: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                                                                                                              child: Row(
                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                children: <Widget>[
                                                                                                                  Container(
                                                                                                                    child: Icon(Icons.chat, size: MediaQuery.of(context).size.height / 50, color: Color(0xff2696CC)),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    margin: EdgeInsets.only(left: 5),
                                                                                                                    child: Text(
                                                                                                                      "Chat",
                                                                                                                      style: TextStyle(fontSize: MediaQuery.of(context).size.height / 65, color: Color(0xff2696CC)),
                                                                                                                    ),
                                                                                                                  )
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          )))
                                                                                                ],
                                                                                              ),
                                                                                            )
                                                                                          ],
                                                                                        ),
                                                                                      )),
                                                                                      Align(
                                                                                          alignment: Alignment.centerRight,
                                                                                          child: Container(
                                                                                            margin: EdgeInsets.only(top: 15),
                                                                                            height: MediaQuery.of(context).size.height / 15,
                                                                                            width: MediaQuery.of(context).size.height / 17,
                                                                                            child: Image.asset("assets/images/hotdeals.png", fit: BoxFit.fill),
                                                                                          ))
                                                                                    ],
                                                                                  ))
                                                                                ],
                                                                              )),
                                                                        );
                                                                      }))),
                                                    ),
                                            )
                                    ],
                                  ),
                                )
                              : Container(
                                  child: (_currentIndex == 1)
                                      ? Container(
                                          child: ListView.builder(
                                              itemCount:
                                                  model.storelists.length,
                                              scrollDirection: Axis.vertical,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      index) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                StoreDetailsPageScreen(model
                                                                    .storelists[
                                                                        index]
                                                                    .storeid
                                                                    .toString())));
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 20,
                                                        top: 10,
                                                        right: 20,
                                                        bottom: 10),
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
                                                              2, // soften the shadow
                                                          spreadRadius:
                                                              2, //extend the shadow
                                                          offset: Offset(
                                                            0.0, // Move to right 10  horizontally
                                                            2.5, // Move to bottom 10 Vertically
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    child: Stack(
                                                      children: <Widget>[
                                                        Container(
                                                          child: Column(
                                                            children: <Widget>[
                                                              Container(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height /
                                                                      6,
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.only(
                                                                          topLeft: Radius.circular(
                                                                              10),
                                                                          topRight: Radius.circular(
                                                                              10)),
                                                                      image: DecorationImage(
                                                                          image:
                                                                              NetworkImage("https://aswagbuckets3.s3.me-south-1.amazonaws.com/${model.storelists[index].bannerimage}"),
                                                                          fit: BoxFit.fill))),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        bottom:
                                                                            10),
                                                                color: Colors
                                                                    .white,
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
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          4.5,
                                                                    ),
                                                                    Expanded(
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
                                                                          margin:
                                                                              EdgeInsets.only(top: 5),
                                                                          child:
                                                                              Text(
                                                                            model.storelists[index].storename,
                                                                            style:
                                                                                TextStyle(fontSize: MediaQuery.of(context).size.height / 50, fontWeight: FontWeight.w600),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          margin: EdgeInsets.only(
                                                                              top: 10,
                                                                              right: 10),
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: <Widget>[
                                                                              Container(
                                                                                child: Row(
                                                                                  children: <Widget>[
                                                                                    Container(
                                                                                      child: SvgPicture.asset("assets/images/locationiconss.svg"),
                                                                                    ),
                                                                                    Container(
                                                                                      margin: EdgeInsets.only(left: 10),
                                                                                      child: Text(
                                                                                        model.storelists[index].address,
                                                                                        style: TextStyle(
                                                                                          fontSize: MediaQuery.of(context).size.height / 55,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), border: Border.all(width: 1, color: Colors.black.withOpacity(0.5))),
                                                                                child: Container(
                                                                                  margin: EdgeInsets.only(top: 3, bottom: 3, left: 3, right: 3),
                                                                                  child: Row(
                                                                                    children: <Widget>[
                                                                                      Container(
                                                                                        child: Text(
                                                                                          "Ad Posts :",
                                                                                          style: TextStyle(
                                                                                            fontSize: MediaQuery.of(context).size.height / 68,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        margin: EdgeInsets.only(left: 5),
                                                                                        child: Text(
                                                                                          "84",
                                                                                          style: TextStyle(
                                                                                            fontSize: MediaQuery.of(context).size.height / 62,
                                                                                          ),
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
                                                                    ))
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment: Alignment
                                                              .bottomLeft,
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 100,
                                                                    left: 10),
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                12,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                12,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        50),
                                                                image: DecorationImage(
                                                                    image: NetworkImage(
                                                                        "https://aswagbuckets3.s3.me-south-1.amazonaws.com/${model.storelists[index].bannerimage}"),
                                                                    fit: BoxFit
                                                                        .fill)),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }),
                                        )
                                      : ChatFragment(model.userid, model.name,
                                          model.userimage),
                                ),
                        )),
            )));
  }

  categorydridview(List<GetCategoryModel> list) {
    return Expanded(
      child: Container(
          margin: EdgeInsets.only(left: 15, top: 15, right: 15),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 2 / 1.7,
            scrollDirection: Axis.vertical,
            children: list.map((e) {
              return new GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CategoryDetailsPageScreen(
                              e.id.toString(), e.name)));
                },
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://aswagbuckets3.s3.me-south-1.amazonaws.com/${e.categoryimage}"),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 8, bottom: 5),
                            child: Text(
                              e.name,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 70,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              margin: EdgeInsets.only(right: 8, bottom: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white.withOpacity(0.5)),
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 3, bottom: 3, left: 5, right: 5),
                                child: Text(
                                  "120 Post",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              70,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          )),
    );
  }

  Future<void> sethotdealstoview(List<String> tList) async {}
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    _currentIndex = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyAccountFragment(_currentIndex2)));

    print("MYYY:-${_currentIndex}");
  }
}
