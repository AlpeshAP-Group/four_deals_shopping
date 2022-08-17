import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_deals_shopping/Controller/HomeHragmentViewModel.dart';
import 'package:four_deals_shopping/Screens/ChatMessageActivity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class ChatFragment extends StatefulWidget {
  String? userid = null;
  String? name = null;
  String? image = null;
  ChatFragment(this.userid, this.name, this.image);
  @override
  State<ChatFragment> createState() => ChatFragmentState();
}

class ChatFragmentState extends State<ChatFragment> {
  final seacrh = TextEditingController();
  late String searchs;
  late String msgtype = "Unread";
  final _firebaseRef2 = FirebaseDatabase().reference().child("ChatList");
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeFragmentViewModel>.reactive(
        viewModelBuilder: () => HomeFragmentViewModel(),
        onModelReady: (model) => {print("MYUSERID${widget.userid}")},
        builder: (context, model, child) => Scaffold(
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 8.5,
                      color: Color(0xffF6F6F6),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 10, left: 15, right: 20),
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
                                          setState(() {
                                            // model.seacrhlist =
                                            //     model.seacrhlist.where((note) {
                                            //   var name =
                                            //       note.title.toLowerCase();
                                            //   return name.contains(
                                            //       value.toLowerCase());
                                            // }).toList();
                                          });
                                        },
                                        controller: seacrh,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        cursorColor: Colors.greenAccent,
                                        decoration: InputDecoration(
                                            hintText: "Search in your chat",
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
                      height: MediaQuery.of(context).size.height / 17,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5, color: Colors.black)),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    msgtype = "Unread";
                                  });
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 17,
                                  color: Colors.white,
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                          child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Unread",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )),
                                      (msgtype == "Unread")
                                          ? Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 1,
                                                color: Color(0xff2696CC),
                                              ),
                                            )
                                          : Container()
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 0.5,
                              color: Colors.grey.withOpacity(0.5),
                              height: MediaQuery.of(context).size.height / 17,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    msgtype = "Read";
                                  });
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 17,
                                  color: Colors.white,
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                          child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Read",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )),
                                      (msgtype == "Read")
                                          ? Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 1,
                                                color: Color(0xff2696CC),
                                              ),
                                            )
                                          : Container()
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/chatbackgrounds.png"))),
                        child: (msgtype == "Unread")
                            ? Container(
                                child: FirebaseAnimatedList(
                                    query: _firebaseRef2
                                        .child(widget.userid.toString()),
                                    controller: _scrollController,
                                    reverse: false,
                                    itemBuilder: (_, DataSnapshot snapshot,
                                        Animation<double> animation, int x) {
                                      return (snapshot.value["Status"] ==
                                              "Read")
                                          ? Container()
                                          : GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ChatMessageActivity(
                                                                snapshot.value[
                                                                    "Receiver_id"],
                                                                snapshot.value[
                                                                    "Receiver_name"],
                                                                "ChatList")));
                                              },
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    left: 15,
                                                    top: 15,
                                                    right: 15),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  boxShadow: [
                                                    //background color of box
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
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
                                                      top: 10,
                                                      left: 10,
                                                      bottom: 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            18,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            18,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    "assets/images/carimages.png"),
                                                                fit: BoxFit
                                                                    .fill)),
                                                      ),
                                                      Expanded(
                                                          child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 15),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Container(
                                                              child: Text(
                                                                snapshot.value[
                                                                    "Receiver_name"],
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize: MediaQuery.of(context)
                                                                            .size
                                                                            .height /
                                                                        50),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(top: 5),
                                                              child: (snapshot.value[
                                                                          "MessageType"] ==
                                                                      "Image")
                                                                  ? Text(
                                                                      "Image FIle",
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xff848484),
                                                                          fontSize:
                                                                              MediaQuery.of(context).size.height / 60),
                                                                    )
                                                                  : Text(
                                                                      snapshot.value[
                                                                          "message"],
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xff848484),
                                                                          fontSize:
                                                                              MediaQuery.of(context).size.height / 60),
                                                                    ),
                                                            )
                                                          ],
                                                        ),
                                                      )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                    }))
                            : Container(
                                child: FirebaseAnimatedList(
                                    query: _firebaseRef2
                                        .child(widget.userid.toString()),
                                    controller: _scrollController,
                                    reverse: false,
                                    itemBuilder: (_, DataSnapshot snapshot,
                                        Animation<double> animation, int x) {
                                      return (snapshot.value["Status"] ==
                                              "UnRead")
                                          ? Container()
                                          : GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ChatMessageActivity(
                                                              snapshot.value[
                                                                  "Receiver_id"],
                                                              snapshot.value[
                                                                  "Receiver_name"],
                                                              "ChatList",
                                                            )));
                                              },
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    left: 15,
                                                    top: 15,
                                                    right: 15),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  boxShadow: [
                                                    //background color of box
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
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
                                                      top: 10,
                                                      left: 10,
                                                      bottom: 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            18,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            18,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    "assets/images/carimages.png"),
                                                                fit: BoxFit
                                                                    .fill)),
                                                      ),
                                                      Expanded(
                                                          child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 15),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Container(
                                                              child: Text(
                                                                snapshot.value[
                                                                    "Receiver_name"],
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize: MediaQuery.of(context)
                                                                            .size
                                                                            .height /
                                                                        50),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(top: 5),
                                                              child: (snapshot.value[
                                                                          "MessageType"] ==
                                                                      "Image")
                                                                  ? Text(
                                                                      "Image FIle",
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xff848484),
                                                                          fontSize:
                                                                              MediaQuery.of(context).size.height / 60),
                                                                    )
                                                                  : Container(
                                                                      child: (snapshot.value["MessageType"] ==
                                                                              "Voice")
                                                                          ? Text(
                                                                              "Voice Recording",
                                                                              style: TextStyle(color: Color(0xff848484), fontSize: MediaQuery.of(context).size.height / 60),
                                                                            )
                                                                          : Text(
                                                                              snapshot.value["message"],
                                                                              style: TextStyle(color: Color(0xff848484), fontSize: MediaQuery.of(context).size.height / 60),
                                                                            ),
                                                                    ),
                                                            )
                                                          ],
                                                        ),
                                                      )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                    })),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
