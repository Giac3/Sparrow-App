import 'package:flutter/material.dart';

class PieChartView extends StatefulWidget {
  const PieChartView({super.key});

  @override
  State<PieChartView> createState() => _PieChartViewState();
}

class _PieChartViewState extends State<PieChartView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 4,
        child: LayoutBuilder(
          builder: (context, constraint) => Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(239, 239, 239, 1),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    spreadRadius: -2,
                    blurRadius: 17,
                    offset: Offset(0, 0),
                    color: Colors.black,
                  ),
                  BoxShadow(
                    spreadRadius: -2,
                    blurRadius: 10,
                    offset: Offset(7, 7),
                    color: Color.fromRGBO(239, 239, 239, 1),
                  ),
                ]),
          ),
        ));
  }
}
