import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../widgets/homepage/today_info_card.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Sales Report",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //TODO today's income and orders here
                  TodayInfoCard(),
                  TodayInfoCard(),
                ],
              ),
              const SizedBox(height: 25),
              //TODO income/sales for last 7days here
              SizedBox(
                height: screenSize.height * 0.35,
                width: double.infinity,
                child: BarChart(
                  BarChartData(
                    maxY: 100,
                    minY: 0,
                    titlesData: const FlTitlesData(
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: true),
                        axisNameWidget: Text("Date"),
                      ),
                    ),
                    barTouchData: BarTouchData(),
                    barGroups: [
                      BarChartGroupData(x: 20, barRods: [
                        BarChartRodData(toY: 66),
                        BarChartRodData(toY: 75),
                      ]),
                      BarChartGroupData(x: 20, barRods: [
                        BarChartRodData(toY: 70),
                        BarChartRodData(toY: 22),
                      ]),
                      BarChartGroupData(x: 20, barRods: [
                        BarChartRodData(toY: 30),
                        BarChartRodData(toY: 22),
                      ]),
                      BarChartGroupData(x: 20, barRods: [
                        BarChartRodData(toY: 33),
                        BarChartRodData(toY: 22),
                      ]),
                      BarChartGroupData(x: 20, barRods: [
                        BarChartRodData(toY: 70),
                        BarChartRodData(toY: 66),
                      ]),
                      BarChartGroupData(x: 20, barRods: [
                        BarChartRodData(toY: 84),
                        BarChartRodData(toY: 22),
                      ]),
                      BarChartGroupData(x: 20, barRods: [
                        BarChartRodData(toY: 24),
                        BarChartRodData(toY: 22),
                      ]),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              //TODO  number of orders here
              SizedBox(
                height: screenSize.height * 0.4,
                child: LineChart(
                  LineChartData(
                    maxY: 100,
                    minY: 0,
                    minX: 0,
                    titlesData: const FlTitlesData(
                      topTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          const FlSpot(0, 10),
                          const FlSpot(2, 74),
                          const FlSpot(3, 44),
                          const FlSpot(5, 56),
                          const FlSpot(6, 89),
                          const FlSpot(7, 35),
                          const FlSpot(8, 94),
                          const FlSpot(9, 26),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //TODO show sales here
              SizedBox(
                height: screenSize.height * 0.4,
                child: LineChart(
                  LineChartData(
                    maxY: 100,
                    minY: 0,
                    minX: 0,
                    titlesData: const FlTitlesData(
                      topTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          const FlSpot(0, 10),
                          const FlSpot(2, 74),
                          const FlSpot(3, 44),
                          const FlSpot(5, 56),
                          const FlSpot(6, 89),
                          const FlSpot(7, 35),
                          const FlSpot(8, 94),
                          const FlSpot(9, 26),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //TODO sales by category
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //TODO  sales by categories here
                  SizedBox(
                    height: screenSize.height * 0.3,
                    width: screenSize.width * 0.45,
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(value: 10),
                          PieChartSectionData(value: 20),
                          PieChartSectionData(value: 11),
                          PieChartSectionData(value: 23),
                        ],
                      ),
                    ),
                  ),
                  //TODO  number by categories here
                  SizedBox(
                    height: screenSize.height * 0.3,
                    width: screenSize.width * 0.45,
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(value: 10),
                          PieChartSectionData(value: 20),
                          PieChartSectionData(value: 11),
                          PieChartSectionData(value: 23),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
