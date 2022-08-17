import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_deals_shopping/Screens/LoginScreenActivity.dart';

class ALertDailogUtils {
  void dialogbutton(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (ctx) {
          bool isChecked = false;
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              insetPadding: EdgeInsets.symmetric(horizontal: 25),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              content: Container(
                height: MediaQuery.of(context).size.height / 5,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 12,
                      width: MediaQuery.of(context).size.height / 12,
                      child: SvgPicture.asset(
                        "assets/images/righticonspopup.svg",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "Confirmation",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 40,
                            color: Color(0xff707070)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        "You Have Successfully Register !",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 60,
                            color: Color(0xff636363)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        "We Sent a email on your email address Please Verify your Account! ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 60,
                            color: Color(0xff9B9B9B)),
                      ),
                    )
                  ],
                ),
              ),
              actions: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(bottom: 10),
                          width: MediaQuery.of(context).size.width / 1.8,
                          height: MediaQuery.of(context).size.height / 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff2696CC)),
                          child: Text(
                            "DONE",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          });
        });
  }
}
