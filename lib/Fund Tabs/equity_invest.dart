// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../fund_data/equity_data.dart';
import 'equitylist_screen.dart';

class EquityInvest extends StatefulWidget {
  final Equity equity;

  const EquityInvest(this.equity);

  @override
  State<EquityInvest> createState() => _EquityInvestState();
}

class _EquityInvestState extends State<EquityInvest> {
  bool? isCheckedLump = false;
  bool? isCheckedMonthly = false;
  bool? isCheckedISA = false;
  bool? isCheckedNISA = false;

  get signIn => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(239, 239, 239, 1),
        body: SafeArea(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  widget.equity.name,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    hintText: 'Investment Value',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Payment Method',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              CheckboxListTile(
                title: Text('Lump Sum'),
                controlAffinity: ListTileControlAffinity.platform,
                value: isCheckedLump,
                onChanged: (newBool) {
                  setState(() {
                    isCheckedMonthly == false
                        ? isCheckedLump = newBool
                        : isCheckedLump != false;
                  });
                },
                activeColor: Colors.white,
                checkColor: Colors.black,
                checkboxShape: CircleBorder(),
              ),
              CheckboxListTile(
                title: Text('Monthly'),
                controlAffinity: ListTileControlAffinity.platform,
                value: isCheckedMonthly,
                onChanged: (newBool) {
                  setState(() {
                    isCheckedLump == false
                        ? isCheckedMonthly = newBool
                        : isCheckedMonthly != false;
                  });
                },
                activeColor: Colors.white,
                checkColor: Colors.black,
                checkboxShape: CircleBorder(),
              ),
              SizedBox(height: 20),
              Text(
                'Account Type',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              CheckboxListTile(
                title: Text('ISA'),
                controlAffinity: ListTileControlAffinity.platform,
                value: isCheckedISA,
                onChanged: (newBool) {
                  setState(() {
                    isCheckedNISA == false
                        ? isCheckedISA = newBool
                        : isCheckedISA != false;
                  });
                },
                activeColor: Colors.white,
                checkColor: Colors.black,
                checkboxShape: CircleBorder(),
              ),
              CheckboxListTile(
                title: Text('Non-ISA'),
                controlAffinity: ListTileControlAffinity.platform,
                value: isCheckedNISA,
                onChanged: (newBool) {
                  setState(() {
                    isCheckedISA == false
                        ? isCheckedNISA = newBool
                        : isCheckedNISA != false;
                  });
                },
                activeColor: Colors.white,
                checkColor: Colors.black,
                checkboxShape: CircleBorder(),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                      onTap: signIn,
                      child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                            child: Text(
                              "Invest",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ))))
            ]),
          ),
        ));
  }
}
