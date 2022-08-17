import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:four_deals_shopping/Controller/PostBannerViewModel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked.dart';

class PostBannerAds extends StatefulWidget {
  @override
  State<PostBannerAds> createState() => PostBannerAdsState();
}

class PostBannerAdsState extends State<PostBannerAds> {
  late String? imagepath = "";
  XFile? imageFile = null;
  final email = TextEditingController();
  late String emails = "";

  final description = TextEditingController();
  late String descriptions = "";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostBannerViewwModel>.reactive(
        viewModelBuilder: () => PostBannerViewwModel(),
        onModelReady: (model) => {},
        builder: (context, model, child) => Scaffold(
              backgroundColor: Colors.white,
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
                  "Post Banner Ads",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 45,
                      color: Colors.black),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: MediaQuery.of(context).size.height / 7,
                        width: MediaQuery.of(context).size.height / 7,
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 30),
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
                                          image:
                                              FileImage(File(imageFile!.path)),
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
                                      MediaQuery.of(context).size.height / 10)),
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
                                                            BorderRadius
                                                                .circular(10),
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
                                      size: MediaQuery.of(context).size.height /
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
                      height: MediaQuery.of(context).size.height / 16,
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 15,
                          left: MediaQuery.of(context).size.width / 16,
                          right: MediaQuery.of(context).size.width / 16),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(width: 1, color: Color(0xff2696CC))),
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              setState(() {
                                emails = value;
                              });
                            },
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.greenAccent,
                            decoration: InputDecoration(
                                hintText: "Enter Title",
                                suffixIcon: Icon(
                                  Icons.done,
                                  color: emails == ""
                                      ? Colors.white
                                      : Color(0xff2696CC),
                                ),
                                hintStyle: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            70),
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 8,
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 30,
                          left: MediaQuery.of(context).size.width / 16,
                          right: MediaQuery.of(context).size.width / 16),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(width: 1, color: Color(0xff2696CC))),
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              setState(() {
                                descriptions = value;
                              });
                            },
                            controller: description,
                            scrollPadding: EdgeInsets.zero,
                            maxLines: 3,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.greenAccent,
                            decoration: InputDecoration(
                                hintText: "Enter Description",
                                suffixIcon: Icon(
                                  Icons.done,
                                  color: emails == ""
                                      ? Colors.white
                                      : Color(0xff2696CC),
                                ),
                                hintStyle: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            70),
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        model.postbanner(email.text, description.text,
                            "STORE_PAGE", "1", imagepath.toString(), context);
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 15,
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 15,
                            left: MediaQuery.of(context).size.width / 10,
                            right: MediaQuery.of(context).size.width / 10),
                        decoration: BoxDecoration(
                          color: Color(0xff2696CC),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Add",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    )
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
}
