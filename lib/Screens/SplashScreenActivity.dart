import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_deals_shopping/Screens/DashboardScreen.dart';
import 'package:four_deals_shopping/Screens/Fragments/HomeFragment.dart';
import 'package:four_deals_shopping/Screens/SplashScreenActivity2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkloginstatus();
    // TODO: implement initState
    super.initState();
  }

  void checkloginstatus() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var useremail = pref.getString("email");
    print(useremail);

    // ignore: unnecessary_null_comparison
    if (useremail == null) {
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeFragment(0)));
      // Navigator.pus(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/plashscreen12.png"),
                fit: BoxFit.fill)),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 15,
                width: MediaQuery.of(context).size.width / 1.5,
                margin: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/splashlogopng'.png"),
                        fit: BoxFit.fill)),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SplashScreenTwo()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      height: MediaQuery.of(context).size.height / 12,
                      width: MediaQuery.of(context).size.height / 12,
                      decoration: BoxDecoration(
                          color: Color(0xff0084C4),
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.height / 5)),
                      child: Center(
                        child: Icon(
                          Icons.arrow_right,
                          size: MediaQuery.of(context).size.height / 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Powered by :",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 27),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Text(
                            "Hamilton Services",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 25,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
