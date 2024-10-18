import 'package:flutter/material.dart';
import 'package:heart/models/models.dart';
import 'package:heart/theme/app_theme.dart';
import 'package:provider/provider.dart';

import 'package:heart/providers/ui_provider.dart';

class ItemAlarm extends StatelessWidget {
  final Alarm alarm;

  const ItemAlarm({super.key, required this.alarm});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height * 0.1;

    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: AppTheme.backgroundRecord),
        width: double.infinity,
        height: height,
        child: Center(
          child: Row(
            children: [
              Text("${alarm.time}", style: TextStyle(fontSize: 20)),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${alarm.title}", style: TextStyle(fontSize: 20)),
                  Text("${alarm.body}", style: TextStyle(fontSize: 10)),
                ],
              ),
            ],
          ),
        ));
  }
}
