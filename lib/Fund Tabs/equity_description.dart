import 'package:flutter/material.dart';
import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class EquityDescription extends StatefulWidget {
  const EquityDescription({super.key});

  @override
  State<EquityDescription> createState() => _EquityDescriptionState();
}

class _EquityDescriptionState extends State<EquityDescription> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: const YahooFinanceDailyReader().getDailyData('0P0000RU7W.L'),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<dynamic> historicalData = snapshot.data!;
            DateTime date = DateTime.fromMicrosecondsSinceEpoch(
                historicalData[10]['date'] * 1000000);
            return SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                series: <LineSeries<TimeSeries, String>>[
                  LineSeries<TimeSeries, String>(
                      // Bind data source
                      dataSource: <TimeSeries>[
                        //for (var i in historicalData)
                        TimeSeries(
                            DateTime.fromMicrosecondsSinceEpoch(
                                    historicalData[10]['date'] * 1000000)
                                .toString(),
                            historicalData[10]['open']),
                        TimeSeries(
                            DateTime.fromMicrosecondsSinceEpoch(
                                    historicalData[11]['date'] * 1000000)
                                .toString(),
                            historicalData[11]['open'])
                      ],
                      xValueMapper: (TimeSeries price, _) => price.date,
                      yValueMapper: (TimeSeries price, _) => price.price)
                ]);
          } else if (snapshot.hasError) {
            return Text('Error ${snapshot.error}');
          }

          return const Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}

class TimeSeries {
  TimeSeries(this.date, this.price);
  final String date;
  final double price;
}



/*

SfCartesianChart(
            // Initialize category axis
            primaryXAxis: CategoryAxis(),
            series: <LineSeries<TimeSeries, String>>[
          LineSeries<TimeSeries, String>(
              // Bind data source
              dataSource: <TimeSeries>[
                TimeSeries('Jan', 35),
                TimeSeries('Feb', 28),
                TimeSeries('Mar', 34),
                TimeSeries('Apr', 32),
                TimeSeries('May', 40)
              ],
              xValueMapper: (TimeSeries price, _) => price.date,
              yValueMapper: (TimeSeries price, _) => price.price)
        ])

FutureBuilder(
        future: const YahooFinanceDailyReader().getDailyData('0P0000RU7W.L'),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<dynamic> historicalData = snapshot.data!;
            return ListView.builder(
                itemCount: historicalData.length,
                itemBuilder: (BuildContext context, int index) {
                  DateTime date = DateTime.fromMicrosecondsSinceEpoch(
                      historicalData[index]['date'] * 1000);
                  return Container(
                      margin: const EdgeInsets.all(10),
                      child: Text(date.toString()));
                });
          } else if (snapshot.hasError) {
            return Text('Error ${snapshot.error}');
          }

          return const Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
*/