import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_deals_shopping/Screens/MyOrder/AcceptedActivityScreen.dart';
import 'package:four_deals_shopping/Screens/MyOrder/DeclinedOrderActivity.dart';

class MyOrderScreen extends StatefulWidget {
  @override
  State<MyOrderScreen> createState() => MyOrderScreenState();
}

class MyOrderScreenState extends State<MyOrderScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
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
                "My Order",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 45,
                    color: Colors.black),
              ),
            ),
            body: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: TabBar(
                      labelColor: Colors.black,
                      // controller: _tabController,
                      // unselectedLabelColor: Colors.black,
                      indicatorColor: Colors.green,
                      // indicatorSize: TabBarIndicatorSize.tab,
                      // indicator: BoxDecoration(
                      //     border: Border.all(
                      //         width: 1, color: Colors.grey.withOpacity(0.3))),
                      tabs: [
                        Tab(
                          child: Container(
                            child: Text(
                              "Your Order",
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            child: Text(
                              "Completed",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  Expanded(
                      child: Container(
                    child: TabBarView(
                      children: [
                        AcceptedOrderActivity(),
                        DeclinedOrderScreen(),
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
