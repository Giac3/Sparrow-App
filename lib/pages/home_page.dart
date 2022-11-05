// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sparrowapp/pages/funds_page.dart';
import 'package:sparrowapp/pages/news_page.dart';
import 'package:sparrowapp/pages/portfolio_page.dart';
import 'package:sparrowapp/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  int _selectedIndex = 0;
  static final List<Widget> _NavScreens = <Widget>[
    NewsPage(),
    FundsPage(),
    PortfolioPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _NavScreens.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        color: Color.fromRGBO(239, 239, 239, 1),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
          child: GNav(
            backgroundColor: Color.fromRGBO(239, 239, 239, 1),
            color: Color.fromRGBO(90, 73, 227, 1.000),
            activeColor: Color.fromRGBO(90, 73, 227, 1.000),
            tabBackgroundColor: Colors.white,
            gap: 8,
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            padding: EdgeInsets.all(16),
            tabs: const [
              GButton(
                  icon: Icons.newspaper,
                  text: "News",
                  textColor: Color.fromRGBO(90, 73, 227, 1.000)),
              GButton(
                  icon: Icons.search,
                  text: "Funds",
                  textColor: Color.fromRGBO(90, 73, 227, 1.000)),
              GButton(
                  icon: Icons.bar_chart,
                  text: "Porfolio",
                  textColor: Color.fromRGBO(90, 73, 227, 1.000)),
              GButton(
                  icon: Icons.person,
                  text: "Profile",
                  textColor: Color.fromRGBO(90, 73, 227, 1.000)),
            ],
          ),
        ),
      ),
    );
  }
}
