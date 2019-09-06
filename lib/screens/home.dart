import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/feather.dart';
import 'package:salesapp/common/colors.dart';
import 'package:salesapp/screens/discount.dart';
import 'package:salesapp/screens/nowfree.dart';

import 'about.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Sale for Free',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;

  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new PreferredSize(
        child: new Container(
          padding: new EdgeInsets.only(top: 14),
          child: new Padding(
            padding: const EdgeInsets.only(left: 28.0, top: 18.0, bottom: 18.0),
            child: new Text(
              'App Sales & Free App',
              style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
          decoration: new BoxDecoration(
              gradient:
                  new LinearGradient(colors: [colorAppOrange, colorAppYellow]),
              boxShadow: [
                new BoxShadow(
                  color: Colors.grey[500],
                  blurRadius: 20.0,
                  spreadRadius: 1.0,
                )
              ]),
        ),
        preferredSize: new Size(MediaQuery.of(context).size.width, 150.0),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: _getPage(currentPage),
        ),
      ),
      bottomNavigationBar: FancyBottomNavigation(
        circleColor: colorAppYellow,
        inactiveIconColor: colorAppOrange,
        tabs: [
          TabData(
            iconData: Feather.getIconData("activity"),
            title: "Now Free",
          ),
          TabData(
            iconData: Feather.getIconData("percent"),
            title: "Discount",
          ),
          TabData(iconData: Feather.getIconData("info"), title: "About")
        ],
        initialSelection: 0,
        key: bottomNavigationKey,
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
    );
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return NowFree();
      case 1:
        return Discount();
      case 2:
        return UserSettings();
      default:
        return NowFree();
    }
  }
}
