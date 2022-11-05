// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sparrowapp/Fund%20Tabs/equitylist_screen.dart';
import 'package:sparrowapp/fund_data/equity_data.dart';

class EquityTab extends StatefulWidget {
  const EquityTab({super.key});

  @override
  State<EquityTab> createState() => _EquityTabState();
}

class _EquityTabState extends State<EquityTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: equitiesList.length,
          itemBuilder: (context, index) {
            Equity equity = equitiesList[index];

            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                title: Text(equity.name, style: TextStyle(color: Colors.black)),
                subtitle: Text(equity.price,
                    style: TextStyle(
                        color: '${equity.price[0]}' == '-'
                            ? Colors.red
                            : Colors.green)),
                leading: Image(image: AssetImage(equity.imageUrl)),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EquityFundInfo(equity)));
                },
              ),
            );
          }),
      backgroundColor: Color.fromRGBO(239, 239, 239, 1),
    );
  }
}
