import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:heart/theme/app_theme.dart';
import 'package:heart/widgets/widgets.dart';

class RecordsScreen extends StatelessWidget {
  const RecordsScreen({super.key});

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
                TextButton(onPressed: null, child: Text('Enviar')),
                TextButton(onPressed: null, child: Text('Descargar')),
                TextButton(onPressed: null, child: Text('...')),
              ],
            ),
          ),
          Container(
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_, int index) => ItemRecord(),
              itemCount: 100,
            ),
          )
        ],
      ),
    );
  }
}
