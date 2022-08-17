import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_deals_shopping/Controller/EditProfileViewModel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

class SettingScreen extends StatefulWidget {
  @override
  State<SettingScreen> createState() => SettingScreenState();
}

class SettingScreenState extends State<SettingScreen> {
  late String? imagepath = "";
  PickedFile? imageFile = null;

  final email = TextEditingController();
  late String emails = "";

  final lastname = TextEditingController();
  late String lastnames = "";

  final mobile = TextEditingController();
  late String mobiles = "";

  final name = TextEditingController();
  late String names = "";

  late String gender = "";

  late String _selectedDateInString = "";

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EdirProfileViewModel>.reactive(
        viewModelBuilder: () => EdirProfileViewModel(),
        onModelReady: (model) => {model.fetchmyprofile()},
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xffF6F6F6),
                elevation: 0,
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
                  "Setting",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 45,
                      color: Colors.black),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: MediaQuery.of(context).size.height / 7,
                          width: MediaQuery.of(context).size.height / 7,
                          margin: EdgeInsets.only(top: 15),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.height / 7,
                                width: MediaQuery.of(context).size.height / 7,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    image: (imagepath == "")
                                        ? DecorationImage(
                                            image: AssetImage(
                                                "assets/images/groupimages.png"))
                                        : DecorationImage(
                                            image: FileImage(
                                                File(imageFile!.path)),
                                            fit: BoxFit.fill),
                                    boxShadow: [
                                      //background color of box
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        blurRadius: 1.0, // soften the shadow
                                        spreadRadius: 1.0, //extend the shadow
                                        offset: Offset(
                                          0.0, // Move to right 10  horizontally
                                          0.0, // Move to bottom 10 Vertically
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(
                                        MediaQuery.of(context).size.height /
                                            10)),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0))),
                                        title: Text(
                                          "Choose Options",
                                          textAlign: TextAlign.center,
                                        ),
                                        actions: <Widget>[
                                          Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  GestureDetector(
                                                    onTap: () {
                                                      _openCamera(context);
                                                      Navigator.of(ctx).pop();
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 100,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          gradient: LinearGradient(
                                                              begin: Alignment
                                                                  .topCenter,
                                                              end: Alignment
                                                                  .bottomCenter,
                                                              colors: [
                                                                Color(
                                                                    0xff960E7A),
                                                                Color(
                                                                    0xffFD3E40)
                                                              ])),
                                                      child: Text(
                                                        "Camera",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      _openGallary(context);
                                                      Navigator.of(ctx).pop();
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      width: 100,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          gradient: LinearGradient(
                                                              begin: Alignment
                                                                  .topCenter,
                                                              end: Alignment
                                                                  .bottomCenter,
                                                              colors: [
                                                                Color(
                                                                    0xff960E7A),
                                                                Color(
                                                                    0xffFD3E40)
                                                              ])),
                                                      child: Text(
                                                        "Gallery",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ))
                                        ],
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 30,
                                    width:
                                        MediaQuery.of(context).size.height / 30,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(
                                            MediaQuery.of(context).size.height /
                                                10)),
                                    child: Center(
                                      child: Icon(
                                        Icons.edit,
                                        size:
                                            MediaQuery.of(context).size.height /
                                                55,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 15, right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "First Name",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            52),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              height: MediaQuery.of(context).size.height / 16,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 1.0, color: Colors.grey)),
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  onChanged: (value) {
                                    setState(() {
                                      emails = value;
                                    });
                                  },
                                  controller: model.names,
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: Colors.greenAccent,
                                  decoration: InputDecoration(
                                      hintText: "Enter First Name",
                                      suffixIcon: Icon(
                                        Icons.done,
                                        color: emails == ""
                                            ? Colors.white
                                            : Color(0xff2696CC),
                                      ),
                                      hintStyle: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              60),
                                      border: InputBorder.none),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Last Name",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            52),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              height: MediaQuery.of(context).size.height / 16,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 1.0, color: Colors.grey)),
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  onChanged: (value) {
                                    setState(() {
                                      lastnames = value;
                                    });
                                  },
                                  controller: model.lastname,
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: Colors.greenAccent,
                                  decoration: InputDecoration(
                                      hintText: "Enter Last Name",
                                      suffixIcon: Icon(
                                        Icons.done,
                                        color: lastnames == ""
                                            ? Colors.white
                                            : Color(0xff2696CC),
                                      ),
                                      hintStyle: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              60),
                                      border: InputBorder.none),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Gender",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            52),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            gender = "Male";
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(right: 10),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              16,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  width: 1.0,
                                                  color: Colors.grey)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    37,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    37,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                10),
                                                    border: Border.all(
                                                        width: 0.5,
                                                        color: Colors.grey
                                                            .withOpacity(0.5))),
                                                child: (gender == "Male")
                                                    ? Center(
                                                        child: Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              52,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              52,
                                                          decoration: BoxDecoration(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.5),
                                                              borderRadius: BorderRadius.circular(
                                                                  MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height /
                                                                      10),
                                                              border: Border.all(
                                                                  width: 0.5,
                                                                  color: Colors
                                                                      .grey
                                                                      .withOpacity(
                                                                          0.5))),
                                                        ),
                                                      )
                                                    : Container(),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 15),
                                                child: Text(
                                                  "Male",
                                                  style: TextStyle(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              48),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            gender = "Female";
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(left: 10),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              16,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  width: 1.0,
                                                  color: Colors.grey)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    37,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    37,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                10),
                                                    border: Border.all(
                                                        width: 0.5,
                                                        color: Colors.grey
                                                            .withOpacity(0.5))),
                                                child: (gender == "Female")
                                                    ? Center(
                                                        child: Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              52,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              52,
                                                          decoration: BoxDecoration(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.5),
                                                              borderRadius: BorderRadius.circular(
                                                                  MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height /
                                                                      10),
                                                              border: Border.all(
                                                                  width: 0.5,
                                                                  color: Colors
                                                                      .grey
                                                                      .withOpacity(
                                                                          0.5))),
                                                        ),
                                                      )
                                                    : Container(),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 15),
                                                child: Text(
                                                  "Female",
                                                  style: TextStyle(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              48),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Date Of Birth",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            52),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                DateTime birthDate = await selectDate(
                                  context,
                                  DateTime.now(),
                                  model,
                                  lastDate: DateTime.now(),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 5),
                                height: MediaQuery.of(context).size.height / 16,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 1.0, color: Colors.grey)),
                                child: Container(
                                  margin: EdgeInsets.only(left: 15, right: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          model.dob,
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  50),
                                        ),
                                      ),
                                      Container(
                                        child: SvgPicture.asset(
                                            "assets/images/arrorowdownicon.svg"),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Mobile",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            52),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 16,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            width: 1.0, color: Colors.grey)),
                                    child: CountryCodePicker(
                                      onChanged: print,
                                      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                      initialSelection: 'IT',
                                      favorite: ['+39', 'FR'],

                                      showCountryOnly: false,

                                      showOnlyCountryWhenClosed: false,

                                      alignLeft: false,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(left: 5),
                                      height:
                                          MediaQuery.of(context).size.height /
                                              16,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              width: 1.0, color: Colors.grey)),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: TextFormField(
                                          textInputAction: TextInputAction.next,
                                          onChanged: (value) {
                                            setState(() {
                                              mobiles = value;
                                            });
                                          },
                                          controller: model.mobile,
                                          keyboardType: TextInputType.number,
                                          cursorColor: Colors.greenAccent,
                                          decoration: InputDecoration(
                                              hintText: "Enter Mobile",
                                              suffixIcon: Icon(
                                                Icons.done,
                                                color: mobiles == ""
                                                    ? Colors.white
                                                    : Color(0xff2696CC),
                                              ),
                                              hintStyle: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          60),
                                              border: InputBorder.none),
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
                      Container(
                        margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Email",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            52),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              height: MediaQuery.of(context).size.height / 16,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 1.0, color: Colors.grey)),
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  onChanged: (value) {
                                    setState(() {
                                      names = value;
                                    });
                                  },
                                  controller: model.email,
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: Colors.greenAccent,
                                  decoration: InputDecoration(
                                      hintText: "Enter Email",
                                      suffixIcon: Icon(
                                        Icons.done,
                                        color: names == ""
                                            ? Colors.white
                                            : Color(0xff2696CC),
                                      ),
                                      hintStyle: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              60),
                                      border: InputBorder.none),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          model.updateprofile(
                              model.names.text,
                              mobile.text,
                              email.text,
                              gender,
                              "23-04-2000",
                              lastname.text,
                              "jm",
                              "IN",
                              context);
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
                              "SAVE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }

  void _openCamera(BuildContext context) async {
    // ignore: deprecated_member_use
    var pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );

    setState(() {
      imagepath = pickedFile!.path.toString();
      imageFile = pickedFile;
      final bytes = File(pickedFile.path).readAsBytesSync();

      // String base64Image = "data:image/png;base64," + base64Encode(bytes);
      File file = File(pickedFile.path);

      Uint8List bytess = file.readAsBytesSync();
      String base64Image = base64Encode(bytes);
    });
    //   Navigator.pop(context);
  }

  void _openGallary(BuildContext context) async {
    // ignore: deprecated_member_use
    var pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );

    setState(() {
      imagepath = pickedFile!.path.toString();
      imageFile = pickedFile;
      final bytes = File(pickedFile.path).readAsBytesSync();

      // String base64Image = "data:image/png;base64," + base64Encode(bytes);
      File file = File(pickedFile.path);

      Uint8List bytess = file.readAsBytesSync();
      String base64Image = base64Encode(bytes);
    });
    //   Navigator.pop(context);
  }

  selectDate(BuildContext context, DateTime initialDateTime,
      EdirProfileViewModel model,
      {required DateTime lastDate}) async {
    Completer completer = Completer();

    showDatePicker(
            context: context,
            initialDate: initialDateTime,
            firstDate: DateTime(1970),
            lastDate: lastDate == null
                ? DateTime(initialDateTime.year + 10)
                : lastDate)
        .then((temp) {
      if (temp == null) return null;
//
      completer.complete(temp);
      setState(() {
        model.dob = "${temp.day}/${temp.month}/${temp.year}";
      });
    });

    return completer.future;
  }
}
