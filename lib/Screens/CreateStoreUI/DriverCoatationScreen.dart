import 'package:flutter/material.dart';
import 'package:four_deals_shopping/Controller/DriverQuatationListViewModel.dart';
import 'package:four_deals_shopping/Screens/CreateStoreUI/DriverCoatationDetailPage.dart';
import 'package:stacked/stacked.dart';

class DriverCoatationScreen extends StatefulWidget {
  @override
  State<DriverCoatationScreen> createState() => DriverCoatationScreenState();
}

class DriverCoatationScreenState extends State<DriverCoatationScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DriverQuatationListViewModel>.reactive(
        viewModelBuilder: () => DriverQuatationListViewModel(),
        onModelReady: (model) => {
              model.fetchcurrentorder("6"),
            },
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xffF6F6F6),
                elevation: 1,
                title: Text(
                  "Quotation List",
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
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: model.driverquatation.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DriverCotationDetailsPage()));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(bottom: 15),
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
                            margin:
                                EdgeInsets.only(left: 10, top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 9.2,
                                  width:
                                      MediaQuery.of(context).size.width / 4.6,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          MediaQuery.of(context).size.height /
                                              10),
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
                                          image: NetworkImage(
                                              "https://aswagbuckets3.s3.me-south-1.amazonaws.com/${model.driverquatation[index].image}"),
                                          fit: BoxFit.fill)),
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
                                                  "Driver ID: ${model.driverquatation[index].driverid}",
                                                  style: TextStyle(
                                                      color: Color(0xff707070),
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize:
                                                          MediaQuery.of(context)
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
                                              "Name : ${model.driverquatation[index].firstname} ${model.driverquatation[index].lastname}",
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
                                            "Location : Kuwait",
                                            style: TextStyle(
                                                color: Color(0xff707070),
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    60),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(
                                                child: Text(
                                                  "Delivery Charge : ${model.driverquatation[index].cost} KD",
                                                  style: TextStyle(
                                                      color: Color(0xff707070),
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              50,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),
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
                    }),
              ),
            ));
  }
}
