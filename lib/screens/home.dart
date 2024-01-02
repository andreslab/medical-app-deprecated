import 'package:flutter/material.dart';
import 'package:heart/screens/screens.dart';
import 'package:provider/provider.dart';

import 'package:heart/providers/ui_provider.dart';
import 'package:heart/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: CustomAppBar(),
          preferredSize: Size.fromHeight(80)), //kToolbarHeight
      body: _HomeScreenBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    switch (currentIndex) {
      case 0:
        return ResumeScreen();
      case 1:
        return RecordsScreen();
      case 2:
        return NewsScreen();
      case 3:
        return AlertsScreen();
      default:
        return ResumeScreen();
    }
  }
}
