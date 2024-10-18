import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:heart/models/models.dart';
import 'package:heart/providers/providers.dart';
import 'package:heart/theme/app_theme.dart';
import 'package:heart/widgets/widgets.dart';
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
                return ItemAlarm(
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
