import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_deals_shopping/Controller/CategoryDetailsViewModel.dart';
import 'package:four_deals_shopping/Models/SubCategoryVarientList.dart';
import 'package:four_deals_shopping/Screens/BrandDetailsPageScreen.dart';
import 'package:four_deals_shopping/Screens/BrandProductDetailsActivity.dart';
import 'package:stacked/stacked.dart';

class CategoryDetailsPageScreen extends StatefulWidget {
  late String? catid = null;
  late String? catname = null;

  CategoryDetailsPageScreen(this.catid, this.catname);
  @override
  State<CategoryDetailsPageScreen> createState() =>
      CategoryDetailsPageScreenState();
}

class CategoryDetailsPageScreenState extends State<CategoryDetailsPageScreen> {
  int indexs = 0;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategoryDetailsViewModel>.reactive(
        viewModelBuilder: () => CategoryDetailsViewModel(),
        onModelReady: (model) => {
              model.fetchsubcategory(widget.catid.toString()),
            },
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
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
                title: Text(
                  widget.catname.toString(),
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 45,
                      color: Colors.black),
                ),
              ),
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width / 4,
                        child: ListView.builder(
                          itemCount: model.subcategorylist.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  print(model.subcategorylist[index].subcat
                                      .toString());
                                  indexs = index;
                                  model.brandname = model
                                      .subcategorylist[index].catname
                                      .toString();
                                  model.fetchsubcategoryvarientslist(model
                                      .subcategorylist[index].subcat
                                      .toString());
                                });
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height / 8,
                                margin: EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                    color: (indexs == index)
                                        ? Colors.white
                                        : Color(0xffF0F0F0)),
                                child: Row(
                                  children: <Widget>[
                                    (indexs == index)
                                        ? Container(
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                30,
                                            decoration: BoxDecoration(
                                                color: Color(0xff2696CC),
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10))),
                                          )
                                        : Container(),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            height: 50,
                                            width: 50,
                                            child: (indexs == index)
                                                ? Image.network(
                                                    "https://aswagbuckets3.s3.me-south-1.amazonaws.com/${model.subcategorylist[index].caticon}")
                                                : Image.network(
                                                    "https://aswagbuckets3.s3.me-south-1.amazonaws.com/${model.subcategorylist[index].caticon}"),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 5),
                                            child: Text(
                                              model.subcategorylist[index]
                                                  .catname,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          70,
                                                  color: (indexs == index)
                                                      ? Color(0xff2696CC)
                                                      : Colors.black),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        )),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "Select Brand",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                60),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  child: Text(
                                    model.brandname,
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                60),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: varientlist(model.subvarientlists),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
  }

  Widget varientlist(List<SubCategoryVarientListModel> list) {
    return GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
        childAspectRatio: 2 / 1.8,
        controller: new ScrollController(keepScrollOffset: false),
        scrollDirection: Axis.vertical,
        children: list.map((e) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BrandProductDetailsScreen(
                          e.categoryId.toString(),
                          widget.catid.toString(),
                          e.varname.toString())));
            },
            child: Container(
              margin: EdgeInsets.only(left: 15, right: 13, top: 10),
              child: Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 10,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        //background color of box
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1.0, // soften the shadow
                          spreadRadius: 1.0, //extend the shadow
                          offset: Offset(
                            0.0, // Move to right 10  horizontally
                            0.0, // Move to bottom 10 Vertically
                          ),
                        )
                      ],
                    ),
                    child: Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 16,
                        width: MediaQuery.of(context).size.height / 16,
                        child: Image.network(
                            "https://aswagbuckets3.s3.me-south-1.amazonaws.com/${e.image}"),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text(
                      e.varname,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 65),
                    ),
                  )
                ],
              ),
            ),
          );
        }).toList());
  }
}
