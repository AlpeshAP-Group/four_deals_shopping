import 'package:flutter/material.dart';
import 'package:four_deals_shopping/Controller/PostNormalAdsViewModel.dart';
import 'package:four_deals_shopping/Screens/UploadProductScreen3.dart';
import 'package:stacked/stacked.dart';

class UploadProductScreen2 extends StatefulWidget {
  @override
  State<UploadProductScreen2> createState() => UploadProductScreen2State();
}

class UploadProductScreen2State extends State<UploadProductScreen2> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostNormalAdsViewModel>.reactive(
        viewModelBuilder: () => PostNormalAdsViewModel(),
        onModelReady: (model) => {
              model.getcategpry(),
            },
        builder: (context, model, child) => Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Color(0xffF6F6F6),
                elevation: 0.5,
                titleSpacing: 0,
                title: Text("Category List",
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
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 15,
                    right: MediaQuery.of(context).size.width / 15,
                    top: MediaQuery.of(context).size.height / 30,
                    bottom: MediaQuery.of(context).size.height / 30),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 16,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Color(0xff1D92CA),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "Select Category",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 50,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: model.categorylist.length,
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UploadProductScreen3(model
                                                  .categorylist[index].id
                                                  .toString())));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                    left: 10,
                                    top: 10,
                                    right: 10,
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                                child: Container(
                                              child: Text(
                                                model.categorylist[index].name,
                                                style: TextStyle(
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
                                          margin: EdgeInsets.only(top: 10),
                                          child: Container(
                                            height: 0.3,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            color: Colors.black,
                                          ))
                                    ],
                                  ),
                                ),
                              );
                            }))
                  ],
                ),
              ),
            ));
  }
}
