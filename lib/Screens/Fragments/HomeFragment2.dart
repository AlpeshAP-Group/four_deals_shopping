import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_deals_shopping/Screens/UpgradYouPlanScreen2.dart';

class UpgradeYouPlanActivity extends StatefulWidget {
  @override
  State<UpgradeYouPlanActivity> createState() => UpgradeYouPlanActivityState();
}

class UpgradeYouPlanActivityState extends State<UpgradeYouPlanActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: Text(
            "Upgrade your account",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.height / 45,
                color: Colors.black),
          ),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 8.7,
                      width: MediaQuery.of(context).size.width / 3.6,
                      child: Align(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 8.7,
                          width: MediaQuery.of(context).size.width / 3.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/crowoneimage.png"),
                                fit: BoxFit.fill),
                          ),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 30,
                                  width: MediaQuery.of(context).size.width / 10,
                                  margin: EdgeInsets.only(right: 10),
                                  child: SvgPicture.asset(
                                    "assets/images/crowiconsimage.svg",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                margin: EdgeInsets.only(top: 3),
                                child: Text(
                                  "20 KD",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              40,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              )),
                              Container(
                                margin: EdgeInsets.only(bottom: 4),
                                child: Text(
                                  "KWD/Month",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              70,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 8.7,
                      width: MediaQuery.of(context).size.width / 3.6,
                      child: Align(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 8.7,
                          width: MediaQuery.of(context).size.width / 3.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/crowicongreen.png"),
                                fit: BoxFit.fill),
                          ),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 30,
                                  width: MediaQuery.of(context).size.width / 10,
                                  margin: EdgeInsets.only(right: 10),
                                  child: SvgPicture.asset(
                                    "assets/images/greencrowniconssss.svg",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                margin: EdgeInsets.only(top: 3),
                                child: Text(
                                  "20 KD",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              40,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              )),
                              Container(
                                margin: EdgeInsets.only(bottom: 4),
                                child: Text(
                                  "KWD/Month",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              70,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 8.7,
                      width: MediaQuery.of(context).size.width / 3.6,
                      child: Align(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 8.7,
                          width: MediaQuery.of(context).size.width / 3.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/orangescreenui.png"),
                                fit: BoxFit.fill),
                          ),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 30,
                                  width: MediaQuery.of(context).size.width / 10,
                                  margin: EdgeInsets.only(right: 10),
                                  child: SvgPicture.asset(
                                    "assets/images/orangecronicons.svg",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                margin: EdgeInsets.only(top: 3),
                                child: Text(
                                  "20 KD",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              40,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              )),
                              Container(
                                margin: EdgeInsets.only(bottom: 4),
                                child: Text(
                                  "KWD/Month",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              70,
                                      color: Colors.white,
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
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 30, left: 20),
                      child: Text(
                        "Features",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 42,
                            color: Color(0xff797979),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "Number of Active Listing",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                57,
                                        color: Color(0xff797979),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "Lorem ipsum dolor sit amet,",
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              65,
                                      color: Color(0xff797979),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: SvgPicture.asset(
                                "assets/images/bluetickiconss.svg"),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "Number of Active Listing",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                57,
                                        color: Color(0xff797979),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "Lorem ipsum dolor sit amet,",
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              65,
                                      color: Color(0xff797979),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: SvgPicture.asset(
                                "assets/images/bluetickiconss.svg"),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "Number of Active Listing",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                57,
                                        color: Color(0xff797979),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "Lorem ipsum dolor sit amet,",
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              65,
                                      color: Color(0xff797979),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: SvgPicture.asset(
                                "assets/images/bluetickiconss.svg"),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "Number of Active Listing",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                57,
                                        color: Color(0xff797979),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "Lorem ipsum dolor sit amet,",
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              65,
                                      color: Color(0xff797979),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: SvgPicture.asset(
                                "assets/images/cancleiconsred.svg"),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "Number of Active Listing",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                57,
                                        color: Color(0xff797979),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "Lorem ipsum dolor sit amet,",
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              65,
                                      color: Color(0xff797979),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: SvgPicture.asset(
                                "assets/images/cancleiconsred.svg"),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    UpgradeYourPlanScreenTwo()));
                      },
                      child: Align(
                        child: Container(
                          margin: EdgeInsets.only(left: 30, right: 30, top: 50),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 15,
                          decoration: BoxDecoration(
                              color: Color(0xffF9B303),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              "Buy Now",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 50,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
