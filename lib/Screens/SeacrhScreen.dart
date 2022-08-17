import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_deals_shopping/Controller/SearchListViewModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  final _firebaseRefs = FirebaseDatabase().reference().child("Searched");
  final ScrollController _scrollController = ScrollController();
  final seacrh = TextEditingController();
  late String searchs = "";

  List<String> searchlist = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchListViewModel>.reactive(
        viewModelBuilder: () => SearchListViewModel(),
        onModelReady: (model) =>
            {model.fetchcurrentorder(), model.getprefdata()},
        builder: (context, model, child) => Scaffold(
              body: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 15),
                      color: Color(0xffF6F6F6),
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                child: SvgPicture.asset(
                                    "assets/images/backiconblack.svg"),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 15, right: 20),
                                height: MediaQuery.of(context).size.height / 18,
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
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: TextFormField(
                                        textInputAction: TextInputAction.next,
                                        onChanged: (value) {
                                          if (value.toString() != "") {
                                            setState(() {
                                              searchs = "Open";
                                            });
                                          } else {
                                            setState(() {
                                              searchs = "";
                                              model.fetchcurrentorder();
                                            });
                                          }
                                          setState(() {
                                            model.seacrhlist =
                                                model.seacrhlist.where((note) {
                                              var name =
                                                  note.title.toLowerCase();
                                              return name.contains(
                                                  value.toLowerCase());
                                            }).toList();
                                          });
                                        },
                                        controller: seacrh,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        cursorColor: Colors.greenAccent,
                                        decoration: InputDecoration(
                                            hintText: "Search Anything",
                                            hintStyle: TextStyle(
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
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                        child: (searchs == "Open")
                            ? Expanded(
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Container(),
                                      Expanded(
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white),
                                            margin: EdgeInsets.only(
                                                left: 34, right: 20, top: 5),
                                            child: ListView.builder(
                                                itemCount:
                                                    model.seacrhlist.length,
                                                padding: EdgeInsets.zero,
                                                scrollDirection: Axis.vertical,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        index) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        searchs = "Close";
                                                        seacrh.clear();
                                                        settorealtimedatabase(
                                                            model
                                                                .seacrhlist[
                                                                    index]
                                                                .title);
                                                      });
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10, right: 10),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white),
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            top: 10,
                                                            bottom: 10),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Expanded(
                                                              child: Text(model
                                                                  .seacrhlist[
                                                                      index]
                                                                  .title),
                                                            ),
                                                            Container(
                                                              child: SvgPicture
                                                                  .asset(
                                                                      "assets/images/curvedarrow.svg"),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                })),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(top: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        color: Colors.white,
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 20, top: 15),
                                          child: Text(
                                            "Your Recent Searches",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    50,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: (model.userid == "")
                                              ? Container()
                                              : Container(
                                                  child: FirebaseAnimatedList(
                                                      query: _firebaseRefs
                                                          .child(model.userid),
                                                      controller:
                                                          _scrollController,
                                                      reverse: false,
                                                      itemBuilder: (_,
                                                          DataSnapshot snapshot,
                                                          Animation<double>
                                                              animation,
                                                          int x) {
                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Colors
                                                                      .white),
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 10,
                                                                    bottom: 10,
                                                                    left: 20,
                                                                    right: 20),
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                Container(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height /
                                                                      50,
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height /
                                                                      50,
                                                                  child: SvgPicture
                                                                      .asset(
                                                                          "assets/images/timemachineicons.svg"),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                            left:
                                                                                10),
                                                                    child: Text(
                                                                        snapshot
                                                                            .value['title']),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      })))
                                    ],
                                  ),
                                ),
                              ))
                  ],
                ),
              ),
            ));
  }

  void settorealtimedatabase(String title) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final _firebaseRefs = FirebaseDatabase().reference().child("Searched");
    _firebaseRefs.child(prefs.getString("UserId").toString()).child(title).set({
      "title": title,
    });
  }
}
