// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sparrowapp/Portfolio%20tabs/charts_tab.dart';
import 'package:sparrowapp/Portfolio%20tabs/manage_tab.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Portfolio",
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
                  text: "Portfolio",
                  icon: Icon(
                    Icons.pie_chart,
                    color: Color.fromRGBO(90, 73, 227, 1.000),
                  ),
                ),
                Tab(
                  height: 51,
                  text: "Manage",
                  icon: Icon(
                    Icons.shuffle,
                    color: Color.fromRGBO(90, 73, 227, 1.000),
                  ),
                ),
              ],
              indicatorColor: Color.fromRGBO(90, 73, 227, 1.000)),
          Expanded(
            child: TabBarView(children: [
              // Index Tab
              InvestmentsOverView(),
              // Equity Tab
              ManageInvestments()
            ]),
          )
        ]),
      ),
    );
  }
}
