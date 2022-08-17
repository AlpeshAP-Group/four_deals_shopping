import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_deals_shopping/Controller/MyStoreOrderListViewModel.dart';
import 'package:four_deals_shopping/Screens/CreateStoreUI/DriverCoatationScreen.dart';
import 'package:four_deals_shopping/Screens/CustomarOrderDetails.dart';
import 'package:stacked/stacked.dart';

class MyOrderScreen extends StatefulWidget {
  @override
  State<MyOrderScreen> createState() => MyOrderScreenState();
}

class MyOrderScreenState extends State<MyOrderScreen> {
  late String value = "";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyStoreOrderListViewModel>.reactive(
        viewModelBuilder: () => MyStoreOrderListViewModel(),
        onModelReady: (model) => {
              model.fetchcurrentorder(),
            },
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xffF6F6F6),
                elevation: 1,
                title: Text(
                  "Customer Order",
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
                  child: ListView.builder(
                      itemCount: model.seacrhlist.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CustomarOrderDetails(index)));
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => DriverCoatationScreen()));
                          },
                          child: Container(
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
                              margin: EdgeInsets.only(
                                  left: 10, top: 10, bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              8.2,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4.0,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          10),
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
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/carimages.png"),
                                                  fit: BoxFit.fill)),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 5),
                                          child: Text(
                                            model.seacrhlist[index].delstatus,
                                            style: TextStyle(
                                                color: Color(0xff707070),
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    57,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: Column(
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
                                                    "Order ID: ${model.seacrhlist[index].orderid}",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff707070),
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            50),
                                                  ),
                                                )),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Container(
                                              margin: EdgeInsets.only(top: 5),
                                              child: Text(
                                                "Name : ${model.seacrhlist[index].customerdetails["firstName"]}",
                                                style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            60,
                                                    color: Color(0xff707070)),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 3),
                                            child: Text(
                                              "Location : ${model.seacrhlist[index].shipaddress["city"]}",
                                              style: TextStyle(
                                                  color: Color(0xff707070),
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          60),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 3),
                                            child: Text(
                                              "Quantity : ${model.seacrhlist[index].totalitems}",
                                              style: TextStyle(
                                                  color: Color(0xff707070),
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          60),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Container(
                                                  child: Text(
                                                    model.seacrhlist[index]
                                                        .amount,
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff707070),
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            50,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    dialogbutton(index);
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 10),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        //background color of box
                                                        BoxShadow(
                                                          color: Colors.black
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
                                                          top: 5,
                                                          left: 5,
                                                          bottom: 5,
                                                          right: 5),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 5,
                                                                    right: 5),
                                                            child: Text(
                                                              "Driver Assigned",
                                                              style: TextStyle(
                                                                  fontSize: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height /
                                                                      65,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
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
                          ),
                        );
                      })),
            ));
  }

  void dialogbutton(int index) {
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
                height: MediaQuery.of(context).size.height / 5.5,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "Cab You Required?",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 40,
                            color: Color(0xff707070)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                value = "1";
                              });
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height / 30,
                              width: MediaQuery.of(context).size.height / 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 0.5,
                                      color: value == "1"
                                          ? Color(0xff2696CC)
                                          : Colors.grey)),
                              child: value == "1"
                                  ? Center(
                                      child: Icon(
                                        Icons.done,
                                        color: Color(0xff2696CC),
                                      ),
                                    )
                                  : Container(),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text(
                              "Bike",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 45),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                value = "2";
                              });
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height / 30,
                              width: MediaQuery.of(context).size.height / 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 0.5,
                                      color: value == "2"
                                          ? Color(0xff2696CC)
                                          : Colors.grey)),
                              child: value == "2"
                                  ? Center(
                                      child: Icon(
                                        Icons.done,
                                        color: Color(0xff2696CC),
                                      ),
                                    )
                                  : Container(),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text(
                              "Cab",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 45),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                value = "3";
                              });
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height / 30,
                              width: MediaQuery.of(context).size.height / 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 0.5,
                                      color: value == "3"
                                          ? Color(0xff2696CC)
                                          : Colors.grey)),
                              child: value == "3"
                                  ? Center(
                                      child: Icon(
                                        Icons.done,
                                        color: Color(0xff2696CC),
                                      ),
                                    )
                                  : Container(),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text(
                              "Truck",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 45),
                            ),
                          )
                        ],
                      ),
                    )
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CustomarOrderDetails(index)));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(bottom: 10),
                          width: MediaQuery.of(context).size.width / 1.8,
                          height: MediaQuery.of(context).size.height / 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff2696CC)),
                          child: Text(
                            "Select",
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
