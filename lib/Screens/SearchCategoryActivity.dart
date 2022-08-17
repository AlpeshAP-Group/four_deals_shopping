import 'package:flutter/material.dart';
import 'package:four_deals_shopping/Screens/LoginScreenActivity.dart';

class SearchCategoryScreen extends StatefulWidget {
  @override
  State<SearchCategoryScreen> createState() => SearchCategoryScreenState();
}

class SearchCategoryScreenState extends State<SearchCategoryScreen> {
  final refcode = TextEditingController();
  late String REF;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image:
                    AssetImage("assets/images/search categorybackground.png"),
                fit: BoxFit.fill)),
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 60),
                  height: MediaQuery.of(context).size.height / 18,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Skip",
                      style: TextStyle(
                          color: Color(
                            0xff2696CC,
                          ),
                          fontSize: MediaQuery.of(context).size.height / 55),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 150, left: 30, right: 30),
                  height: MediaQuery.of(context).size.height / 15,
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/splashlogopng'.png"),
                          fit: BoxFit.fill)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 23, top: 40),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 20,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 8),
                        child: Icon(
                          Icons.search,
                          size: 22,
                        ),
                      ),
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          onChanged: (value) => REF = value,
                          controller: refcode,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.greenAccent,
                          decoration: InputDecoration(
                              hintText: "Search",
                              hintStyle: TextStyle(fontSize: 15),
                              border: InputBorder.none),
                        ),
                      ))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: MediaQuery.of(context).size.height / 18,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                      color: Color(0xff2696CC),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Search Now",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height / 55),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
