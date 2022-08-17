import 'package:carousel_slider/carousel_slider.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_deals_shopping/Controller/HomeHragmentViewModel.dart';
import 'package:four_deals_shopping/Screens/Fragments/ChatFragment.dart';
import 'package:four_deals_shopping/Screens/Fragments/HomeFragment.dart';
import 'package:four_deals_shopping/Screens/Fragments/MyAccountFragment.dart';
import 'package:four_deals_shopping/Screens/UploadProductScreen.dart';
import 'package:stacked/stacked.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  dynamic selected;
  var heart = false;
  int _currentIndex = 0;
  List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeFragmentViewModel>.reactive(
        viewModelBuilder: () => HomeFragmentViewModel(),
        onModelReady: (model) => {
              _screens.add(HomeFragment(0)),
              _screens.add(Container()),
              _screens
                  .add(ChatFragment(model.userid, model.name, model.userimage))
            },
        builder: (context, model, child) => Scaffold(
              extendBody: true,
              body: HomeFragment(0),
              // floatingActionButton: const SizedBox(
              //   height: 60,
              //   width: 60,
              // ),
              // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              // bottomNavigationBar: AnimatedBottomNavigationBar(
              //   bottomBarItems: [
              //     BottomBarItemsModel(
              //       icon: Container(
              //           height: 20,
              //           width: 20,
              //           child: SvgPicture.asset("assets/images/homeicondashboard.svg")),
              //       iconSelected: Container(
              //           height: 20,
              //           width: 20,
              //           child: SvgPicture.asset("assets/images/homeicondashboard.svg")),
              //       title: "Home",
              //       dotColor: Colors.red,
              //       onTap: () {
              //         setState(() => _currentIndex = 0);
              //       },
              //     ),
              //     BottomBarItemsModel(
              //       icon: Container(
              //         height: 20,
              //         width: 20,
              //         child: SvgPicture.asset("assets/images/storeicon.svg"),
              //       ),
              //       iconSelected: Container(
              //         height: 20,
              //         width: 20,
              //         child: SvgPicture.asset("assets/images/storeicon.svg"),
              //       ),
              //       title: "Store",
              //       dotColor: Colors.red,
              //       onTap: () {
              //         setState(() => _currentIndex = 1);
              //       },
              //     ),
              //     BottomBarItemsModel(
              //       icon: Container(
              //         height: 20,
              //         width: 20,
              //         child: SvgPicture.asset("assets/images/chaticondashboard.svg"),
              //       ),
              //       iconSelected: Container(
              //         height: 20,
              //         width: 20,
              //         child: SvgPicture.asset("assets/images/chaticondashboard.svg"),
              //       ),
              //       title: "Chat",
              //       dotColor: Colors.red,
              //       onTap: () {
              //         setState(() => _currentIndex = 2);
              //       },
              //     ),
              //     BottomBarItemsModel(
              //       icon: Container(
              //         height: 20,
              //         width: 20,
              //         child:
              //             SvgPicture.asset("assets/images/accounticonsdashboard.svg"),
              //       ),
              //       iconSelected: Container(
              //         height: 20,
              //         width: 20,
              //         child:
              //             SvgPicture.asset("assets/images/accounticonsdashboard.svg"),
              //       ),
              //       title: "Account",
              //       dotColor: Colors.red,
              //       onTap: () {
              //         setState(() {
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => MyAccountFragment()));
              //         });
              //       },
              //     ),
              //   ],
              //   bottomBarCenterModel: BottomBarCenterModel(
              //     centerBackgroundColor: Color(0xff0178AE),
              //     centerIcon: const FloatingCenterButton(
              //       child: Icon(
              //         Icons.add,
              //         color: AppColors.white,
              //       ),
              //     ),
              //     centerIconChild: [
              //       FloatingCenterButtonChild(
              //         child: const Icon(
              //           Icons.cancel,
              //           color: Colors.white,
              //         ),
              //         onTap: () {},
              //       ),
              //       FloatingCenterButtonChild(
              //         child: const Icon(
              //           Icons.add,
              //           color: AppColors.white,
              //         ),
              //         onTap: () {
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => UploadProductScreen()));
              //         },
              //       ),
              //     ],
              //   ),
              // ),
            ));
  }
}
