import 'package:flutter/material.dart';

class DriverCotationDetailsPage extends StatefulWidget {
  @override
  State<DriverCotationDetailsPage> createState() =>
      DriverCotationDetailsPageState();
}

class DriverCotationDetailsPageState extends State<DriverCotationDetailsPage> {
  late String request = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF6F6F6),
        elevation: 1,
        title: Text(
          "Quotation Details",
          style: TextStyle(
              color: Colors.black,
              fontSize: MediaQuery.of(context).size.height / 45),
        ),
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
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 15, top: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 10.2,
                    width: MediaQuery.of(context).size.width / 5.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.height / 90),
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
                        image: DecorationImage(
                            image: AssetImage("assets/images/carimages.png"),
                            fit: BoxFit.fill)),
                  ),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(left: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: Container(
                                child: Text(
                                  "Order ID: 233432XX",
                                  style: TextStyle(
                                      color: Color(0xff707070),
                                      fontWeight: FontWeight.w700,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              50),
                                ),
                              )),
                            ],
                          ),
                        ),
                        Container(
                          child: Container(
                            margin: EdgeInsets.only(top: 3),
                            child: Text(
                              "Name : Sheikh Malik",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 60,
                                  color: Color(0xff707070)),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 3),
                          child: Text(
                            "Quantity : 1",
                            style: TextStyle(
                                color: Color(0xff707070),
                                fontSize:
                                    MediaQuery.of(context).size.height / 60),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 3),
                          child: Text(
                            "Location : Kuwait",
                            style: TextStyle(
                                color: Color(0xff707070),
                                fontSize:
                                    MediaQuery.of(context).size.height / 60),
                          ),
                        ),
                      ],
                    ),
                  )),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Price",
                            style: TextStyle(
                                color: Color(0xff707070),
                                fontSize:
                                    MediaQuery.of(context).size.height / 55),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text(
                            "120 KD",
                            style: TextStyle(
                                color: Color(0xff707070),
                                fontSize:
                                    MediaQuery.of(context).size.height / 40,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 15),
              height: 1,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.withOpacity(0.5),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 5),
              child: Text(
                "Driver Detail",
                style: TextStyle(
                    color: Color(0xff707070),
                    fontSize: MediaQuery.of(context).size.height / 45,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 9.2,
                    width: MediaQuery.of(context).size.width / 4.5,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.height / 10),
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
                        image: DecorationImage(
                            image: AssetImage("assets/images/carimages.png"),
                            fit: BoxFit.fill)),
                  ),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 3),
                          child: Text(
                            "Location : Kuwait",
                            style: TextStyle(
                                color: Color(0xff707070),
                                fontWeight: FontWeight.w600,
                                fontSize:
                                    MediaQuery.of(context).size.height / 53),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 3),
                          child: Text(
                            "Street:  Shuwaikh Industry",
                            style: TextStyle(
                                color: Color(0xff707070),
                                fontSize:
                                    MediaQuery.of(context).size.height / 53),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 3),
                          child: Text(
                            "City:   Al-shuwaikh",
                            style: TextStyle(
                                color: Color(0xff707070),
                                fontSize:
                                    MediaQuery.of(context).size.height / 53),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 3),
                          child: Text(
                            "State/province/area:    Al-Shuwaikh",
                            style: TextStyle(
                                color: Color(0xff707070),
                                fontSize:
                                    MediaQuery.of(context).size.height / 53),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 3),
                          child: Text(
                            "Phone number :  4823039",
                            style: TextStyle(
                                color: Color(0xff707070),
                                fontSize:
                                    MediaQuery.of(context).size.height / 53),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 3),
                          child: Text(
                            "Country calling code :  +965",
                            style: TextStyle(
                                color: Color(0xff707070),
                                fontSize:
                                    MediaQuery.of(context).size.height / 53),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 3),
                          child: Text(
                            "Country :  Kuwait",
                            style: TextStyle(
                                color: Color(0xff707070),
                                fontSize:
                                    MediaQuery.of(context).size.height / 53),
                          ),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 15),
              height: 1,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.withOpacity(0.5),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Text(
                "Quotation Price",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 43,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Delevery Cost",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 50,
                                color: Color(0xff969696)),
                          ),
                        ),
                        Container(
                          child: Text(
                            "120 KD",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 45,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Total",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 50,
                                color: Color(0xff969696)),
                          ),
                        ),
                        Container(
                          child: Text(
                            "125 KD",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 35,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                              color: Color(0xff67A400),
                              borderRadius: BorderRadius.circular(5)),
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 30, right: 30, top: 10, bottom: 10),
                            child: Text(
                              "Accept",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 50,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Color(0xff67A400)),
                              borderRadius: BorderRadius.circular(5)),
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 30, right: 30, top: 10, bottom: 10),
                            child: Text(
                              "Decline",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 50,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
