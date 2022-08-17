import 'package:animated_radio_buttons/animated_radio_buttons.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_deals_shopping/Controller/StoreDetailsViewModel.dart';
import 'package:four_deals_shopping/Screens/SelectAddressScreen.dart';
import 'package:stacked/stacked.dart';

class CheckOutScreen2 extends StatefulWidget {
  String? addressid = null;
  String? storeid = null;

  CheckOutScreen2(this.addressid, this.storeid);

  @override
  State<CheckOutScreen2> createState() => CheckOutScreen2State();
}

class CheckOutScreen2State extends State<CheckOutScreen2> {
  late String value = "";
  late String PaymentOptions = "";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductDetailsViewModel>.reactive(
        viewModelBuilder: () => ProductDetailsViewModel(),
        onModelReady: (model) => {
              model.fetchstorecartlist(widget.storeid.toString()),
              model.storeid = widget.storeid.toString(),
            },
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xffF6F6F6),
                elevation: 3,
                titleSpacing: 0,
                title: Text("Store Cart",
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
              body: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[colum1(model), colum2(model)],
                  ),
                ),
              ),
            ));
  }

  Widget colum1(ProductDetailsViewModel model) {
    return Container(
        child: ListView.builder(
            itemCount: model.storecartslist.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 0),
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
                  margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height / 8.5,
                        width: MediaQuery.of(context).size.width / 4,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
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
                                    "https://aswagbuckets3.s3.me-south-1.amazonaws.com/${model.storecartslist[index].image}"),
                                fit: BoxFit.fill)),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
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
                                        model.storecartslist[index].title,
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
                                  margin: EdgeInsets.only(top: 20),
                                  child: Text(
                                    "Price",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                60,
                                        color: Color(0xff707070)),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        model.storecartslist[index].price,
                                        style: TextStyle(
                                            color: Color(0xff707070),
                                            fontWeight: FontWeight.w700,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                50),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white,
                                        boxShadow: [
                                          //background color of box
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
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
                                            GestureDetector(
                                              onTap: () {
                                                model.updatecart(
                                                    model.storecartslist[index]
                                                        .cartid
                                                        .toString(),
                                                    model.cartlist[index]
                                                            .quantity -
                                                        1,
                                                    context,
                                                    "1");
                                              },
                                              child: SvgPicture.asset(
                                                  "assets/images/minusiconss.svg"),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 7, right: 7),
                                              child: Text(
                                                model.storecartslist[index]
                                                    .quantity
                                                    .toString(),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                model.updatecart(
                                                    model.storecartslist[index]
                                                        .cartid
                                                        .toString(),
                                                    model.cartlist[index]
                                                            .quantity +
                                                        1,
                                                    context,
                                                    "1");
                                              },
                                              child: SvgPicture.asset(
                                                  "assets/images/plushliness.svg"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }));
  }

  Widget colum2(ProductDetailsViewModel model) {
    return Container(
      margin: EdgeInsets.only(left: 15, top: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              "Delivery Option",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height / 45,
                  fontWeight: FontWeight.w600),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SelectAddressScreen(widget.storeid)));
            },
            child: Container(
              margin: EdgeInsets.only(top: 15),
              child: Row(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 16,
                    width: MediaQuery.of(context).size.height / 16,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 1, color: Colors.grey.withOpacity(0.5))),
                    child: Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 40,
                        width: MediaQuery.of(context).size.width / 25,
                        child: SvgPicture.asset(
                          "assets/images/locationicons.svg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Shuwaikh Industry",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 55,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text(
                            "Hawally, Al-shuwaikh City",
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height / 55,
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    child:
                        SvgPicture.asset("assets/images/iconsarrorowright.svg"),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              "Payment Method",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height / 45,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            value = "1";
                            PaymentOptions = "KNET";
                          });
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height / 35,
                          width: MediaQuery.of(context).size.height / 35,
                          decoration: BoxDecoration(
                              color: (value == "1")
                                  ? Color(0xff2696CC)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.height / 10),
                              border:
                                  Border.all(width: 0.5, color: Colors.black)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text(
                          "KNET",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height / 45,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            value = "2";
                            PaymentOptions = "Cart Payment";
                          });
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height / 35,
                          width: MediaQuery.of(context).size.height / 35,
                          decoration: BoxDecoration(
                              color: (value == "2")
                                  ? Color(0xff2696CC)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.height / 10),
                              border:
                                  Border.all(width: 0.5, color: Colors.black)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text(
                          "Cart Payment",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height / 45,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 35),
            child: Text(
              "Order Info.",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height / 45,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Sub-Total",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height / 50,
                              color: Color(0xff969696)),
                        ),
                      ),
                      Container(
                        child: Text(
                          "120 KD",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height / 45,
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
                              fontSize: MediaQuery.of(context).size.height / 50,
                              color: Color(0xff969696)),
                        ),
                      ),
                      Container(
                        child: Text(
                          "+5 KD",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height / 45,
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
                          "Total",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height / 50,
                              color: Color(0xff969696)),
                        ),
                      ),
                      Container(
                        child: Text(
                          "125 KD",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height / 35,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              model.checkoutcart("0", "290", "290", PaymentOptions,
                  widget.addressid.toString(), model.storecartslist, context);

              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => AddAddressCartScreen()));

              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => SelectAddressScreen()));
            },
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 20),
              height: MediaQuery.of(context).size.height / 18,
              decoration: BoxDecoration(
                  color: Color(0xff2696CC),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Text(
                  "Checkout",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
