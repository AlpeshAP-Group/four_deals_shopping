import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_deals_shopping/Controller/FollowingListVIewModel.dart';
import 'package:stacked/stacked.dart';

class MyFollowingListScreen extends StatefulWidget {
  @override
  State<MyFollowingListScreen> createState() => MyFollowingListScreenState();
}

class MyFollowingListScreenState extends State<MyFollowingListScreen> {
  final seacrh = TextEditingController();
  late String searchs;

  late String follow = "";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FollowingListViewModel>.reactive(
        viewModelBuilder: () => FollowingListViewModel(),
        onModelReady: (model) => {
              model.fetchfollowinglist("FOLLOWING"),
            },
        builder: (context, model, child) => Scaffold(
              backgroundColor: Color(0xffF6F6F6),
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
                title: Text(
                  "Following",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 45,
                      color: Colors.black),
                ),
              ),
              body: Container(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          margin: EdgeInsets.only(top: 10, left: 15, right: 20),
                          height: MediaQuery.of(context).size.height / 20,
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
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                  child: Container(
                                height: MediaQuery.of(context).size.height / 25,
                                margin: EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  onChanged: (value) {
                                    if (value == "") {
                                      setState(() {
                                        model.fetchfollowinglist("FOLLOWING");
                                      });
                                    } else {
                                      setState(() {
                                        model.followinglist =
                                            model.followinglist.where((note) {
                                          var name =
                                              note.firstname.toLowerCase();
                                          return name
                                              .contains(value.toLowerCase());
                                        }).toList();
                                      });
                                    }
                                  },
                                  controller: seacrh,
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: Colors.greenAccent,
                                  decoration: InputDecoration(
                                      hintText: "Search ",
                                      hintStyle: TextStyle(
                                          color: Colors.grey.withOpacity(0.5),
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              60),
                                      border: InputBorder.none),
                                ),
                              )),
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Icon(Icons.search),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.only(left: 15, top: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: Container(
                                    child: ListView.builder(
                                        itemCount: model.followinglist.length,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder:
                                            (BuildContext context, index) {
                                          return Container(
                                            margin: EdgeInsets.only(top: 15),
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
                                                      14,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      14,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      image: (model
                                                                  .followinglist[
                                                                      index]
                                                                  .profileImage ==
                                                              null)
                                                          ? DecorationImage(
                                                              image: AssetImage(
                                                                  "assets/images/blackprofileimage.png"),
                                                              fit: BoxFit.fill)
                                                          : DecorationImage(
                                                              image: NetworkImage(
                                                                  "https://aswagbuckets3.s3.me-south-1.amazonaws.com/${model.followinglist[index].profileImage}"),
                                                              fit:
                                                                  BoxFit.fill)),
                                                ),
                                                Expanded(
                                                    child: Container(
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    model.followinglist[index]
                                                        .firstname,
                                                    style: TextStyle(
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            53,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                )),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      if (follow == "") {
                                                        model.followuser(
                                                            model
                                                                .followinglist[
                                                                    index]
                                                                .userid
                                                                .toString(),
                                                            "UNFOLLOW",
                                                            context);
                                                      } else {
                                                        model.followuser(
                                                            model
                                                                .followinglist[
                                                                    index]
                                                                .userid
                                                                .toString(),
                                                            "FOLLOW",
                                                            context);
                                                      }
                                                    });
                                                  },
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            3.5,
                                                    margin: EdgeInsets.only(
                                                        right: 20),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2),
                                                        border: Border.all(
                                                            width: 1,
                                                            color:
                                                                Colors.black)),
                                                    child: Center(
                                                      child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 6,
                                                                  bottom: 6),
                                                          child: (follow ==
                                                                  index
                                                                      .toString())
                                                              ? Container(
                                                                  child: Text(
                                                                      "Follow"),
                                                                )
                                                              : Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: <
                                                                      Widget>[
                                                                    Container(
                                                                      child: Text(
                                                                          "Following"),
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets.only(
                                                                          left:
                                                                              5),
                                                                      child: SvgPicture
                                                                          .asset(
                                                                              "assets/images/doubletickgreenicon.svg"),
                                                                    )
                                                                  ],
                                                                )),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        })))
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ));
  }
}
