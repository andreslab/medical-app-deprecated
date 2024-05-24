import 'package:flutter/material.dart';
import 'package:heart/providers/providers.dart';
import 'package:heart/theme/app_theme.dart';
import 'package:provider/provider.dart';

class NewRecordScreen extends StatelessWidget {
  const NewRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightMainBox = size.height * 0.4;
    final recordsProvider = Provider.of<RecordsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black26),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(children: [
          Text('13:00', style: TextStyle(color: Colors.black54)),
          Expanded(
              child: Text(
            '30 Marco 2021',
            textAlign: TextAlign.end,
            style: TextStyle(color: Colors.black54),
          ))
        ]),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            width: double.infinity,
            height: heightMainBox,
            decoration: BoxDecoration(
                color: AppTheme.regularRecord,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'SYS',
                      style: TextStyle(
                          color: AppTheme.light, fontSize: AppTheme.h3),
                    ),
                    Spacer(),
                    Text(
                      '130',
                      style: TextStyle(
                          color: AppTheme.normal, fontSize: AppTheme.h1),
                    )
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      'DIA',
                      style: TextStyle(
                          color: AppTheme.light, fontSize: AppTheme.h3),
                    ),
                    Spacer(),
                    Text(
                      '80',
                      style: TextStyle(
                          color: AppTheme.normal, fontSize: AppTheme.h1),
                    )
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      'PUL',
                      style: TextStyle(
                          color: AppTheme.light, fontSize: AppTheme.h3),
                    ),
                    Spacer(),
                    Text(
                      '70',
                      style: TextStyle(
                          color: AppTheme.normal, fontSize: AppTheme.h1),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: null,
                    child: Text('Cancelar'),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black26)),
                    onPressed: () => recordsProvider.createRecordSample(),
                    child: Text(
                      'Guardar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
