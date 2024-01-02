import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:heart/widgets/widgets.dart';

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightChart = size.height * 0.4;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: heightChart,
            child: BarChartWidget(),
          ),
          Container(
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_, int index) => ItemRecord(),
              itemCount: 7,
            ),
          )
        ],
      ),
    );
  }
}
