// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mrx_charts/mrx_charts.dart';

class EquityPerformance extends StatefulWidget {
  const EquityPerformance({super.key});

  @override
  State<EquityPerformance> createState() => _EquityPerformanceState();
}

class _EquityPerformanceState extends State<EquityPerformance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 239, 239, 1),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text('Historical Performance'),
          Container(
            constraints: const BoxConstraints(
              maxHeight: 300.0,
              maxWidth: 600.0,
            ),
            padding: const EdgeInsets.all(30.0),
            child: Chart(
              layers: layers(),
              padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(
                bottom: 12.0,
              ),
            ),
          ),
          Text('Major Investments'),
          Container(
            constraints: const BoxConstraints(
              maxHeight: 300.0,
              maxWidth: 600.0,
            ),
            padding: const EdgeInsets.all(15.0),
            child: Chart(
              layers: layerspie(),
            ),
          ),
        ],
      ),
    );
  }

  List<ChartLayer> layers() {
    final from = DateTime(2021, 1);
    final to = DateTime(2021, 12);
    final frequency =
        (to.millisecondsSinceEpoch - from.millisecondsSinceEpoch) / 11.0;
    return [
      ChartHighlightLayer(
        shape: () => ChartHighlightLineShape<ChartLineDataItem>(
          backgroundColor: Colors.grey,
          currentPos: (item) => item.currentValuePos,
          radius: const BorderRadius.all(Radius.circular(8.0)),
          width: 60.0,
        ),
      ),
      ChartAxisLayer(
        settings: ChartAxisSettings(
          x: ChartAxisSettingsAxis(
            frequency: frequency,
            max: to.millisecondsSinceEpoch.toDouble(),
            min: from.millisecondsSinceEpoch.toDouble(),
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 10.0,
            ),
          ),
          y: ChartAxisSettingsAxis(
            frequency: 50.0,
            max: 400.0,
            min: 0.0,
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 10.0,
            ),
          ),
        ),
        labelX: (value) => DateFormat('MMM')
            .format(DateTime.fromMillisecondsSinceEpoch(value.toInt())),
        labelY: (value) => value.toInt().toString(),
      ),
      ChartLineLayer(
        items: List.generate(
          7,
          (index) => ChartLineDataItem(
            x: (index * frequency) + from.millisecondsSinceEpoch,
            value: Random().nextInt(380) + 20,
          ),
        ),
        settings: const ChartLineSettings(
          color: Color(0xFF8043F9),
          thickness: 4.0,
        ),
      ),
      ChartTooltipLayer(
        shape: () => ChartTooltipLineShape<ChartLineDataItem>(
          backgroundColor: Colors.white,
          circleBackgroundColor: Colors.white,
          circleBorderColor: const Color(0xFF331B6D),
          circleSize: 4.0,
          circleBorderThickness: 2.0,
          currentPos: (item) => item.currentValuePos,
          onTextValue: (item) => '£${item.value.toString()}',
          marginBottom: 6.0,
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 8.0,
          ),
          radius: 6.0,
          textStyle: const TextStyle(
            color: Color(0xFF8043F9),
            letterSpacing: 0.2,
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ];
  }

  List<ChartLayer> layerspie() {
    return [
      ChartGroupPieLayer(
        items: List.generate(
          2,
          (index) => List.generate(
            Random().nextInt(4) + 2,
            (index) => ChartGroupPieDataItem(
                amount: Random().nextInt(300) * Random().nextDouble(),
                color: [
                  Colors.orangeAccent,
                  Colors.pinkAccent,
                  Colors.redAccent,
                  Colors.blueAccent,
                  Colors.cyanAccent,
                  Colors.tealAccent,
                ][Random().nextInt(6)],
                label: [
                  'Life',
                  'Work',
                  'Medicine',
                  'Bills',
                  'Hobby',
                  'Holiday',
                ][Random().nextInt(6)]),
          ),
        ),
        settings: const ChartGroupPieSettings(),
      ),
      ChartTooltipLayer(
        shape: () => ChartTooltipPieShape<ChartGroupPieDataItem>(
          onTextName: (item) => item.label,
          onTextValue: (item) => '€${item.amount.toString()}',
          radius: 10.0,
          backgroundColor: Colors.white,
          padding: const EdgeInsets.all(12.0),
          nameTextStyle: const TextStyle(
            color: Color(0xFF8043F9),
            fontWeight: FontWeight.w700,
            height: 1.47,
            fontSize: 12.0,
          ),
          valueTextStyle: const TextStyle(
            color: Color(0xFF1B0E41),
            fontWeight: FontWeight.w700,
            fontSize: 12.0,
          ),
        ),
      )
    ];
  }
}
