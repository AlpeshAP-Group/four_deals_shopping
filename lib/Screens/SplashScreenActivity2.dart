import 'package:awesome_dropdown/awesome_dropdown.dart';
import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:four_deals_shopping/Controller/SplashScreen2ViewModel.dart';
import 'package:four_deals_shopping/Screens/SearchCategoryActivity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class SplashScreenTwo extends StatefulWidget {
  @override
  State<SplashScreenTwo> createState() => SplashScreenTwoState();
}

class SplashScreenTwoState extends State<SplashScreenTwo> {
  List<DropdownMenuItem<Object?>> _dropdownTestItems = [];
  List<DropdownMenuItem<Object?>> _dropdownTestItems2 = [];
  var _selectedTest;
  var _selectedTest2;
  List _testList = [
    {'iso2': "KW", 'name': 'Kuwait'},
    {'iso2': "AE", 'name': 'UAE'},
    {'iso2': "SA", 'name': 'Saudi Arab'},
    {'iso2': "OM", 'name': 'Oman'},
    {'iso2': "QA", 'name': 'Qatar'},
    {'iso2': "BH", 'name': 'Bahrain'},
  ];
  List _testList2 = [
    {'id': "1", 'name': 'English'},
    {'id': "2", 'name': 'Arabic'},
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _isBackPressedOrTouchedOutSide = false,
      _isDropDownOpened = false,
      _isPanDown = false;
  late List<String> _list;
  late List<String> _list2;
  String _selectedItem = '';
  String _selectedItem2 = '';

  late List<DropdownMenuItem> _dropdownTestItemss = [];

  List<DropdownMenuItem> buildDropdownTestItems(List _testList) {
    List<DropdownMenuItem> items = [];
    for (var i in _testList) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(i['name']),
        ),
      );
    }
    return items;
  }

  @override
  void initState() {
    _list = ["English", "Arabic"];
    _dropdownTestItems = buildDropdownTestItems(_testList);
    _dropdownTestItems2 = buildDropdownTestItems(_testList2);
    _list2 = ["Kuwait", "UAE", "Saudi Arab", "Oman", "Qatar", "Bahrain"];
    _selectedItem = 'Select Language';
    _selectedItem2 = 'Select Country';
    super.initState();
  }

  onChangeDropdownTests(selectedTest) async {
    print(selectedTest);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      prefs.setString("CuntryISO", selectedTest["iso2"].toString());
      _selectedTest = selectedTest;
      print("SASASSA${selectedTest['iso2'].toString()}");
    });
  }

  onChangeDropdownTests2(selectedTest) async {
    print(selectedTest);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      prefs.setString("Language", selectedTest["id"].toString());
      _selectedTest2 = selectedTest;
      print("SASASSA${selectedTest['id'].toString()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenTwoViewModel>.reactive(
        viewModelBuilder: () => SplashScreenTwoViewModel(),
        onModelReady: (model) => {
              model.fetchhotdeals(),
            },
        builder: (context, model, child) => Scaffold(
              body: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/images/splashscreenbackground2.png"),
                        fit: BoxFit.fill)),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin:
                                EdgeInsets.only(top: 170, left: 30, right: 30),
                            height: MediaQuery.of(context).size.height / 15,
                            width: MediaQuery.of(context).size.width / 1.5,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/splashlogopng'.png"),
                                    fit: BoxFit.fill)),
                          ),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "WELCOME",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                32,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, top: 13, bottom: 30),
                                  child: Text(
                                    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              50,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Color(0xff0084C4),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      height: MediaQuery.of(context).size.height / 2.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin:
                                EdgeInsets.only(left: 30, right: 30, top: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 20, left: 10, right: 10),
                                  child: DropdownBelow(
                                    itemWidth:
                                        MediaQuery.of(context).size.width / 1.5,
                                    itemTextstyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                    boxTextstyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                    boxPadding:
                                        EdgeInsets.fromLTRB(13, 12, 0, 12),
                                    boxHeight: 50,
                                    boxWidth: MediaQuery.of(context).size.width,
                                    boxDecoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    hint: Text('Select Language'),
                                    value: _selectedTest2,
                                    items: _dropdownTestItems2,
                                    onChanged: onChangeDropdownTests2,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 20, left: 10, right: 10),
                                  child: DropdownBelow(
                                    itemWidth:
                                        MediaQuery.of(context).size.width / 1.5,
                                    itemTextstyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                    boxTextstyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                    boxPadding:
                                        EdgeInsets.fromLTRB(13, 12, 0, 12),
                                    boxHeight: 50,
                                    boxWidth: MediaQuery.of(context).size.width,
                                    boxDecoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    hint: Text('Select Country'),
                                    value: _selectedTest,
                                    items: _dropdownTestItems,
                                    onChanged: onChangeDropdownTests,
                                  ),
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SearchCategoryScreen()));
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 50, right: 50, bottom: 30),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 15,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              45,
                                      width:
                                          MediaQuery.of(context).size.height /
                                              45,
                                      decoration: BoxDecoration(
                                          color: Color(0xff595959),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Center(
                                        child: Icon(
                                          Icons.arrow_right,
                                          color: Colors.white,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              45,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        "CONTINUE",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                56),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
