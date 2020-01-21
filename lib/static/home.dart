import 'package:flutter/material.dart';
import 'package:geo_tagging/static/location.dart';
import 'cards.dart';
import 'CustomIcon.dart';
import 'location.dart';
import 'retrive.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  List<Widget> bottomNavIconList = [
    Icon(
      CustomIcons.home_1,
      size: 20.0,
    ),
       Icon(
      CustomIcons.favorite,
      size: 20.0,
    ),
       Icon(
      CustomIcons.params,
      size: 20.0,
    ),
 
  
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
          child: new Column(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 30.0, bottom: 25.0),
                  child:
                      Image.asset("assests/icon.png", width: 102.0, height: 63.0),
                ),
              ),
              ProductCard(0xFFfaecfb,"assests/animal.png","Report Animal Poaching",LogicPage()),
              SizedBox(
                height: 32.0,
              ),
              ProductCard(0xFFfaecfb,"assests/animal.png","Report Plant Poaching",LogicPage()),
              SizedBox(
                height: 32.0,
              ), 

              ProductCard(0xFF98FB98,"assests/animal.png","Save Nearby",MyListPage()),
                SizedBox(
                height: 32.0,
              ),
               ProductCard(0xFF98FB97,"assests/animal.png","Game",MyListPage()),
                SizedBox(
                height: 32.0,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70.0,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black12.withOpacity(0.065),
              offset: Offset(0.0, -3.0),
              blurRadius: 10.0)
        ]),
        child: Row(
          children: bottomNavIconList.map((item) {
            var index = bottomNavIconList.indexOf(item);
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                child: bottomNavItem(item, index == _currentIndex),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

bottomNavItem(Widget item, bool isSelected) => Container(
      decoration: BoxDecoration(
          boxShadow: isSelected
              ? [
                  BoxShadow(
                      color: Colors.black12.withOpacity(0.02),
                      offset: Offset(0.0, 5.0),
                      blurRadius: 10.0)
                ]
              : []),
      child: item,
    );