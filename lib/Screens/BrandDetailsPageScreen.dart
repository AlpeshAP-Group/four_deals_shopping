import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BrandDetailsPageActivity extends StatefulWidget {
  @override
  State<BrandDetailsPageActivity> createState() =>
      BrandDetailsPageActivityState();
}

class BrandDetailsPageActivityState extends State<BrandDetailsPageActivity> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
        title: Text(
          "Cars",
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 45,
              color: Colors.black),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/branderdetailspagebanner.png"),
                      fit: BoxFit.fill)),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, left: 15, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Notification from this Brand",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 55,
                          color: Color(0xff707070),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    child: Switch(
                        value: isSwitched,
                        onChanged: (bool value) {
                          print(value);
                          if (isSwitched == false) {
                            setState(() {
                              isSwitched = true;
                            });
                            print('Switch Button is ON');
                          } else {
                            setState(() {
                              isSwitched = false;
                            });
                            print('Switch Button is OFF');
                          }
                        }),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: GridView.count(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 5,
                      childAspectRatio: 2 / 2.6,
                      controller: new ScrollController(keepScrollOffset: false),
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.width / 5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 3, color: Color(0xff2696CC))),
                                child: Center(
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.width / 10,
                                    width:
                                        MediaQuery.of(context).size.height / 15,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/audipickurees.png"))),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                child: Text("A4"),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.width / 5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 3, color: Color(0xff2696CC))),
                                child: Center(
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.width / 10,
                                    width:
                                        MediaQuery.of(context).size.height / 15,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/audipickurees.png"))),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                child: Text("A4"),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.width / 5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 3, color: Color(0xff2696CC))),
                                child: Center(
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.width / 10,
                                    width:
                                        MediaQuery.of(context).size.height / 15,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/audipickurees.png"))),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                child: Text("A4"),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.width / 5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 3, color: Color(0xff2696CC))),
                                child: Center(
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.width / 10,
                                    width:
                                        MediaQuery.of(context).size.height / 15,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/audipickurees.png"))),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                child: Text("A4"),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.width / 5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 3, color: Color(0xff2696CC))),
                                child: Center(
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.width / 10,
                                    width:
                                        MediaQuery.of(context).size.height / 15,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/audipickurees.png"))),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                child: Text("A4"),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.width / 5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 3, color: Color(0xff2696CC))),
                                child: Center(
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.width / 10,
                                    width:
                                        MediaQuery.of(context).size.height / 15,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/audipickurees.png"))),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                child: Text("A4"),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.width / 5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 3, color: Color(0xff2696CC))),
                                child: Center(
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.width / 10,
                                    width:
                                        MediaQuery.of(context).size.height / 15,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/audipickurees.png"))),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                child: Text("A4"),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.width / 5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 3, color: Color(0xff2696CC))),
                                child: Center(
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.width / 10,
                                    width:
                                        MediaQuery.of(context).size.height / 15,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/audipickurees.png"))),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                child: Text("A4"),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.width / 5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 3, color: Color(0xff2696CC))),
                                child: Center(
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.width / 10,
                                    width:
                                        MediaQuery.of(context).size.height / 15,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/audipickurees.png"))),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                child: Text("A4"),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.width / 5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 3, color: Color(0xff2696CC))),
                                child: Center(
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.width / 10,
                                    width:
                                        MediaQuery.of(context).size.height / 15,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/audipickurees.png"))),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                child: Text("A4"),
                              )
                            ],
                          ),
                        )
                      ])),
            )
          ],
        ),
      ),
    );
  }
}
