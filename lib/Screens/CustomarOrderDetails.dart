import 'package:flutter/material.dart';
import 'package:four_deals_shopping/Controller/MyStoreOrderListViewModel.dart';
import 'package:four_deals_shopping/Screens/CreateStoreUI/DriverCoatationScreen.dart';
import 'package:four_deals_shopping/Screens/CreateStoreUI/DriverListScreen.dart';
import 'package:stacked/stacked.dart';

class CustomarOrderDetails extends StatefulWidget {
  int? index = null;

  CustomarOrderDetails(this.index);

  @override
  State<CustomarOrderDetails> createState() => CustomarOrderDetailsState();
}

class CustomarOrderDetailsState extends State<CustomarOrderDetails> {
  late String request = "";

  String dropdownvalue = 'Select Driver';

  // List of items in our dropdown menu
  var items = [
    'Select Driver',
    'Assign Driver',
    'Assign Own Driver',
  ];
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
                                    image: AssetImage(
                                        "assets/images/carimages.png"),
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
                                          "Order ID: ${widget.index == null ? "" : model.seacrhlist[widget.index!].orderid.toString()}",
                                          style: TextStyle(
                                              color: Color(0xff707070),
                                              fontWeight: FontWeight.w700,
                                              fontSize: MediaQuery.of(context)
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
                                    margin: EdgeInsets.only(top: 3),
                                    child: Text(
                                      "Name : ${widget.index == null ? "" : model.seacrhlist[widget.index!].customerdetails["firstName"]}",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
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
                                    "Quantity : 1",
                                    style: TextStyle(
                                        color: Color(0xff707070),
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                60),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  child: Text(
                                    "Location : ${widget.index == null ? "" : model.seacrhlist[widget.index!].shipaddress["city"]}",
                                    style: TextStyle(
                                        color: Color(0xff707070),
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                60),
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
                                            MediaQuery.of(context).size.height /
                                                55),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Text(
                                    "${widget.index == null ? "" : model.seacrhlist[widget.index!].amount} KD",
                                    style: TextStyle(
                                        color: Color(0xff707070),
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                40,
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
                        "Customer Detail",
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
                            height: MediaQuery.of(context).size.height / 8.2,
                            width: MediaQuery.of(context).size.width / 4.0,
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
                                    image: AssetImage(
                                        "assets/images/carimages.png"),
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
                                    "Location : ${widget.index == null ? "" : model.seacrhlist[widget.index!].shipaddress["city"]}",
                                    style: TextStyle(
                                        color: Color(0xff707070),
                                        fontWeight: FontWeight.w600,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                53),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  child: Text(
                                    "Street:  ${widget.index == null ? "" : model.seacrhlist[widget.index!].shipaddress["street"]}",
                                    style: TextStyle(
                                        color: Color(0xff707070),
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                53),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  child: Text(
                                    "City:    ${widget.index == null ? "" : model.seacrhlist[widget.index!].shipaddress["city"]}",
                                    style: TextStyle(
                                        color: Color(0xff707070),
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                53),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  child: Text(
                                    "State/province/area:   ${widget.index == null ? "" : model.seacrhlist[widget.index!].shipaddress["street"]}",
                                    style: TextStyle(
                                        color: Color(0xff707070),
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                53),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  child: Text(
                                    "Phone number :  ${widget.index == null ? "" : model.seacrhlist[widget.index!].shipaddress["mobile"]}",
                                    style: TextStyle(
                                        color: Color(0xff707070),
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                53),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  child: Text(
                                    "Country calling code :  +965",
                                    style: TextStyle(
                                        color: Color(0xff707070),
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                53),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  child: Text(
                                    "Country :  Kuwait",
                                    style: TextStyle(
                                        color: Color(0xff707070),
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                53),
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
                        "Total Price",
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
                                    "Sub-Total",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50,
                                        color: Color(0xff969696)),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "120 KD",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                45,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "Shipping Cost",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50,
                                        color: Color(0xff969696)),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "+5 KD",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                45,
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
                                            MediaQuery.of(context).size.height /
                                                50,
                                        color: Color(0xff969696)),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "125 KD",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                35,
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
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DriverCoatationScreen()));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 15, right: 15, top: 50, bottom: 20),
                                  height:
                                      MediaQuery.of(context).size.height / 20,
                                  decoration: BoxDecoration(
                                      color: Color(0xff67A400),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      "Driver Quotation List",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              60),
                                    ),
                                  ),
                                )),
                          ),
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.only(
                                left: 15, right: 15, top: 50, bottom: 20),
                            height: MediaQuery.of(context).size.height / 20,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Color(0xff67A400),
                                ),
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                child: DropdownButton(
                                  // Initial Value
                                  value: dropdownvalue,
                                  isExpanded: true,

                                  // Down Arrow Icon
                                  icon: const Icon(Icons.keyboard_arrow_down),

                                  // Array list of items
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  // After selecting the desired option,it will
                                  // change button value to selected value
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownvalue = newValue!;
                                      print(dropdownvalue);
                                      if (dropdownvalue ==
                                          "Assign Own Driver") {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DriverListScreen(model
                                                        .seacrhlist[
                                                            widget.index!]
                                                        .orderid
                                                        .toString())));
                                      } else {
                                        model.assignedorder(
                                            model.seacrhlist[widget.index!]
                                                .orderid
                                                .toString(),
                                            "BIKE",
                                            context);
                                      }
                                    });
                                  },
                                ),
                              ),
                            ),
                          ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
