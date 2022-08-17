import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyPostedAdsScreen extends StatefulWidget {
  @override
  State<MyPostedAdsScreen> createState() => MyPostedAdsScreenState();
}

class MyPostedAdsScreenState extends State<MyPostedAdsScreen> {
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
          "My Balance Ads",
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 45,
              color: Colors.black),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Color(0xffF6F6F6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Text(
                "Balance Ads",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 38,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 40),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/adsbackground.png"),
                      fit: BoxFit.fill)),
              child: Center(
                child: Container(
                  margin:
                      EdgeInsets.only(left: 30, top: 20, right: 30, bottom: 20),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "20 Ads Left",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 40,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          child: SvgPicture.asset(
                              "assets/images/whitecrownimageicons.svg"),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 80),
                child: Text(
                  "Payment History",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 47,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(top: 15),
              width: MediaQuery.of(context).size.width,
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
              ),
              child: Container(
                  child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                    left: 20, right: 5, top: 15),
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
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Container(
                                          child: SvgPicture.asset(
                                            "assets/images/whitecrownimageicons.svg",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        child: Container(
                                      margin: EdgeInsets.only(left: 15),
                                      child: Text(
                                        "Payment Successful",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                50),
                                      ),
                                    )),
                                    Container(
                                        child: Container(
                                      margin: EdgeInsets.only(right: 15),
                                      child: Text(
                                        "+20 Ads",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                50),
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 15),
                                width: MediaQuery.of(context).size.width,
                                height: 1,
                                color: Colors.grey.withOpacity(0.3),
                              )
                            ],
                          ),
                        );
                      })),
            ))
          ],
        ),
      ),
    );
  }
}
