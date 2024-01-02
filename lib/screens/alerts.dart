import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:heart/theme/app_theme.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(onPressed: null, child: Text('Nuevo')),
                TextButton(onPressed: null, child: Text('Agendar')),
                TextButton(onPressed: null, child: Text('...')),
              ],
            ),
          ),
          Container(
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_, int index) => _ItemAlarm(),
              itemCount: 5,
            ),
          )
        ],
      ),
    );
  }
}

class _ItemAlarm extends StatelessWidget {
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
              Text('10:00 AM', style: TextStyle(fontSize: 20)),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Presión alterial', style: TextStyle(fontSize: 20)),
                  Text('L,M,M,J,V,S,D', style: TextStyle(fontSize: 10)),
                ],
              ),
            ],
          ),
        ));
  }
}
