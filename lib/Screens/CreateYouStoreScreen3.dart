import 'package:flutter/material.dart';
import 'package:four_deals_shopping/Screens/CreateStoreUI/CreateYourStoreScreen4.dart';

class CreateYourStoreScreen3 extends StatefulWidget {
  String? storename = null;
  CreateYourStoreScreen3(this.storename);
  @override
  State<CreateYourStoreScreen3> createState() => CreateYourStoreScreen3State();
}

class CreateYourStoreScreen3State extends State<CreateYourStoreScreen3> {
  final search = TextEditingController();
  late String searcha;

  List<String> category = [];

  @override
  void initState() {
    print(widget.storename);
    super.initState();
  }

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
                "What category best describes this Store?",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 35,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
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
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          top: (category.length == 0) ? 0 : 10,
                          left: 5,
                          right: 5),
                      height: (category.length == 0)
                          ? 0
                          : MediaQuery.of(context).size.height / 24,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              itemCount: category.length,
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, index) {
                                return Container(
                                  margin: EdgeInsets.only(left: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color(0xffE9E9E9)),
                                  child: Stack(
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Container(),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  category.removeAt(index);
                                                });
                                              },
                                              child: Container(
                                                child: Icon(
                                                  Icons.cancel_outlined,
                                                  size: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      60,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Center(
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 10,
                                                top: 8,
                                                bottom: 8,
                                                right: 10),
                                            child: Text(
                                              category[index],
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          60,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              })),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.only(left: 15),
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              onChanged: (value) => searcha = value,
                              controller: search,
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Colors.greenAccent,
                              decoration: InputDecoration(
                                  hintText: "Search for categories",
                                  hintStyle: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              55,
                                      color: Colors.grey.withOpacity(0.8)),
                                  border: InputBorder.none),
                            ),
                          )),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Icon(Icons.search),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Text(
                "A category will help people find this Store in search result.",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height / 55,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 20),
              child: Text(
                "Popular Categories",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 52,
                    color: Color(0xffAEAEAE),
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        category.add("Automobiles");
                      });
                    },
                    child: Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xffE9E9E9)),
                          child: Center(
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 10, top: 8, bottom: 8, right: 10),
                              child: Text(
                                "Automobiles",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height / 60,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        category.add("Men's Fashion, shoe, watch");
                      });
                    },
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xffE9E9E9)),
                          child: Center(
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 10, top: 8, bottom: 8, right: 10),
                              child: Text(
                                "Men's Fashion, shoe, watch",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height / 60,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              category.add("Real Estate");
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffE9E9E9)),
                            child: Center(
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: 10, top: 8, bottom: 8, right: 10),
                                child: Text(
                                  "Real Estate",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              60,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              category.add("Fashion");
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffE9E9E9)),
                            child: Center(
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: 10, top: 8, bottom: 8, right: 10),
                                child: Text(
                                  "Fashion",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              60,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateYourStoreScreen4(
                                  widget.storename, category)));
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
                            color: Color(0xff2696CC),
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
}
