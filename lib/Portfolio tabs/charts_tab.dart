// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sparrowapp/Portfolio%20tabs/piechart.dart';

class InvestmentsOverView extends StatefulWidget {
  const InvestmentsOverView({super.key});

  @override
  State<InvestmentsOverView> createState() => _InvestmentsOverViewState();
}

class _InvestmentsOverViewState extends State<InvestmentsOverView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 239, 239, 1),
      body: Center(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[PieChartView()],
          ),
        )),
      ),
    );
  }
}
