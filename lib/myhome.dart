
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:expenses_budget/pages/budget_page.dart';
import 'package:expenses_budget/pages/create_budget_page.dart';
import 'package:expenses_budget/pages/dailypage.dart';
import 'package:expenses_budget/pages/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'colors.dart';
import 'pages/statspage.dart';

class MyHome extends StatefulWidget {



  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _pageIndex = 0;
  List<Widget> _pages = [
    DailyPage(),
    StatsPage(),
    BudgetPage(),
    ProfilePage(),
    CreateBudgetPage(),
  ];

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBody(),
      bottomNavigationBar: GetFooter(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          SelectedTab(4);
        },
        child: Icon(
          Icons.add,
          size: 25,
        ),
        backgroundColor: Colors.pink,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  //this is the function of GetBody

  Widget GetBody(){
    return IndexedStack(
      index: _pageIndex,
      children: _pages
    );
  }

  //this is the function of GetFooter

  Widget GetFooter(){
    List<IconData> iconsItems = [
      Icons.calendar_today_rounded,
      Icons.stacked_bar_chart,
      Icons.account_balance_wallet_rounded,
      Icons.person,
    ];

    return AnimatedBottomNavigationBar(
      onTap:(index){
        SelectedTab(index);
      },
      activeColor: primary,
      splashColor: secondary,
      inactiveColor: Colors.black.withOpacity(0.5),
      icons: iconsItems,
      activeIndex: 1,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      iconSize: 25,
      rightCornerRadius: 10,

    );
  }


  SelectedTab(index){
    setState(() {
      _pageIndex = index;

    });
  }
}

