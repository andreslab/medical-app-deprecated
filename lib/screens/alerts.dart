import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:heart/models/models.dart';
import 'package:heart/providers/providers.dart';
import 'package:heart/theme/app_theme.dart';
import 'package:provider/provider.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final alarmsProvider = Provider.of<AlarmsProvider>(context);
    final alarms = alarmsProvider.alarms;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () => Navigator.pushNamed(context, 'new-alarm',
                        arguments: 'data-instance'),
                    child: Text('Nuevo')),
                TextButton(onPressed: null, child: Text('...')),
              ],
            ),
          ),
          Container(
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_, int index) {
                Alarm alarm = alarms[index];
                return _ItemAlarm(
                  alarm: alarm,
                );
              },
              itemCount: alarms.length,
            ),
          )
        ],
      ),
    );
  }
}

class _ItemAlarm extends StatelessWidget {
  final Alarm alarm;

  const _ItemAlarm({super.key, required this.alarm});

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
              Text(alarm.time, style: TextStyle(fontSize: 20)),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(alarm.title, style: TextStyle(fontSize: 20)),
                  Text(alarm.body, style: TextStyle(fontSize: 10)),
                ],
              ),
            ],
          ),
        ));
  }
}
