// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../Fund Tabs/equity_tab.dart';
import '../Fund Tabs/index_tab.dart';

class FundsPage extends StatefulWidget {
  const FundsPage({super.key});

  @override
  State<FundsPage> createState() => _FundsPageState();
}

class _FundsPageState extends State<FundsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Funds",
            style: TextStyle(
                color: Color.fromRGBO(90, 73, 227, 1.000),
                fontWeight: FontWeight.bold),
          ),
          //Text("Funds Page", style: TextStyle(color: Color.fromRGBO(90,73,227,1.000)),
          backgroundColor: Color.fromRGBO(239, 239, 239, 1),
          elevation: 0,
        ),
        backgroundColor: Color.fromRGBO(239, 239, 239, 1),
        body: Column(children: [
          TabBar(
              splashBorderRadius: BorderRadius.circular(20),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 1.5,
              labelColor: Colors.black,
              tabs: [
                Tab(
                  height: 51,
                  text: "Index",
                  icon: Icon(
                    Icons.stacked_line_chart,
                    color: Color.fromRGBO(90, 73, 227, 1.000),
                  ),
                ),
                Tab(
                  height: 51,
                  text: "Equity",
                  icon: Icon(
                    Icons.balance,
                    color: Color.fromRGBO(90, 73, 227, 1.000),
                  ),
                ),
              ],
              indicatorColor: Color.fromRGBO(90, 73, 227, 1.000)),
          Expanded(
            child: TabBarView(children: [
              // Index Tab
              IndexTab(),
              // Equity Tab
              EquityTab()
            ]),
          )
        ]),
      ),
    );
  }
}
