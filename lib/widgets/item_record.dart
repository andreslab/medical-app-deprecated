import 'package:flutter/material.dart';
import 'package:heart/theme/app_theme.dart';
import 'package:provider/provider.dart';

import 'package:heart/providers/ui_provider.dart';

class ItemRecord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height * 0.1;

    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: AppTheme.healtyRecord),
        width: double.infinity,
        height: height,
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('SYS',
                  style: TextStyle(
                      fontSize: AppTheme.body, color: AppTheme.light)),
              Text('120',
                  style:
                      TextStyle(fontSize: AppTheme.h3, color: AppTheme.bold)),
              Spacer(),
              Text('DIA',
                  style: TextStyle(
                      fontSize: AppTheme.body, color: AppTheme.light)),
              Text('80',
                  style:
                      TextStyle(fontSize: AppTheme.h3, color: AppTheme.bold)),
              Spacer(),
              Text('70',
                  style: TextStyle(
                      fontSize: AppTheme.title, color: AppTheme.bold)),
              Icon(
                Icons.favorite_border,
                color: AppTheme.heart,
              )
            ],
          ),
        ));
  }
}
