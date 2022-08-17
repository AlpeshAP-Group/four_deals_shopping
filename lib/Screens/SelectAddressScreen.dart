import 'package:flutter/material.dart';
import 'package:four_deals_shopping/Controller/SelectAddressViewModel.dart';
import 'package:four_deals_shopping/Screens/AddAddressCart.dart';
import 'package:four_deals_shopping/Screens/CheckOutScreen2.dart';
import 'package:stacked/stacked.dart';

class SelectAddressScreen extends StatefulWidget {
  String? storeid = null;
  SelectAddressScreen(this.storeid);
  @override
  State<SelectAddressScreen> createState() => SelectAddressScreenState();
}

class SelectAddressScreenState extends State<SelectAddressScreen> {
  int _radioSelected = 0;
  late String _radioVal = "";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SelectAddressViewModel>.reactive(
        viewModelBuilder: () => SelectAddressViewModel(),
        onModelReady: (model) => {model.fetchstorelist()},
        builder: (context, model, child) => Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Color(0xffF6F6F6),
                elevation: 3,
                titleSpacing: 0,
                title: Text("Select Address",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 45,
                        color: Colors.black)),
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
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.only(top: 20),
                            child: ListView.builder(
                                itemCount: model.addresslist.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(
                                        left: 20, right: 20, top: 20),
                                    decoration: BoxDecoration(
                                      color: Color(0xffF7F7F7),
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        //background color of box
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),

                                          blurRadius: 1.5, // soften the shadow
                                          spreadRadius: 1.5, //extend the shadow
                                          offset: Offset(
                                            0.0, // Move to right 10  horizontally
                                            2.0, // Move to bottom 10 Vertically
                                          ),
                                        )
                                      ],
                                    ),
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(top: 8, bottom: 8),
                                      child: Row(
                                        children: <Widget>[
                                          Radio(
                                            value: model
                                                .addresslist[index].addressid,
                                            groupValue: _radioSelected,
                                            activeColor: Colors.blue,
                                            onChanged: (value) {
                                              setState(() {
                                                _radioSelected = model
                                                    .addresslist[index]
                                                    .addressid;
                                                _radioVal = model
                                                    .addresslist[index]
                                                    .addressid
                                                    .toString();
                                              });
                                            },
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Expanded(
                                                    child: Container(
                                                  margin:
                                                      EdgeInsets.only(left: 13),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Container(
                                                        child: Text(
                                                          "Name : ${model.addresslist[index].name}",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  50),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: 3),
                                                        child: Text(
                                                          "Street:  Shuwaikh Industry",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  55),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: 3),
                                                        child: Text(
                                                          "City:   ${model.addresslist[index].cityName.toString()}",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  55),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: 3),
                                                        child: Text(
                                                          "State/province/area:    Al-Shuwaikh",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  55),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: 3),
                                                        child: Text(
                                                          "Phone number:  ${model.addresslist[index].mobile}",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  55),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: 3),
                                                        child: Text(
                                                          "Country calling code  +965",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  55),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: 3),
                                                        child: Text(
                                                          "Country  Kuwait",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  55),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )),
                                                GestureDetector(
                                                  onTap: () {
                                                    model.deletaddress(
                                                        model.addresslist[index]
                                                            .addressid
                                                            .toString(),
                                                        context);
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        right: 5),
                                                    child: Icon(Icons.delete),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                })),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AddAddressCartScreen()));
                        },
                        child: Text(
                          "Add new Address",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height / 45,
                              color: Color(0xff2696CC),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CheckOutScreen2(
                                      _radioVal, widget.storeid.toString())));
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 30, right: 30, top: 20, bottom: 20),
                          height: MediaQuery.of(context).size.height / 18,
                          decoration: BoxDecoration(
                              color: Color(0xff2696CC),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              "Checkout",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
