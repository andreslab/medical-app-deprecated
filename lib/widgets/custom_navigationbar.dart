import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:heart/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  final PAGES = ['Hola Jaime', 'Registros', 'Noticias', 'Alarmas'];

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    return BottomNavigationBar(
      onTap: (value) {
        uiProvider.selectedMenuOpt = value;
        uiProvider.selectedTitleAppBar = PAGES[value];
      },
      currentIndex: currentIndex,
      elevation: 0,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Resumen'),
        BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Registro'),
        BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'Noticias'),
        BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'Alarmas'),
      ],
    );
  }
}
