import 'package:flutter/material.dart';
import 'package:heart/theme/app_theme.dart';
import 'package:provider/provider.dart';

import 'package:heart/providers/ui_provider.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentTitle = uiProvider.selectedTitleAppBar;
    return AppBar(
        title: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            currentTitle,
            style: TextStyle(fontSize: AppTheme.h3),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: AppTheme.primary),
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              )),
        ]);
  }
}
