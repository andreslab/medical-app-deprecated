import 'package:flutter/material.dart';
import 'package:heart/models/models.dart';
import 'package:heart/providers/providers.dart';
import 'package:heart/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recordsProvider = Provider.of<RecordsProvider>(context);
    final records = recordsProvider.records;
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
              itemBuilder: (_, int index) {
                Record record = records[index];
                return ItemRecord(record: record);
              },
              itemCount: records.length,
            ),
          )
        ],
      ),
    );
  }
}
