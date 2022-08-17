import 'package:flutter/material.dart';
import 'package:four_deals_shopping/Controller/MyCurrentOrderViewModel.dart';
import 'package:four_deals_shopping/Screens/Myorderdetailspage.dart';
import 'package:stacked/stacked.dart';

class DeclinedOrderScreen extends StatefulWidget {
  @override
  State<DeclinedOrderScreen> createState() => DeclinedOrderScreenState();
}

class DeclinedOrderScreenState extends State<DeclinedOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyCurrentOrderViewModel>.reactive(
        viewModelBuilder: () => MyCurrentOrderViewModel(),
        onModelReady: (model) => {model.fetchcurrentorder("COMPLETED")},
        builder: (context, model, child) => Scaffold(
              body: Container(
                  child: ListView.builder(
                      itemCount: model.currentorder.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, index) {
                        return GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => MyOrderDetailsPage(
                            //             model.currentorder[index].storeid
                            //                 .toString())));
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(left: 14, top: 15),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            child: Text(
                                              model.currentorder[index]
                                                  .addtitile,
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          55,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 2),
                                            child: Text(
                                              "Brand : Adidas",
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          65,
                                                  color: Color(0xffA5A5A5)),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 15),
                                            child: Row(
                                              children: <Widget>[
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Color(0xff78BC05),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5,
                                                        right: 5,
                                                        top: 2,
                                                        bottom: 2),
                                                    child: Row(
                                                      children: <Widget>[
                                                        Container(
                                                          child: Text(
                                                            "4.5",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    63),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 3),
                                                          child: Icon(
                                                            Icons.star,
                                                            color: Colors.white,
                                                            size: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                50,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 5),
                                                  child: Text(
                                                    "( 27 )",
                                                    style: TextStyle(
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            65,
                                                        color:
                                                            Color(0xffA5A5A5)),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 8),
                                            child: Text(
                                              "${model.currentorder[index].amount} KD",
                                              style: TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          65,
                                                  color: Color(0xffA5A5A5)),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 3),
                                            child: Text(
                                              "${model.currentorder[index].amount} KD",
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          55,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 3, right: 5),
                                            child: Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Expanded(
                                                      child: Container(
                                                    child: Text(
                                                      "Delivery in 2 Days, Wed",
                                                      style: TextStyle(
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            70,
                                                      ),
                                                    ),
                                                  )),
                                                  Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              color: Color(
                                                                  0xffF5F5F5),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          3)),
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 5,
                                                                    right: 5,
                                                                    top: 2,
                                                                    bottom: 2),
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                Container(
                                                                  child: Icon(
                                                                    Icons
                                                                        .download,
                                                                    color: Colors
                                                                        .black,
                                                                    size: MediaQuery.of(context)
                                                                            .size
                                                                            .height /
                                                                        50,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              3),
                                                                  child: Text(
                                                                    "Invoice",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            MediaQuery.of(context).size.height /
                                                                                63),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        right: 20, top: 20, bottom: 20),
                                    height: MediaQuery.of(context).size.height /
                                        6.4,
                                    width:
                                        MediaQuery.of(context).size.width / 2.9,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "${"https://aswagbuckets3.s3.me-south-1.amazonaws.com/"}${model.currentorder[index].thumnails}"),
                                            fit: BoxFit.fill)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      })),
            ));
  }
}
