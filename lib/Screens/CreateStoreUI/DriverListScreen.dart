import 'package:flutter/material.dart';
import 'package:four_deals_shopping/Controller/DriversListViewModel.dart';
import 'package:stacked/stacked.dart';

class DriverListScreen extends StatefulWidget {
  String? orderid = null;
  DriverListScreen(this.orderid);
  @override
  State<DriverListScreen> createState() => DriverListScreenState();
}

class DriverListScreenState extends State<DriverListScreen> {
  late String asined = "";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyStoreOrderListViewModel>.reactive(
        viewModelBuilder: () => MyStoreOrderListViewModel(),
        onModelReady: (model) => {
              model.driverlist(),
            },
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xffF6F6F6),
                elevation: 1,
                title: Text(
                  "Drivers List",
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
                      itemCount: model.driverslist.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, index) {
                        return GestureDetector(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                9.2,
                                        width:
                                            MediaQuery.of(context).size.height /
                                                9.2,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
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
                                                image: NetworkImage(
                                                    "https://aswagbuckets3.s3.me-south-1.amazonaws.com/${model.driverslist[index].profileImage}"),
                                                fit: BoxFit.fill)),
                                      ),
                                      Expanded(
                                          child: Container(
                                        margin: EdgeInsets.only(
                                          left: 10,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              child: Text(
                                                "Driver Name: ${model.driverslist[index].firstname} ${model.driverslist[index].lastname}",
                                                style: TextStyle(
                                                    color: Color(0xff707070),
                                                    fontWeight: FontWeight.w700,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            55),
                                              ),
                                            ),
                                            Container(
                                              child: Container(
                                                margin: EdgeInsets.only(top: 3),
                                                child: Text(
                                                  "Mobile : ${model.driverslist[index].mobile}",
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
                                              child: Container(
                                                margin: EdgeInsets.only(top: 3),
                                                child: Text(
                                                  "motorType : ${model.driverslist[index].mottertype}",
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
                                              child: Container(
                                                margin: EdgeInsets.only(top: 3),
                                                child: Text(
                                                  "Location : ${model.driverslist[index].address}",
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
                                          ],
                                        ),
                                      )),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (asined == "") {
                                              asined = index.toString();
                                              model.assignedorder(
                                                  widget.orderid.toString(),
                                                  model.driverslist[index]
                                                      .driverid
                                                      .toString(),
                                                  context);
                                            } else {
                                              asined = "";
                                            }
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 10, right: 15),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
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
                                                  margin: EdgeInsets.only(
                                                      left: 5, right: 5),
                                                  child: Text(
                                                    asined == index.toString()
                                                        ? "Assigned"
                                                        : "Assign",
                                                    style: TextStyle(
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            65,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ))),
                        );
                      })),
            ));
  }
}
