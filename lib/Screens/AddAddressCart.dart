import 'package:flutter/material.dart';
import 'package:four_deals_shopping/Controller/addaddresscartviewmodel.dart';
import 'package:four_deals_shopping/Screens/SelectAddressScreen.dart';
import 'package:stacked/stacked.dart';

class AddAddressCartScreen extends StatefulWidget {
  @override
  State<AddAddressCartScreen> createState() => AddAddressCartScreenState();
}

class AddAddressCartScreenState extends State<AddAddressCartScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController flatno = TextEditingController();
  TextEditingController areastrret = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddressCartViewModel>.reactive(
        viewModelBuilder: () => AddressCartViewModel(),
        onModelReady: (model) => {},
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xffF6F6F6),
                elevation: 3,
                titleSpacing: 0,
                title: Text("Add Address",
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 13, top: 15),
                      child: Text(
                        "Enter Address Details",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 47,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                          left: 13,
                          top: 15,
                          right: 13,
                        ),
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Name',
                            hintText: 'Enter Your Name',
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.only(
                          left: 13,
                          top: 15,
                          right: 13,
                        ),
                        child: TextField(
                          controller: mobile,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Mobile Number',
                            hintText: 'Enter Mobile Number',
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.only(
                          left: 13,
                          top: 15,
                          right: 13,
                        ),
                        child: TextField(
                          controller: pincode,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'PIN Code',
                            hintText: 'Enter PIN Code',
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.only(
                          left: 13,
                          top: 15,
                          right: 13,
                        ),
                        child: TextField(
                          controller: flatno,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            border: OutlineInputBorder(),
                            labelText: 'Flat No.',
                            hintText: 'Enter Flat No.',
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.only(
                          left: 13,
                          top: 15,
                          right: 13,
                        ),
                        child: TextField(
                          controller: areastrret,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.teal)),
                            labelText: 'Area/Street',
                            hintText: 'Enter Area/Street',
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.only(
                          left: 13,
                          top: 15,
                          right: 13,
                        ),
                        child: TextField(
                          controller: city,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'City',
                            hintText: 'Enter City',
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.only(
                          left: 13,
                          top: 15,
                          right: 13,
                        ),
                        child: TextField(
                          controller: state,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'State',
                            hintText: 'Enter State',
                          ),
                        )),
                    GestureDetector(
                      onTap: () {
                        model.addaddress(
                            nameController.text,
                            mobile.text,
                            "1",
                            "2",
                            areastrret.text,
                            flatno.text,
                            "12.2000",
                            "75.0220",
                            "2",
                            "1",
                            "sss",
                            "",
                            context);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => SelectAddressScreen()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 30, right: 30, top: 30, bottom: 20),
                        height: MediaQuery.of(context).size.height / 18,
                        decoration: BoxDecoration(
                            color: Color(0xff2696CC),
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            "Add your address",
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
            ));
  }
}
