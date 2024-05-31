import 'package:flutter/material.dart';
import 'package:heart/models/models.dart';
import 'package:heart/providers/providers.dart';
import 'package:heart/theme/app_theme.dart';
import 'package:heart/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class NewRecordScreen extends StatelessWidget {
  const NewRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightMainBox = size.height * 0.4;
    final recordsProvider = Provider.of<RecordsProvider>(context);
    String todayDateString = DateFormat.yMMMMd().format(DateTime.now());
    String hourString = DateFormat.Hm().format(DateTime.now());
    Record newRecord = Record();

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black26),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(children: [
          Text(hourString, style: TextStyle(color: Colors.black54)),
          Expanded(
              child: Text(
            todayDateString,
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
                      'SYS:',
                      style: TextStyle(
                          color: AppTheme.light, fontSize: AppTheme.h2),
                    ),
                    Spacer(),
                    TextFieldWidget(
                      onChanged: (value) {
                        newRecord.systolic = int.parse(value);
                      },
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      'DIA:',
                      style: TextStyle(
                          color: AppTheme.light, fontSize: AppTheme.h2),
                    ),
                    Spacer(),
                    TextFieldWidget(onChanged: (value) {
                      newRecord.diastolic = int.parse(value);
                    }),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      'PUL:',
                      style: TextStyle(
                          color: AppTheme.light, fontSize: AppTheme.h2),
                    ),
                    Spacer(),
                    TextFieldWidget(onChanged: (value) {
                      newRecord.bpm = int.parse(value);
                    })
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
                    onPressed: () => {recordsProvider.createRecord(newRecord)},
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
