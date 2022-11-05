// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sparrowapp/Fund%20Tabs/equity_description.dart';
import 'package:sparrowapp/Fund%20Tabs/equity_invest.dart';
import 'package:sparrowapp/Fund%20Tabs/equity_performance.dart';
import '../fund_data/equity_data.dart';
import 'equity_tab.dart';
import 'index_tab.dart';

class EquityFundInfo extends StatefulWidget {
  final Equity equity;

  const EquityFundInfo(this.equity);

  @override
  _EquityFundInfoState createState() => new _EquityFundInfoState();
}

class _EquityFundInfoState extends State<EquityFundInfo> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Image.asset(
            widget.equity.imageUrl,
            height: 100,
          ),
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
                  text: "Metrics",
                  icon: Icon(
                    Icons.assessment,
                    color: Color.fromRGBO(90, 73, 227, 1.000),
                  ),
                ),
                Tab(
                  height: 51,
                  text: "BreakDown",
                  icon: Icon(
                    Icons.troubleshoot,
                    color: Color.fromRGBO(90, 73, 227, 1.000),
                  ),
                ),
                Tab(
                  height: 51,
                  text: "Invest",
                  icon: Icon(
                    Icons.paid,
                    color: Colors.green,
                  ),
                ),
              ],
              indicatorColor: Color.fromRGBO(90, 73, 227, 1.000)),
          Expanded(
            child: TabBarView(children: [
              // Performance Tab
              EquityPerformance(),
              // Description
              EquityDescription(),
              // Info
              EquityInvest(widget.equity)
            ]),
          )
        ]),
      ),
    );
  }
}
