import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_deals_shopping/Controller/MyAccountViewModel.dart';
import 'package:four_deals_shopping/Screens/AdsResellerPalnsActivity.dart';
import 'package:four_deals_shopping/Screens/Fragments/HomeFragment.dart';
import 'package:four_deals_shopping/Screens/LoginScreenActivity.dart';
import 'package:four_deals_shopping/Screens/MyBalanceAdsScreen.dart';
import 'package:four_deals_shopping/Screens/MyFollowerScreenUi.dart';
import 'package:four_deals_shopping/Screens/MyFollowinfListScreen.dart';
import 'package:four_deals_shopping/Screens/MyOrderScreenUI.dart';
import 'package:four_deals_shopping/Screens/MyPostedAdsScreen.dart';
import 'package:four_deals_shopping/Screens/NotificationScreen.dart';
import 'package:four_deals_shopping/Screens/PostBannerAdsScreen.dart';
import 'package:four_deals_shopping/Screens/PostMyAdsScreen.dart';
import 'package:four_deals_shopping/Screens/SettingScreen.dart';
import 'package:four_deals_shopping/Screens/UploadProductScreen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:toast/toast.dart';

class MyAccountFragment extends StatefulWidget {
  int? index = null;

  MyAccountFragment(this.index);

  @override
  State<MyAccountFragment> createState() => MyAccountFragmentState();
}

class MyAccountFragmentState extends State<MyAccountFragment> {
  late String plush = "";
  late String plush1 = "";
  late String plush3 = "";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyAccountViewModel>.reactive(
        viewModelBuilder: () => MyAccountViewModel(),
        onModelReady: (model) => {model.fetchmyprofile()},
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xffF6F6F6),
              elevation: 1,
              titleSpacing: 0,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context, widget.index);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingScreen()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    child: Icon(
                      Icons.settings,
                      color: Colors.black,
                    ),
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
                    margin: EdgeInsets.only(right: 20),
                    child: Icon(
                      Icons.notifications_none,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
              title: Text(
                "Account",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 45,
                    color: Colors.black),
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 13),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height / 9,
                            width: MediaQuery.of(context).size.height / 9,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/carimages.png"),
                                    fit: BoxFit.fill)),
                          ),
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                          child: Text(
                                        model.myaids,
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                45,
                                            fontWeight: FontWeight.w600),
                                      )),
                                      Container(
                                          margin: EdgeInsets.only(top: 3),
                                          child: Text(
                                            "My Ads",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    60,
                                                fontWeight: FontWeight.w600),
                                          ))
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                          child: Text(
                                        model.followers,
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                45,
                                            fontWeight: FontWeight.w600),
                                      )),
                                      Container(
                                          margin: EdgeInsets.only(top: 3),
                                          child: Text(
                                            "Followers",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    60,
                                                fontWeight: FontWeight.w600),
                                          ))
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                          child: Text(
                                        model.following,
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                45,
                                            fontWeight: FontWeight.w600),
                                      )),
                                      Container(
                                          margin: EdgeInsets.only(top: 3),
                                          child: Text(
                                            "Following",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    60,
                                                fontWeight: FontWeight.w600),
                                          ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text(
                              model.name,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 50,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 3),
                            child: Text(
                              "Free member",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 60,
                                  color: Color(0xff9B9B9B)),
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  child: Text(
                                    "Verified",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                60,
                                        color: Color(0xff9B9B9B)),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5),
                                  height:
                                      MediaQuery.of(context).size.height / 55,
                                  width: MediaQuery.of(context).size.width / 30,
                                  child: SvgPicture.asset(
                                    "assets/images/verifiedicons.svg",
                                    fit: BoxFit.fill,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 3),
                            child: Text(
                              "Member since 23-10-2020",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 60,
                                  color: Color(0xff9B9B9B)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SettingScreen()));
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              23,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              width: 1,
                                              color: Colors.grey
                                                  .withOpacity(0.5))),
                                      child: Center(
                                        child: Text(
                                          "Edit Profile",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    )),
                                Visibility(
                                  visible: plush == "Open" ? true : false,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Column(
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () {
                                            Toast.show("Coming Soon", context,
                                                duration: Toast.LENGTH_SHORT,
                                                gravity: Toast.BOTTOM);
                                          },
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                23,
                                            decoration: BoxDecoration(
                                              color: Color(0xffF6F6F6),
                                              borderRadius:
                                                  BorderRadius.circular(5),
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
                                            child: Center(
                                              child: Text(
                                                "Recently Viewed",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Toast.show("Coming Soon", context,
                                                duration: Toast.LENGTH_SHORT,
                                                gravity: Toast.BOTTOM);
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(top: 10),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                23,
                                            decoration: BoxDecoration(
                                              color: Color(0xffF6F6F6),
                                              borderRadius:
                                                  BorderRadius.circular(5),
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
                                            child: Center(
                                              child: Text(
                                                "Recent Searches",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (plush == "") {
                                  plush = "Open";
                                } else {
                                  plush = "";
                                }
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 20, left: 10),
                              height: MediaQuery.of(context).size.height / 23,
                              width: MediaQuery.of(context).size.width / 8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 1,
                                      color: Colors.grey.withOpacity(0.5))),
                              child: Center(
                                child: plush == "Open"
                                    ? SvgPicture.asset(
                                        "assets/images/minusiconss.svg")
                                    : SvgPicture.asset(
                                        "assets/images/plushliness.svg"),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xffF6F6F6),
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 15, top: 15, right: 15, bottom: 15),
                        child: Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            UploadProductScreen()));
                              },
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 15,
                                    width:
                                        MediaQuery.of(context).size.height / 15,
                                    decoration: BoxDecoration(
                                      color: Color(0xffF9B303),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(left: 15),
                                      child: Text(
                                        "Post your Ad",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                55),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: SvgPicture.asset(
                                        "assets/images/iconsarrorowright.svg"),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PostBannerAds()));
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              15,
                                      width:
                                          MediaQuery.of(context).size.height /
                                              15,
                                      decoration: BoxDecoration(
                                        color: Color(0xffF9B303),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                            "assets/images/carticons.svg"),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 15),
                                        child: Text(
                                          "Post Banner Ads",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  55),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: SvgPicture.asset(
                                          "assets/images/iconsarrorowright.svg"),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyOrderScreen()));
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              15,
                                      width:
                                          MediaQuery.of(context).size.height /
                                              15,
                                      decoration: BoxDecoration(
                                        color: Color(0xffF9B303),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                            "assets/images/carticons.svg"),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 15),
                                        child: Text(
                                          "My Orders",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  55),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: SvgPicture.asset(
                                          "assets/images/iconsarrorowright.svg"),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xffF6F6F6),
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 15, top: 15, right: 15, bottom: 15),
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 15,
                                    width:
                                        MediaQuery.of(context).size.height / 15,
                                    decoration: BoxDecoration(
                                      color: Color(0xff2696CC),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                          "assets/images/addsiconss.svg"),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MyBalanceAdsScreen()));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(left: 15),
                                        child: Text(
                                          "My Ads",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  55),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: SvgPicture.asset(
                                        "assets/images/iconsarrorowright.svg"),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Toast.show("Coming Soon", context,
                                    duration: Toast.LENGTH_SHORT,
                                    gravity: Toast.BOTTOM);
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              15,
                                      width:
                                          MediaQuery.of(context).size.height /
                                              15,
                                      decoration: BoxDecoration(
                                        color: Color(0xff2696CC),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                            "assets/images/crownssicons.svg"),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 15),
                                        child: Text(
                                          "Membership",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  55),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: SvgPicture.asset(
                                          "assets/images/iconsarrorowright.svg"),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xffF6F6F6),
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 15, top: 15, right: 15, bottom: 15),
                        child: Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MyFollowingListScreen()));
                              },
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 15,
                                    width:
                                        MediaQuery.of(context).size.height / 15,
                                    decoration: BoxDecoration(
                                      color: Color(0xff67A400),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                          "assets/images/followinficons.svg"),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(left: 15),
                                      child: Text(
                                        "Following",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                55),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: SvgPicture.asset(
                                        "assets/images/iconsarrorowright.svg"),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MyFollowerScreen()));
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              15,
                                      width:
                                          MediaQuery.of(context).size.height /
                                              15,
                                      decoration: BoxDecoration(
                                        color: Color(0xff67A400),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                            "assets/images/followersiconss.svg"),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 15),
                                        child: Text(
                                          "Followers",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  55),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: SvgPicture.asset(
                                          "assets/images/iconsarrorowright.svg"),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xffF6F6F6),
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 15, top: 15, right: 15, bottom: 15),
                        child: Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Toast.show("Coming Soon", context,
                                    duration: Toast.LENGTH_SHORT,
                                    gravity: Toast.BOTTOM);
                                setState(() {
                                  if (plush3 == "") {
                                    plush3 = "Open";
                                  } else {
                                    plush3 = "";
                                  }
                                });
                              },
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 15,
                                    width:
                                        MediaQuery.of(context).size.height / 15,
                                    decoration: BoxDecoration(
                                      color: Color(0xff323232),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                          "assets/images/addsiconss.svg"),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(left: 15),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            child: Container(
                                              child: Text(
                                                "Help",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            55),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (plush3 == "") {
                                          plush3 = "Open";
                                        } else {
                                          plush3 = "";
                                        }
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: plush3 == "Open"
                                          ? SvgPicture.asset(
                                              "assets/images/arrorowdownicon.svg")
                                          : SvgPicture.asset(
                                              "assets/images/iconsarrorowright.svg"),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Visibility(
                                visible: plush3 == "Open" ? true : false,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: 10, left: 66, right: 50),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        child: Row(children: <Widget>[
                                          Expanded(
                                            child: Text(
                                              "Ads Reseller",
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          55,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (plush1 == "") {
                                                  plush1 = "Open";
                                                } else {
                                                  plush1 = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  35,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  15,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.grey
                                                          .withOpacity(0.5))),
                                              child: Center(
                                                child: plush1 == "Open"
                                                    ? SvgPicture.asset(
                                                        "assets/images/minusiconss.svg")
                                                    : SvgPicture.asset(
                                                        "assets/images/plushliness.svg"),
                                              ),
                                            ),
                                          )
                                        ]),
                                      ),
                                      Visibility(
                                          visible:
                                              plush1 == "Open" ? true : false,
                                          child: Container(
                                            margin: EdgeInsets.only(top: 8),
                                            child: Column(
                                              children: <Widget>[
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                AdsResellerPlansActivity()));
                                                  },
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
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
                                                          top: 8,
                                                          bottom: 8,
                                                          left: 10,
                                                          right: 10),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Container(
                                                            child: Container(
                                                              child: Text(
                                                                "Ads Reseller Plans",
                                                                style: TextStyle(
                                                                    fontSize: MediaQuery.of(context)
                                                                            .size
                                                                            .height /
                                                                        60,
                                                                    color: Color(
                                                                        0xff7C7C7C)),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                              child: SvgPicture
                                                                  .asset(
                                                                      "assets/images/arroerightgreyicons.svg"))
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
                                                            builder: (context) =>
                                                                MyBalanceAdsScreen()));
                                                  },
                                                  child: Container(
                                                    margin:
                                                        EdgeInsets.only(top: 8),
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
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
                                                          top: 8,
                                                          bottom: 8,
                                                          left: 10,
                                                          right: 10),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Container(
                                                            child: Container(
                                                              child: Text(
                                                                "My Posted Ads",
                                                                style: TextStyle(
                                                                    fontSize: MediaQuery.of(context)
                                                                            .size
                                                                            .height /
                                                                        60,
                                                                    color: Color(
                                                                        0xff7C7C7C)),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                              child: SvgPicture
                                                                  .asset(
                                                                      "assets/images/arroerightgreyicons.svg"))
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
                                                            builder: (context) =>
                                                                MyPostedAdsScreen()));
                                                  },
                                                  child: Container(
                                                    margin:
                                                        EdgeInsets.only(top: 8),
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
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
                                                          top: 8,
                                                          bottom: 8,
                                                          left: 10,
                                                          right: 10),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Container(
                                                            child: Container(
                                                              child: Text(
                                                                "My Balance Ads",
                                                                style: TextStyle(
                                                                    fontSize: MediaQuery.of(context)
                                                                            .size
                                                                            .height /
                                                                        60,
                                                                    color: Color(
                                                                        0xff7C7C7C)),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                              child: SvgPicture
                                                                  .asset(
                                                                      "assets/images/arroerightgreyicons.svg"))
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
                                                            builder: (context) =>
                                                                PostMyAdsScreen()));
                                                  },
                                                  child: Container(
                                                    margin:
                                                        EdgeInsets.only(top: 8),
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
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
                                                    child: GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            top: 8,
                                                            bottom: 8,
                                                            left: 10,
                                                            right: 10),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: <Widget>[
                                                            GestureDetector(
                                                              onTap: () {},
                                                              child: Container(
                                                                child: Text(
                                                                  "Post Ads",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          MediaQuery.of(context).size.height /
                                                                              60,
                                                                      color: Color(
                                                                          0xff7C7C7C)),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                                child: SvgPicture
                                                                    .asset(
                                                                        "assets/images/arroerightgreyicons.svg"))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ))
                                    ],
                                  ),
                                )),
                            GestureDetector(
                              onTap: () {
                                Toast.show("Coming Soon", context,
                                    duration: Toast.LENGTH_SHORT,
                                    gravity: Toast.BOTTOM);
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              15,
                                      width:
                                          MediaQuery.of(context).size.height /
                                              15,
                                      decoration: BoxDecoration(
                                        color: Color(0xff323232),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                            "assets/images/contactusiconss.svg"),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 15),
                                        child: Text(
                                          "Contact",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  55),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: SvgPicture.asset(
                                          "assets/images/iconsarrorowright.svg"),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Toast.show("Coming Soon", context,
                                    duration: Toast.LENGTH_SHORT,
                                    gravity: Toast.BOTTOM);
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              15,
                                      width:
                                          MediaQuery.of(context).size.height /
                                              15,
                                      decoration: BoxDecoration(
                                        color: Color(0xff323232),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                            "assets/images/termsofusericons.svg"),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 15),
                                        child: Text(
                                          "Terms of Use",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  55),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: SvgPicture.asset(
                                          "assets/images/iconsarrorowright.svg"),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Toast.show("Coming Soon", context,
                                    duration: Toast.LENGTH_SHORT,
                                    gravity: Toast.BOTTOM);
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              15,
                                      width:
                                          MediaQuery.of(context).size.height /
                                              15,
                                      decoration: BoxDecoration(
                                        color: Color(0xff323232),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                            "assets/images/privacypolicyicons.svg"),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 15),
                                        child: Text(
                                          "Privacy Policy",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  55),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: SvgPicture.asset(
                                          "assets/images/iconsarrorowright.svg"),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 15),
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xffF6F6F6),
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 15, top: 15, right: 15, bottom: 15),
                        child: Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Toast.show("Coming Soon", context,
                                    duration: Toast.LENGTH_SHORT,
                                    gravity: Toast.BOTTOM);
                              },
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 15,
                                    width:
                                        MediaQuery.of(context).size.height / 15,
                                    decoration: BoxDecoration(
                                      color: Color(0xff323232),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                          "assets/images/languageiconss.svg"),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(left: 15),
                                      child: Text(
                                        "Languages",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                55),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: SvgPicture.asset(
                                        "assets/images/iconsarrorowright.svg"),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();

                        prefs.remove("email");
                        final GoogleSignIn googleSignIn = GoogleSignIn();
                        googleSignIn.disconnect();

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
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
                            "Logout",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
