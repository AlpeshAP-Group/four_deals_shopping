import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:four_deals_shopping/Controller/CreateStoreViewModel.dart';
import 'package:four_deals_shopping/Screens/CreateStoreUI/MyStoreScreen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

class CreateYourStoreScreen4 extends StatefulWidget {
  String? storename = null;
  List<String>? category = null;

  CreateYourStoreScreen4(this.storename, this.category);
  @override
  State<CreateYourStoreScreen4> createState() => CreateYourStoreScreen4State();
}

class CreateYourStoreScreen4State extends State<CreateYourStoreScreen4> {
  final description = TextEditingController();
  late String descriptions;

  late String? imagepath = "";
  XFile? imageFile = null;
  late String? imagepath2 = "";
  XFile? imageFile2 = null;

  @override
  void initState() {
    print(widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateStoreViewModel>.reactive(
        viewModelBuilder: () => CreateStoreViewModel(),
        onModelReady: (model) => {},
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
              ),
              body: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: Text(
                        "Add Images to This Store",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 35,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      height: MediaQuery.of(context).size.height / 3.5,
                      child: Stack(
                        children: <Widget>[
                          GestureDetector(
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
                                        margin: EdgeInsets.only(bottom: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            GestureDetector(
                                              onTap: () {
                                                _openCamera2(context);
                                                Navigator.of(ctx).pop();
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: 100,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topCenter,
                                                        end: Alignment
                                                            .bottomCenter,
                                                        colors: [
                                                          Color(0xff960E7A),
                                                          Color(0xffFD3E40)
                                                        ])),
                                                child: Text(
                                                  "Camera",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                _openGallary2(context);
                                                Navigator.of(ctx).pop();
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                width: 100,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topCenter,
                                                        end: Alignment
                                                            .bottomCenter,
                                                        colors: [
                                                          Color(0xff960E7A),
                                                          Color(0xffFD3E40)
                                                        ])),
                                                child: Text(
                                                  "Gallery",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
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
                              height: MediaQuery.of(context).size.height / 4.5,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    //background color of box
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      blurRadius: 1.0, // soften the shadow
                                      spreadRadius: 1.0, //extend the shadow
                                      offset: Offset(
                                        0.0, // Move to right 10  horizontally
                                        2.0, // Move to bottom 10 Vertically
                                      ),
                                    )
                                  ],
                                  image: (imagepath2 == "")
                                      ? DecorationImage(
                                          image: AssetImage(
                                              "assets/images/coverimagebackground.png"),
                                          fit: BoxFit.fill)
                                      : DecorationImage(
                                          image:
                                              FileImage(File(imageFile2!.path)),
                                          fit: BoxFit.fill)),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
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
                                          margin: EdgeInsets.only(bottom: 15),
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
                                                  alignment: Alignment.center,
                                                  width: 100,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      gradient: LinearGradient(
                                                          begin: Alignment
                                                              .topCenter,
                                                          end: Alignment
                                                              .bottomCenter,
                                                          colors: [
                                                            Color(0xff960E7A),
                                                            Color(0xffFD3E40)
                                                          ])),
                                                  child: Text(
                                                    "Camera",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  _openGallary(context);
                                                  Navigator.of(ctx).pop();
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  width: 100,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      gradient: LinearGradient(
                                                          begin: Alignment
                                                              .topCenter,
                                                          end: Alignment
                                                              .bottomCenter,
                                                          colors: [
                                                            Color(0xff960E7A),
                                                            Color(0xffFD3E40)
                                                          ])),
                                                  child: Text(
                                                    "Gallery",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
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
                                height: MediaQuery.of(context).size.height / 8,
                                width: MediaQuery.of(context).size.height / 8,
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
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                      height: MediaQuery.of(context).size.height / 6.5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.height / 98),
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
                      ),
                      child: Container(
                        margin: EdgeInsets.only(left: 15),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          onChanged: (value) => descriptions = value,
                          controller: description,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.greenAccent,
                          decoration: InputDecoration(
                              hintText: "Description",
                              hintStyle: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 50,
                                  color: Colors.grey.withOpacity(0.8)),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => MyStoreSCreen()));
                              model.createstore(
                                  widget.category!.toString(),
                                  widget.storename.toString(),
                                  description.text,
                                  "23.20",
                                  "27.10",
                                  "Ahmedabad",
                                  "Ahmedabad",
                                  imageFile!,
                                  imageFile2!,
                                  context);
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height / 17,
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  EdgeInsets.only(left: 15, right: 15, top: 8),
                              decoration: BoxDecoration(
                                color: Color(0xff2696CC),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  "NEXT",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              45,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 15, right: 15, top: 15, bottom: 10),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                    child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  height:
                                      MediaQuery.of(context).size.height / 90,
                                  decoration: BoxDecoration(
                                    color: Color(0xff2696CC),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                )),
                                Expanded(
                                    child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  height:
                                      MediaQuery.of(context).size.height / 90,
                                  decoration: BoxDecoration(
                                    color: Color(0xff2696CC),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                )),
                                Expanded(
                                    child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 90,
                                  decoration: BoxDecoration(
                                    color: Color(0xff2696CC),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ));
  }

  void _openCamera(BuildContext context) async {
    // ignore: deprecated_member_use
    var pickedFile = await ImagePicker().pickImage(
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
    var pickedFile = await ImagePicker().pickImage(
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

  void _openCamera2(BuildContext context) async {
    // ignore: deprecated_member_use
    var pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );

    setState(() {
      imagepath2 = pickedFile!.path.toString();
      imageFile2 = pickedFile;
      final bytes = File(pickedFile.path).readAsBytesSync();

      // String base64Image = "data:image/png;base64," + base64Encode(bytes);
      File file = File(pickedFile.path);

      Uint8List bytess = file.readAsBytesSync();
      String base64Image = base64Encode(bytes);
    });
    //   Navigator.pop(context);
  }

  void _openGallary2(BuildContext context) async {
    // ignore: deprecated_member_use
    var pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    setState(() {
      imagepath2 = pickedFile!.path.toString();
      imageFile2 = pickedFile;
      final bytes = File(pickedFile.path).readAsBytesSync();

      // String base64Image = "data:image/png;base64," + base64Encode(bytes);
      File file = File(pickedFile.path);

      Uint8List bytess = file.readAsBytesSync();
      String base64Image = base64Encode(bytes);
    });
    //   Navigator.pop(context);
  }
}
