import 'package:ecclesia_ui/client/widgets/custom_appbar.dart';
import 'package:ecclesia_ui/client/widgets/custom_drawer.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Result extends StatelessWidget {
  final String id;
  final String userId;

  final List<BarChartGroupData> data = [
    BarChartGroupData(x: 1, barRods: [
      BarChartRodData(toY: 16, width: 30, color: Colors.blue),
    ]),
    BarChartGroupData(x: 2, barRods: [
      BarChartRodData(toY: 30, width: 30, color: Colors.red),
    ]),
    BarChartGroupData(x: 3, barRods: [
      BarChartRodData(toY: 11, width: 30, color: Colors.orange),
    ]),
    // BarChartGroupData(x: 4, barRods: [
    //   BarChartRodData(toY: 2, width: 15, color: Colors.amber),
    // ]),
    // BarChartGroupData(x: 5, barRods: [
    //   BarChartRodData(toY: 13, width: 15, color: Colors.amber),
    // ]),
    // BarChartGroupData(x: 6, barRods: [
    //   BarChartRodData(toY: 17, width: 15, color: Colors.amber),
    // ]),
    // BarChartGroupData(x: 7, barRods: [
    //   BarChartRodData(toY: 19, width: 15, color: Colors.amber),
    // ]),
    // BarChartGroupData(x: 8, barRods: [
    //   BarChartRodData(toY: 21, width: 15, color: Colors.amber),
    // ]),
  ];

  Result({Key? key, required this.id, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 248, 250),
      appBar: const CustomAppBar(
        back: true,
        disableBackGuard: true,
        disableMenu: false,
      ),
      endDrawer: const CustomDrawer(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                context.go('/');
                // debugPrint("Going to election detail with id ");
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
              child: const Text('Go back home'),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          const ElectionResult(),
          GraphElection(data: data),
        ],
      ),
    );
  }
}

class ElectionResult extends StatelessWidget {
  const ElectionResult({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      margin: const EdgeInsets.fromLTRB(0, 30, 0, 15),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12.0), boxShadow: [
        BoxShadow(
            color: const Color.fromARGB(255, 211, 211, 211).withOpacity(0.5), //color of shadow
            spreadRadius: 3, //spread radius
            blurRadius: 7, // blur radius
            offset: const Offset(0, 6)),
      ]),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: const Text(
              'The majority of votes are on:',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            width: double.infinity,
            child: const Text(
              'Susan Matthew',
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class GraphElection extends StatelessWidget {
  final List<BarChartGroupData> data;
  const GraphElection({
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
      margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12.0), boxShadow: [
        BoxShadow(
            color: const Color.fromARGB(255, 211, 211, 211).withOpacity(0.5), //color of shadow
            spreadRadius: 3, //spread radius
            blurRadius: 7, // blur radius
            offset: const Offset(0, 6)),
      ]),
      child: Column(
        // direction: Axis.vertical,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: const Text(
              'Result Breakdown',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
          ),
          Row(
            children: const [
              Icon(Icons.circle, color: Colors.blue),
              SizedBox(width: 10),
              Text('James Cameron'),
            ],
          ),
          Row(
            children: const [
              Icon(Icons.circle, color: Colors.red),
              SizedBox(width: 10),
              Text('Susan Matthew'),
            ],
          ),
          Row(
            children: const [
              Icon(Icons.circle, color: Colors.orange),
              SizedBox(width: 10),
              Text('Yanning Li'),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 300,
            child: BarChart(
              BarChartData(
                barGroups: data,
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 30)),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      reservedSize: 40,
                      showTitles: false,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: const Text('57 out of 60 registered voter has voted.'),
          ),
        ],
      ),
    );
  }
}
