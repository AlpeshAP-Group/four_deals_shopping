import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyBalanceAdsScreen extends StatefulWidget {
  @override
  State<MyBalanceAdsScreen> createState() => MyBalanceAdsScreenState();
}

class MyBalanceAdsScreenState extends State<MyBalanceAdsScreen> {
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
          "My Posted Ads",
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 45,
              color: Colors.black),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Container(
            margin: EdgeInsets.only(top: 30),
            child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(color: Colors.white),
                          child: Container(
                            margin:
                                EdgeInsets.only(left: 20, top: 15, bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 11,
                                  width:
                                      MediaQuery.of(context).size.height / 11,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/carimages.png"),
                                          fit: BoxFit.fill)),
                                ),
                                Expanded(
                                    child: Container(
                                  margin: EdgeInsets.only(
                                      left: 15, top: 3, bottom: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          "Puma Clyde x Patta",
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  47,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 15),
                                        child: Text(
                                          "Puma Clyde x Patta",
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                50,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                                Container(
                                  margin: EdgeInsets.only(right: 20),
                                  child: SvgPicture.asset(
                                      "assets/images/iconsarrorowright.svg"),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: 3,
                            color: Color(0xffF6F6F6))
                      ],
                    ),
                  );
                })),
      ),
    );
  }
}
