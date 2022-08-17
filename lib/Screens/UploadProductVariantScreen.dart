import 'package:flutter/material.dart';
import 'package:four_deals_shopping/Controller/PostNormalAdsViewModel.dart';
import 'package:stacked/stacked.dart';

class UploadProductVariant extends StatefulWidget {
  @override
  State<UploadProductVariant> createState() => UploadProductVariantState();
}

class UploadProductVariantState extends State<UploadProductVariant> {
  List<String> searchlist = [];

  late String variant = "";
  @override
  void initState() {
    searchlist = ["Mobile", "Camera", "TV", "Car"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostNormalAdsViewModel>.reactive(
        viewModelBuilder: () => PostNormalAdsViewModel(),
        onModelReady: (model) => {
              model.getsubcategoryvariants(),
            },
        builder: (context, model, child) => Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Color(0xffF6F6F6),
              elevation: 0.5,
              titleSpacing: 0,
              title: Text("Mobiles Variants",
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
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 15,
                  right: MediaQuery.of(context).size.width / 15,
                  top: MediaQuery.of(context).size.height / 30,
                  bottom: MediaQuery.of(context).size.height / 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
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
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  itemCount: model.subcatvariants.length,
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                        left: 15,
                        top: 20,
                        right: 10,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              model.subcatvariants[index].name,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 50),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (variant == "") {
                                  variant = index.toString();
                                } else {
                                  variant = "";
                                }
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 8),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 20,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
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
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            child: Text("Select"),
                                          ),
                                          Container()
                                        ],
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                      visible: (variant == index.toString())
                                          ? true
                                          : false,
                                      child: Container(
                                        margin: EdgeInsets.only(top: 5),
                                        height:
                                            MediaQuery.of(context).size.height /
                                                6,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                          boxShadow: [
                                            //background color of box
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
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
                                                left: 15, right: 15, top: 10),
                                            child: ListView.builder(
                                                itemCount: model
                                                    .subcatvariants[index]
                                                    .variants
                                                    .length,
                                                padding: EdgeInsets.zero,
                                                scrollDirection: Axis.vertical,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        indexs) {
                                                  return GestureDetector(
                                                      onTap: () {
                                                        
                                                      },
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            top: 8),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Container(
                                                              child: Text(model
                                                                  .subcatvariants[
                                                                      index]
                                                                  .variants[
                                                                      indexs]
                                                                  .name),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(top: 8),
                                                              height: 1,
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.5),
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                            )
                                                          ],
                                                        ),
                                                      ));
                                                })),
                                      ))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            )));
  }
}
