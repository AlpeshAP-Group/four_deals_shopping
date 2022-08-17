import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_deals_shopping/Controller/MyCurrentOrderViewModel.dart';
import 'package:stacked/stacked.dart';

class MyOrderDetailsPage extends StatefulWidget {
  String? salesid = null;
  MyOrderDetailsPage(this.salesid);
  @override
  State<MyOrderDetailsPage> createState() => MyOrderDetailsPageState();
}

class MyOrderDetailsPageState extends State<MyOrderDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyCurrentOrderViewModel>.reactive(
        viewModelBuilder: () => MyCurrentOrderViewModel(),
        onModelReady: (model) =>
            {model.fetchstatusdelevery(widget.salesid.toString())},
        builder: (context, model, child) => Scaffold(
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
                  "My Order",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 45,
                      color: Colors.black),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
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
                          margin:
                              EdgeInsets.only(right: 10, top: 10, bottom: 10),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 25),
                                  child: Text(
                                    "Arriving Friday",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                38,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                height:
                                    MediaQuery.of(context).size.height / 6.8,
                                width: MediaQuery.of(context).size.width / 3.5,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(model.productimage),
                                        fit: BoxFit.fill)),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        decoration: BoxDecoration(
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
                          margin:
                              EdgeInsets.only(left: 30, top: 15, bottom: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    (model.deleverystatus == "PLACED")
                                        ? Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                20,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                20,
                                            decoration: BoxDecoration(
                                                color: Color(0xff67A400),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Center(
                                              child: SvgPicture.asset(
                                                  "assets/images/righttickicons.svg"),
                                            ),
                                          )
                                        : Container(
                                            child:
                                                (model.deleverystatus ==
                                                        "PICKED")
                                                    ? Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            20,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            20,
                                                        decoration: BoxDecoration(
                                                            color: Color(
                                                                0xff67A400),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: Center(
                                                          child: SvgPicture.asset(
                                                              "assets/images/righttickicons.svg"),
                                                        ),
                                                      )
                                                    : Container(
                                                        child:
                                                            (model.deleverystatus ==
                                                                    "")
                                                                ? Container(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height /
                                                                        20,
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .height /
                                                                        20,
                                                                    decoration: BoxDecoration(
                                                                        color: Color(
                                                                            0xff67A400),
                                                                        borderRadius:
                                                                            BorderRadius.circular(5)),
                                                                    child:
                                                                        Center(
                                                                      child: SvgPicture
                                                                          .asset(
                                                                              "assets/images/righttickicons.svg"),
                                                                    ),
                                                                  )
                                                                : Container(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height /
                                                                        20,
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .height /
                                                                        20,
                                                                    decoration: BoxDecoration(
                                                                        border: Border.all(
                                                                            width:
                                                                                2,
                                                                            color: Colors.grey.withOpacity(
                                                                                0.3)),
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.circular(5)),
                                                                    child:
                                                                        Center(
                                                                      child: SvgPicture
                                                                          .asset(
                                                                              "assets/images/righttickicons.svg"),
                                                                    ),
                                                                  ),
                                                      ),
                                          ),
                                    Expanded(
                                        child: Container(
                                      margin: EdgeInsets.only(left: 15),
                                      child: Text(
                                        "Ordered Saturday, 5 Sept ",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                50,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                              if (model.deleverystatus == "PLACED") ...[
                                Container(
                                    margin: EdgeInsets.only(left: 18),
                                    height:
                                        MediaQuery.of(context).size.height / 30,
                                    width: 4,
                                    color: Color(0xff67A400)),
                              ] else if (model.deleverystatus == "PICKED") ...[
                                Container(
                                    margin: EdgeInsets.only(left: 18),
                                    height:
                                        MediaQuery.of(context).size.height / 30,
                                    width: 4,
                                    color: Color(0xff67A400)),
                              ] else ...[
                                Container(
                                    margin: EdgeInsets.only(left: 18),
                                    height:
                                        MediaQuery.of(context).size.height / 30,
                                    width: 4,
                                    color: Colors.grey.withOpacity(0.5)),
                              ],
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    if (model.deleverystatus == "PLACED") ...[
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                20,
                                        width:
                                            MediaQuery.of(context).size.height /
                                                20,
                                        decoration: BoxDecoration(
                                            color: Color(0xff67A400),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: SvgPicture.asset(
                                              "assets/images/righttickicons.svg"),
                                        ),
                                      ),
                                    ] else if (model.deleverystatus ==
                                        "PICKED") ...[
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                20,
                                        width:
                                            MediaQuery.of(context).size.height /
                                                20,
                                        decoration: BoxDecoration(
                                            color: Color(0xff67A400),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: SvgPicture.asset(
                                              "assets/images/righttickicons.svg"),
                                        ),
                                      ),
                                    ] else if (model.deleverystatus ==
                                        "DELIVERED") ...[
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                20,
                                        width:
                                            MediaQuery.of(context).size.height /
                                                20,
                                        decoration: BoxDecoration(
                                            color: Color(0xff67A400),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: SvgPicture.asset(
                                              "assets/images/righttickicons.svg"),
                                        ),
                                      ),
                                    ] else ...[
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                20,
                                        width:
                                            MediaQuery.of(context).size.height /
                                                20,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2,
                                                color: Colors.grey
                                                    .withOpacity(0.3)),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: SvgPicture.asset(
                                              "assets/images/righttickicons.svg"),
                                        ),
                                      )
                                    ],
                                    Expanded(
                                        child: Container(
                                      margin: EdgeInsets.only(left: 15),
                                      child: Text(
                                        "Shipped Sunday, 6 Sept",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                50,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                              if (model.deleverystatus == "PICKED") ...[
                                Container(
                                    margin: EdgeInsets.only(left: 18),
                                    height:
                                        MediaQuery.of(context).size.height / 30,
                                    width: 4,
                                    color: Color(0xff67A400)),
                              ] else if (model.deleverystatus ==
                                  "DELIVERED") ...[
                                Container(
                                    margin: EdgeInsets.only(left: 18),
                                    height:
                                        MediaQuery.of(context).size.height / 30,
                                    width: 4,
                                    color: Color(0xff67A400)),
                              ] else ...[
                                Container(
                                    margin: EdgeInsets.only(left: 18),
                                    height:
                                        MediaQuery.of(context).size.height / 30,
                                    width: 4,
                                    color: Colors.grey.withOpacity(0.5)),
                              ],
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    if (model.deleverystatus == "PICKED") ...[
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                20,
                                        width:
                                            MediaQuery.of(context).size.height /
                                                20,
                                        decoration: BoxDecoration(
                                            color: Color(0xff67A400),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: SvgPicture.asset(
                                              "assets/images/righttickicons.svg"),
                                        ),
                                      ),
                                    ] else if (model.deleverystatus ==
                                        "DELIVERED") ...[
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                20,
                                        width:
                                            MediaQuery.of(context).size.height /
                                                20,
                                        decoration: BoxDecoration(
                                            color: Color(0xff67A400),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: SvgPicture.asset(
                                              "assets/images/righttickicons.svg"),
                                        ),
                                      ),
                                    ] else ...[
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                20,
                                        width:
                                            MediaQuery.of(context).size.height /
                                                20,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2,
                                                color: Colors.grey
                                                    .withOpacity(0.3)),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: SvgPicture.asset(
                                              "assets/images/righttickicons.svg"),
                                        ),
                                      )
                                    ],
                                    Expanded(
                                        child: Container(
                                      margin: EdgeInsets.only(left: 15),
                                      child: Text(
                                        "Out for delivery",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                50,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                              if (model.deleverystatus == "DELIVERED") ...[
                                Container(
                                    margin: EdgeInsets.only(left: 18),
                                    height:
                                        MediaQuery.of(context).size.height / 30,
                                    width: 4,
                                    color: Color(0xff67A400)),
                              ] else ...[
                                Container(
                                    margin: EdgeInsets.only(left: 18),
                                    height:
                                        MediaQuery.of(context).size.height / 30,
                                    width: 4,
                                    color: Colors.grey.withOpacity(0.5)),
                              ],
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    if (model.deleverystatus ==
                                        "DELIVERED") ...[
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                20,
                                        width:
                                            MediaQuery.of(context).size.height /
                                                20,
                                        decoration: BoxDecoration(
                                            color: Color(0xff67A400),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: SvgPicture.asset(
                                              "assets/images/righttickicons.svg"),
                                        ),
                                      ),
                                    ] else ...[
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                20,
                                        width:
                                            MediaQuery.of(context).size.height /
                                                20,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2,
                                                color: Colors.grey
                                                    .withOpacity(0.3)),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: SvgPicture.asset(
                                              "assets/images/righttickicons.svg"),
                                        ),
                                      )
                                    ],
                                    Expanded(
                                        child: Container(
                                      margin: EdgeInsets.only(left: 15),
                                      child: Text(
                                        "Arriving Friday",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                50,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 15),
                        decoration: BoxDecoration(
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
                          margin:
                              EdgeInsets.only(top: 10, left: 15, bottom: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Shipment Details :",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              40,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 30, top: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        "Street: ${model.street}",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                55,
                                            color: Color(0xff888888)),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Text(
                                        "City:  ${model.City}",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                55,
                                            color: Color(0xff888888)),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Text(
                                        "State/province/area:    Al-Shuwaikh",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                55,
                                            color: Color(0xff888888)),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Text(
                                        "Phone number  ${model.number}",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                55,
                                            color: Color(0xff888888)),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Text(
                                        "Country calling code  +965",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                55,
                                            color: Color(0xff888888)),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Text(
                                        "Country  Kuwait",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                55,
                                            color: Color(0xff888888)),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  color: Color(0xffF6F6F6),
                ),
              ),
            ));
  }
}
