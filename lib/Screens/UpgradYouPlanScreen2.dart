import 'package:flutter/material.dart';
import 'package:four_deals_shopping/Screens/CreateYouStoreScreen3.dart';

class UpgradeYourPlanScreenTwo extends StatefulWidget {
  @override
  State<UpgradeYourPlanScreenTwo> createState() =>
      UpgradeYourPlanScreenTwoState();
}

class UpgradeYourPlanScreenTwoState extends State<UpgradeYourPlanScreenTwo> {
  late TextEditingController search = TextEditingController();
  late String searcha;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Text(
                "What do you want to name this Store?",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 35,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 17,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 15, right: 15, top: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
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
              ),
              child: Container(
                margin: EdgeInsets.only(left: 15),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  onChanged: (value) => searcha = value,
                  controller: search,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.greenAccent,
                  decoration: InputDecoration(
                      hintText: "Store Name",
                      hintStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 55,
                          color: Colors.grey.withOpacity(0.8)),
                      border: InputBorder.none),
                ),
              ),
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      validation();
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height / 17,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 15, right: 15, top: 8),
                      decoration: BoxDecoration(
                        color: Color(0xff2696CC),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "NEXT",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height / 45,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 15, right: 15, top: 15, bottom: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.only(right: 10),
                          height: MediaQuery.of(context).size.height / 90,
                          decoration: BoxDecoration(
                            color: Color(0xff2696CC),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        )),
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.only(right: 10),
                          height: MediaQuery.of(context).size.height / 90,
                          decoration: BoxDecoration(
                            color: Color(0xffE4E4E4),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        )),
                        Expanded(
                            child: Container(
                          height: MediaQuery.of(context).size.height / 90,
                          decoration: BoxDecoration(
                            color: Color(0xffE4E4E4),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  void validation() {
    if (search.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color(0xff2696CC),
          content: Text("Please Enter StoreName")));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CreateYourStoreScreen3(search.text)));
    }
  }
}
