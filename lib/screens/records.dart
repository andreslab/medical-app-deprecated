import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:heart/models/models.dart';
import 'package:heart/providers/providers.dart';
import 'package:heart/theme/app_theme.dart';
import 'package:heart/widgets/widgets.dart';
import 'package:provider/provider.dart';

class RecordsScreen extends StatelessWidget {
  const RecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recordsProvider = Provider.of<RecordsProvider>(context);
    final records = recordsProvider.records;

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
