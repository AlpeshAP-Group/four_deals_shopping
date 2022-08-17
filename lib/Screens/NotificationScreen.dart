import 'package:flutter/material.dart';
import 'package:four_deals_shopping/Controller/NotificationListViewModel.dart';
import 'package:stacked/stacked.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<NotificationScreen> createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NotificationListViewModel>.reactive(
        viewModelBuilder: () => NotificationListViewModel(),
        onModelReady: (model) => {
              model.fetchnotificationlist(),
            },
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xffF6F6F6),
                elevation: 2,
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
                  "Notifications",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 45,
                      color: Colors.black),
                ),
              ),
              body: Container(
                  margin: EdgeInsets.only(top: 8),
                  child: ListView.builder(
                      itemCount: model.notificationlist.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 50,
                                  width:
                                      MediaQuery.of(context).size.height / 50,
                                  decoration: BoxDecoration(
                                      color: Color(0xff2696CC),
                                      borderRadius: BorderRadius.circular(
                                          MediaQuery.of(context).size.height /
                                              10)),
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        model.notificationlist[index].body,
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                53,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text(
                                        "4th July 2022 at 12:00 PM",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                60,
                                            color: Color(0xff717171)),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      height: 1,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                              ))
                            ],
                          ),
                        );
                      })),
            ));
  }
}
