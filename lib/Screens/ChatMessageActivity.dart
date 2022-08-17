import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:record/record.dart';
import 'package:seekbar/seekbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

class ChatMessageActivity extends StatefulWidget {
  String? storeid = null;
  String? storename = null;
  String? from = null;
  ChatMessageActivity(this.storeid, this.storename, this.from);
  @override
  State<ChatMessageActivity> createState() => ChatMessageActivityState();
}

class ChatMessageActivityState extends State<ChatMessageActivity> {
  final messgae = TextEditingController();
  late String messgaes = "";
  late String Token = "";

  final _firebaseRef = FirebaseDatabase().reference().child("Chat");
  final _firebaseRef2 = FirebaseDatabase().reference().child("ChatList");
  final ScrollController _scrollController = ScrollController();

  late String userid = "";

  PickedFile? image = null;

  String _isRecording = "Play";
  String voicerrrrr = "Play";

  AudioPlayer audioPlayer = AudioPlayer();
  Timer? _progressTimer;
  Timer? _secondProgressTimer;
  bool _done = false;
  Timer? _timerForInter;

  double _value = 0.0;
  double _secondValue = 0.0;

  final _audioRecorder = Record();

  @override
  void initState() {
    if (widget.from == "ChatList") {
      update();
    } else {}
    getpref();
    getusertoken();
    super.initState();
  }

  Future<void> getpref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userid = prefs.getString("UserId").toString();
    });
  }

  _resumeProgressTimer() {
    _progressTimer = Timer.periodic(const Duration(milliseconds: 10), (_) {
      setState(() {
        _value += 0.0050;
        if (_value >= 1) {
          _progressTimer!.cancel();
          _done = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          titleSpacing: -5,
          elevation: 1,
          flexibleSpace: Container(
            decoration: BoxDecoration(color: Color(0xffF6F6F6)),
          ),
          title: Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.height / 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: AssetImage("assets/images/carimages.png"),
                          fit: BoxFit.fill)),
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    widget.storename.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ))
              ],
            ),
          ),
          leading: Container(
            margin: EdgeInsets.only(top: 5),
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Expanded(
              child: (userid == "")
                  ? Container()
                  : FirebaseAnimatedList(
                      query: _firebaseRef
                          .child(userid)
                          .child(widget.storeid.toString()),
                      controller: _scrollController,
                      reverse: false,
                      itemBuilder: (_, DataSnapshot snapshot,
                          Animation<double> animation, int x) {
                        return new Container(
                          margin: EdgeInsets.only(top: 15, right: 10, left: 10),
                          child: (userid == snapshot.value["Sender_id"])
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      child: Flexible(
                                        child: Container(
                                          margin: EdgeInsets.only(left: 100),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(5),
                                                    topLeft: Radius.circular(5),
                                                    bottomLeft:
                                                        Radius.circular(5),
                                                    bottomRight:
                                                        Radius.circular(5))),
                                            child: Container(
                                                child: Container(
                                              margin: EdgeInsets.only(
                                                  right: 10,
                                                  bottom: 10,
                                                  left: 10,
                                                  top: 10),
                                              child: (snapshot.value[
                                                          "MessageType"] ==
                                                      "Voice")
                                                  ? Container(
                                                      child: Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            child: SeekBar(
                                                              value: _value,
                                                              secondValue:
                                                                  _secondValue,
                                                              barColor:
                                                                  Colors.grey,
                                                              progressColor:
                                                                  Colors.blue,
                                                              thumbColor:
                                                                  Colors.blue,
                                                              secondProgressColor:
                                                                  Colors.blue
                                                                      .withOpacity(
                                                                          0.5),
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () async {
                                                              print((snapshot
                                                                      .value
                                                                  as Map<
                                                                      dynamic,
                                                                      dynamic>)["a"]);
                                                              if (voicerrrrr ==
                                                                  "Play") {
                                                                setState(() {
                                                                  voicerrrrr =
                                                                      "Stop";
                                                                  _resumeProgressTimer();
                                                                  _secondProgressTimer =
                                                                      Timer.periodic(
                                                                          const Duration(
                                                                              milliseconds: 10),
                                                                          (_) {
                                                                    setState(
                                                                        () {
                                                                      _secondValue +=
                                                                          0.001;
                                                                      if (_secondValue >=
                                                                          1) {
                                                                        _secondProgressTimer!
                                                                            .cancel();
                                                                      }
                                                                    });
                                                                  });
                                                                });
                                                              } else {
                                                                setState(() {
                                                                  voicerrrrr =
                                                                      "Play";
                                                                  _progressTimer!
                                                                      .cancel();
                                                                  _secondProgressTimer!
                                                                      .cancel();

                                                                  audioPlayer
                                                                      .stop();
                                                                });
                                                              }

                                                              int result = await audioPlayer
                                                                  .play((snapshot
                                                                          .value
                                                                      as Map<
                                                                          dynamic,
                                                                          dynamic>)["a"]);
                                                              if (result == 1) {
                                                                // success
                                                              }
                                                              audioPlayer
                                                                  .onPlayerCompletion
                                                                  .listen(
                                                                      (event) {
                                                                setState(() {
                                                                  voicerrrrr =
                                                                      "Play";
                                                                  _progressTimer!
                                                                      .cancel();
                                                                  _secondProgressTimer!
                                                                      .cancel();
                                                                });
                                                              });

                                                              // player?.play();
                                                            },
                                                            child: (voicerrrrr ==
                                                                    "Play")
                                                                ? Icon(Icons
                                                                    .play_arrow)
                                                                : Icon(
                                                                    Icons.stop),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  : Container(
                                                      child: (snapshot.value[
                                                                  "MessageType"] ==
                                                              "Image")
                                                          ? Container(
                                                              height: 100,
                                                              width: 110,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                  image: DecorationImage(
                                                                      image: NetworkImage(
                                                                          snapshot.value[
                                                                              "message"]),
                                                                      fit: BoxFit
                                                                          .cover)),
                                                            )
                                                          : Text(
                                                              snapshot.value[
                                                                  "message"],
                                                              maxLines: 3,
                                                              overflow:
                                                                  TextOverflow
                                                                      .fade,
                                                              style: new TextStyle(
                                                                  fontSize:
                                                                      14.0,
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                    ),
                                            )),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      height:
                                          MediaQuery.of(context).size.height /
                                              30,
                                      width:
                                          MediaQuery.of(context).size.height /
                                              30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/carimages.png"),
                                              fit: BoxFit.fill)),
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      height:
                                          MediaQuery.of(context).size.height /
                                              30,
                                      width:
                                          MediaQuery.of(context).size.height /
                                              30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/carimages.png"),
                                              fit: BoxFit.fill)),
                                    ),
                                    Container(
                                      child: Flexible(
                                        child: Container(
                                          margin: EdgeInsets.only(right: 100),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(5),
                                                    topLeft: Radius.circular(5),
                                                    bottomLeft:
                                                        Radius.circular(5),
                                                    bottomRight:
                                                        Radius.circular(5))),
                                            child: Container(
                                                child: Container(
                                                    margin: EdgeInsets.only(
                                                        right: 10,
                                                        bottom: 10,
                                                        left: 10,
                                                        top: 10),
                                                    child: (snapshot.value[
                                                                "MessageType"] ==
                                                            "Voice")
                                                        ? Container(
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                Expanded(
                                                                  child:
                                                                      SeekBar(
                                                                    value:
                                                                        _value,
                                                                    secondValue:
                                                                        _secondValue,
                                                                    barColor:
                                                                        Colors
                                                                            .grey,
                                                                    progressColor:
                                                                        Colors
                                                                            .blue,
                                                                    thumbColor:
                                                                        Colors
                                                                            .blue,
                                                                    secondProgressColor: Colors
                                                                        .blue
                                                                        .withOpacity(
                                                                            0.5),
                                                                  ),
                                                                ),
                                                                GestureDetector(
                                                                  onTap:
                                                                      () async {
                                                                    print((snapshot
                                                                            .value
                                                                        as Map<
                                                                            dynamic,
                                                                            dynamic>)["a"]);
                                                                    if (voicerrrrr ==
                                                                        "Play") {
                                                                      setState(
                                                                          () {
                                                                        voicerrrrr =
                                                                            "Stop";
                                                                        _resumeProgressTimer();
                                                                        _secondProgressTimer = Timer.periodic(
                                                                            const Duration(milliseconds: 10),
                                                                            (_) {
                                                                          setState(
                                                                              () {
                                                                            _secondValue +=
                                                                                0.001;
                                                                            if (_secondValue >=
                                                                                1) {
                                                                              _secondProgressTimer!.cancel();
                                                                            }
                                                                          });
                                                                        });
                                                                      });
                                                                    } else {
                                                                      setState(
                                                                          () {
                                                                        voicerrrrr =
                                                                            "Play";
                                                                        _progressTimer!
                                                                            .cancel();
                                                                        _secondProgressTimer!
                                                                            .cancel();

                                                                        audioPlayer
                                                                            .stop();
                                                                      });
                                                                    }

                                                                    int result = await audioPlayer.play(snapshot
                                                                        .value[
                                                                            "message"]
                                                                        .toString());
                                                                    if (result ==
                                                                        1) {
                                                                      print(
                                                                          "PLAAYYIINNGG");
                                                                    }
                                                                    audioPlayer
                                                                        .onPlayerCompletion
                                                                        .listen(
                                                                            (event) {
                                                                      setState(
                                                                          () {
                                                                        voicerrrrr =
                                                                            "Play";
                                                                        _progressTimer!
                                                                            .cancel();
                                                                        _secondProgressTimer!
                                                                            .cancel();
                                                                      });
                                                                    });

                                                                    // player?.play();
                                                                  },
                                                                  child: (voicerrrrr ==
                                                                          "Play")
                                                                      ? Icon(Icons
                                                                          .play_arrow)
                                                                      : Icon(Icons
                                                                          .stop),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        : Container(
                                                            child: (snapshot.value[
                                                                        "MessageType"] ==
                                                                    "Image")
                                                                ? Container(
                                                                    height: 100,
                                                                    width: 110,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                5),
                                                                        image: DecorationImage(
                                                                            image:
                                                                                NetworkImage(snapshot.value["message"]),
                                                                            fit: BoxFit.cover)),
                                                                  )
                                                                : Text(
                                                                    snapshot.value[
                                                                        "message"],
                                                                    maxLines: 3,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .fade,
                                                                    style: new TextStyle(
                                                                        fontSize:
                                                                            14.0,
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                          ))),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                        );
                      },
                    ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 10,
              decoration: BoxDecoration(
                color: Color(0xffF6F6F6),
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
                margin: EdgeInsets.only(left: 25),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 18,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
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
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Container(
                              margin: EdgeInsets.only(left: 20),
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                onChanged: (value) {
                                  setState(() {
                                    messgaes = value;
                                  });
                                },
                                controller: messgae,
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: Colors.greenAccent,
                                decoration: InputDecoration(
                                    hintText: "Type your message here",
                                    hintStyle: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                60,
                                        color: Color(0xffA9A9A9)),
                                    border: InputBorder.none),
                              ),
                            )),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    backgroundColor: Colors.transparent,
                                    builder: (builder) {
                                      return new Container(
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30),
                                              topRight: Radius.circular(30)),
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            GestureDetector(
                                              onTap: () {
                                                _openCamera(context);
                                              },
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 30),
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Color(0xff3EA7AD)
                                                      .withOpacity(0.50),
                                                ),
                                                child: Center(
                                                  child: Icon(Icons.camera),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                _openGallery(context);
                                              },
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 30),
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Color(0xff3EA7AD)
                                                      .withOpacity(0.50),
                                                ),
                                                child: Center(
                                                  child: Icon(
                                                      Icons.browse_gallery),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 15),
                                child: SvgPicture.asset(
                                    "assets/images/atcchedicons.svg"),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (messgaes != "") {
                          onsendmessage();
                        } else {
                          if (_isRecording == "Play") {
                            setState(() {
                              _start();
                              _isRecording = "Stop";

                              print("myy");
                            });
                          } else {
                            _stop();
                            setState(() {
                              _isRecording = "Play";
                              print("myy");
                            });
                          }
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 15),
                        height: MediaQuery.of(context).size.height / 19,
                        width: MediaQuery.of(context).size.height / 19,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
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
                        child: Center(
                          child: (messgaes == "")
                              ? Container(
                                  child: (_isRecording == "Play")
                                      ? Icon(
                                          Icons.record_voice_over,
                                          color: Colors.black,
                                          size: 23,
                                        )
                                      : Icon(
                                          Icons.stop,
                                          color: Colors.black,
                                          size: 23,
                                        ))
                              : Icon(Icons.send),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> onsendmessage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (messgae.text.isNotEmpty) {
      _firebaseRef
          .child(prefs.getString("UserId").toString())
          .child(widget.storeid.toString())
          .push()
          .set({
        'Sender_name': prefs.getString("UserName"),
        'Sender_image':
            'https://pce-coops.com/wp-content/uploads/2019/04/blank-profile-picture-973460_1280-e1561474127956.png',
        'message': messgae.text,
        'MessageType': "Text",
        'Sender_id': prefs.getString("UserId"),
        'Receiver_name': widget.storename,
        'Receiver_id': widget.storeid,
        'Receiver_image':
            'https://pce-coops.com/wp-content/uploads/2019/04/blank-profile-picture-973460_1280-e1561474127956.png',
      });

      _firebaseRef
          .child(widget.storeid.toString())
          .child(prefs.getString("UserId").toString())
          .push()
          .set({
        'Sender_name': prefs.getString("UserName"),
        'Sender_image':
            'https://pce-coops.com/wp-content/uploads/2019/04/blank-profile-picture-973460_1280-e1561474127956.png',
        'message': messgae.text,
        'MessageType': "Text",
        'Sender_id': prefs.getString("UserId"),
        'Receiver_name': widget.storename,
        'Receiver_id': widget.storeid,
        'Receiver_image':
            'https://pce-coops.com/wp-content/uploads/2019/04/blank-profile-picture-973460_1280-e1561474127956.png',
      });

      _firebaseRef2
          .child(prefs.getString("UserId").toString())
          .child(widget.storeid.toString())
          .set({
        'Sender_name': prefs.getString("UserName"),
        'Sender_image':
            'https://pce-coops.com/wp-content/uploads/2019/04/blank-profile-picture-973460_1280-e1561474127956.png',
        'message': messgae.text,
        'MessageType': "Text",
        'Sender_id': prefs.getString("UserId"),
        'Receiver_name': widget.storename,
        'Receiver_id': widget.storeid,
        'Receiver_image':
            'https://pce-coops.com/wp-content/uploads/2019/04/blank-profile-picture-973460_1280-e1561474127956.png',
        'Status': 'Read'
      });

      _firebaseRef2
          .child(widget.storeid.toString())
          .child(prefs.getString("UserId").toString())
          .set({
        'Sender_name': prefs.getString("UserName"),
        'Sender_image':
            'https://pce-coops.com/wp-content/uploads/2019/04/blank-profile-picture-973460_1280-e1561474127956.png',
        'message': messgae.text,
        'MessageType': "Text",
        'Sender_id': prefs.getString("UserId"),
        'Receiver_name': widget.storename,
        'Receiver_id': widget.storeid,
        'Receiver_image':
            'https://pce-coops.com/wp-content/uploads/2019/04/blank-profile-picture-973460_1280-e1561474127956.png',
        'Status': 'UnRead'
      });
      sendNotificationMessageToPeerUser(messgae.text);

      setState(() {
        messgae.clear();
        messgaes = "";
      });
    }
  }

  void update() {
    _firebaseRef2
        .child("2")
        .child(widget.storeid.toString())
        .update({"Status": "Read"});
  }

  Future<void> sendNotificationMessageToPeerUser(String message) async {
    FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
    _firebaseMessaging.setForegroundNotificationPresentationOptions();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userid = prefs.getString("UserId");
    var user_name = prefs.getString("UserName");
    var _authServerKey =
        "AAAAFTlpRzc:APA91bFuxCV3WN9-i9YErwYSQfWOU21rw1fBQbiNDMidrC4E_BfNvMx3KmWA_9nFSsQZNCRGwEC87l08ejOsly0gi1Cktrbi0PvNGREErAuKm6IqHrepDW-l_W1DwSwDGgfFhDCcicCH";
    String token =
        "f6H5B5LwSomKN4f6zH-QCw:APA91bEYn184Wmz5VGahxpn_PVNyb1_vonOUiYUTENw3ZTjko4XT0RAOk4iGfKWE2ofbUNHsWhaQrfHDJeuJl1Kylo65ynSuDXbSpNIbUnAOkqY23mMAxD-MK2xM5H1ungatgS4jHCJo";
    try {
      await http.post(
        // 'https://fcm.googleapis.com/fcm/send',
        // 'https://api.rnfirebase.io/messaging/send',
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'key=$_authServerKey',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{
              'body': message,
              'title': user_name,
              'badge': '1', //'$unReadMSGCount'
              "sound": "default",
            },
            // 'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'id': '1',
              'status': 'done',
              'chatroomid': userid,
              'userName': user_name,
              'message': message
            },
            'to': Token
          },
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  void getusertoken() {
    FirebaseDatabase()
        .reference()
        .child("Token")
        .child(widget.storeid.toString())
        .once()
        .then((event) {
      var value = event.value;

      setState(() {
        Token = value['Token'];
      });

      print("token :- ${value['Token']}");
    });
  }

  Future<void> _start() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        await _audioRecorder.start();

        bool isRecording = await _audioRecorder.isRecording();
        setState(() {
          // _isRecording = isRecording;
          print("True");
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _stop() async {
    final paths = await _audioRecorder.stop();

    File voicefile = File(paths.toString());

    final String fileName = path.basename(voicefile.path);

    try {
      Reference voiceeeeeee = FirebaseStorage.instance
          .ref()
          .child("Chat")
          .child("Voice")
          .child(fileName);

      await voiceeeeeee.putFile(voicefile);

      String voicemassage = await voiceeeeeee.getDownloadURL();

      // onsendmessageimage(imageeeeee);

      onsendvoicerecording(voicemassage);

      print("Morrree${voicemassage}");

      // Refresh the UI
      setState(() {});
    } on FirebaseException catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }

    print(paths);
  }

  void onsendvoicerecording(String voice) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _firebaseRef
        .child(prefs.getString("UserId").toString())
        .child(widget.storeid.toString())
        .push()
        .set({
      'Sender_name': prefs.getString("UserName"),
      'Sender_image':
          'https://pce-coops.com/wp-content/uploads/2019/04/blank-profile-picture-973460_1280-e1561474127956.png',
      'message': voice,
      'Sender_id': prefs.getString("UserId"),
      'Receiver_name': widget.storename,
      'Receiver_id': widget.storeid,
      'MessageType': "Voice",
      'Receiver_image':
          'https://pce-coops.com/wp-content/uploads/2019/04/blank-profile-picture-973460_1280-e1561474127956.png',
    });

    _firebaseRef
        .child(widget.storeid.toString())
        .child(prefs.getString("UserId").toString())
        .push()
        .set({
      'Sender_name': prefs.getString("UserName"),
      'Sender_image':
          'https://pce-coops.com/wp-content/uploads/2019/04/blank-profile-picture-973460_1280-e1561474127956.png',
      'message': voice,
      'MessageType': "Voice",
      'Sender_id': prefs.getString("UserId"),
      'Receiver_name': widget.storename,
      'Receiver_id': widget.storeid,
      'Receiver_image':
          'https://pce-coops.com/wp-content/uploads/2019/04/blank-profile-picture-973460_1280-e1561474127956.png',
    });

    _firebaseRef2
        .child(prefs.getString("UserId").toString())
        .child(widget.storeid.toString())
        .set({
      'Sender_name': prefs.getString("UserName"),
      'Sender_image':
          'https://pce-coops.com/wp-content/uploads/2019/04/blank-profile-picture-973460_1280-e1561474127956.png',
      'message': voice,
      'MessageType': "Voice",
      'Sender_id': prefs.getString("UserId"),
      'Receiver_name': widget.storename,
      'Receiver_id': widget.storeid,
      'Receiver_image':
          'https://pce-coops.com/wp-content/uploads/2019/04/blank-profile-picture-973460_1280-e1561474127956.png',
      'Status': 'Read'
    });

    _firebaseRef2
        .child(widget.storeid.toString())
        .child(prefs.getString("UserId").toString())
        .set({
      'Sender_name': prefs.getString("UserName"),
      'Sender_image':
          'https://pce-coops.com/wp-content/uploads/2019/04/blank-profile-picture-973460_1280-e1561474127956.png',
      'message': voice,
      'MessageType': "Voice",
      'Sender_id': prefs.getString("UserId"),
      'Receiver_name': widget.storename,
      'Receiver_id': widget.storeid,
      'Receiver_image':
          'https://pce-coops.com/wp-content/uploads/2019/04/blank-profile-picture-973460_1280-e1561474127956.png',
      'Status': 'UnRead'
    });

    sendNotificationMessageToPeerUser(voice);
  }

  void _openCamera(BuildContext context) async {
    // ignore: deprecated_member_use
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      image = pickedFile;
      final String fileName = path.basename(image!.path);

      File imageFile = File(image!.path);

      try {
        Reference imageuuuu =
            FirebaseStorage.instance.ref().child("Chat").child(fileName);

        await imageuuuu.putFile(imageFile);

        String imageeeeee = await imageuuuu.getDownloadURL();

        onsendmessageimage(imageeeeee);

        // Refresh the UI
        setState(() {});
      } on FirebaseException catch (error) {
        if (kDebugMode) {
          print(error);
        }
      }
    }
  }

  void _openGallery(BuildContext context) async {
    // ignore: deprecated_member_use
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      image = pickedFile;
      final String fileName = path.basename(image!.path);

      File imageFile = File(image!.path);

      try {
        Reference imageuuuu =
            FirebaseStorage.instance.ref().child("Chat").child(fileName);

        await imageuuuu.putFile(imageFile);

        String imageeeeee = await imageuuuu.getDownloadURL();

        onsendmessageimage(imageeeeee);

        // Refresh the UI
        setState(() {});
      } on FirebaseException catch (error) {
        if (kDebugMode) {
          print(error);
        }
      }
    }
  }

  void onsendmessageimage(String image) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _firebaseRef
        .child(prefs.getString("UserId").toString())
        .child(widget.storeid.toString())
        .push()
        .set({
      'Sender_name': prefs.getString("UserName"),
      'Sender_image':
          'https://pce-coops.com/wp-content/uploads/2019/04/blank-profile-picture-973460_1280-e1561474127956.png',
      'message': image,
      'Sender_id': prefs.getString("UserId"),
      'Receiver_name': widget.storename,
      'Receiver_id': widget.storeid,
      'MessageType': "Image",
      'Receiver_image':
          'https://pce-coops.com/wp-content/uploads/2019/04/blank-profile-picture-973460_1280-e1561474127956.png',
    });

    _firebaseRef
        .child(widget.storeid.toString())
        .child(prefs.getString("UserId").toString())
        .push()
        .set({
      'Sender_name': prefs.getString("UserName"),
      'Sender_image':
          'https://pce-coops.com/wp-content/uploads/2019/04/blank-profile-picture-973460_1280-e1561474127956.png',
      'message': image,
      'MessageType': "Image",
      'Sender_id': prefs.getString("UserId"),
      'Receiver_name': widget.storename,
      'Receiver_id': widget.storeid,
      'Receiver_image':
          'https://pce-coops.com/wp-content/uploads/2019/04/blank-profile-picture-973460_1280-e1561474127956.png',
    });

    _firebaseRef2
        .child(prefs.getString("UserId").toString())
        .child(widget.storeid.toString())
        .set({
      'Sender_name': prefs.getString("UserName"),
      'Sender_image':
          'https://pce-coops.com/wp-content/uploads/2019/04/blank-profile-picture-973460_1280-e1561474127956.png',
      'message': image,
      'MessageType': "Image",
      'Sender_id': prefs.getString("UserId"),
      'Receiver_name': widget.storename,
      'Receiver_id': widget.storeid,
      'Receiver_image':
          'https://pce-coops.com/wp-content/uploads/2019/04/blank-profile-picture-973460_1280-e1561474127956.png',
      'Status': 'Read'
    });

    _firebaseRef2
        .child(widget.storeid.toString())
        .child(prefs.getString("UserId").toString())
        .set({
      'Sender_name': prefs.getString("UserName"),
      'Sender_image':
          'https://pce-coops.com/wp-content/uploads/2019/04/blank-profile-picture-973460_1280-e1561474127956.png',
      'message': image,
      'MessageType': "Image",
      'Sender_id': prefs.getString("UserId"),
      'Receiver_name': widget.storename,
      'Receiver_id': widget.storeid,
      'Receiver_image':
          'https://pce-coops.com/wp-content/uploads/2019/04/blank-profile-picture-973460_1280-e1561474127956.png',
      'Status': 'UnRead'
    });
    sendNotificationMessageToPeerUser(image);
  }
}
