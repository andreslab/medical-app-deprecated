import 'package:flutter/material.dart';
import 'package:heart/models/models.dart';
import 'package:heart/providers/providers.dart';
import 'package:heart/widgets/widgets.dart';
import 'package:provider/provider.dart';

class NewAlarmScreen extends StatefulWidget {
  const NewAlarmScreen({super.key});

  @override
  State<NewAlarmScreen> createState() => _NewAlarmScreenState();
}

class _NewAlarmScreenState extends State<NewAlarmScreen> {
  late final TextEditingController _title;
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    _title = TextEditingController();
    _selectedTime = TimeOfDay.now();
    super.initState();
  }

  @override
  void dispose() {
    _title.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final alarmsProvider = Provider.of<AlarmsProvider>(context);
    Alarm newAlarm = Alarm();

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black26),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(children: [
          Text('New alarm', style: TextStyle(color: Colors.black54)),
        ]),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Title:',
            ),
            TextField(
              controller: _title,
              decoration: InputDecoration(hintText: 'title'),
            ),
            TextButton(
              child: Text("${_selectedTime.hour}:${_selectedTime.minute}"),
              onPressed: () async {
                final TimeOfDay? timeOfDay = await showTimePicker(
                    context: context,
                    initialTime: _selectedTime,
                    initialEntryMode: TimePickerEntryMode.dial);
                if (timeOfDay != null) {
                  setState(() {
                    _selectedTime = timeOfDay;
                  });
                }
              },
            ),
            SaveCanceltToolbarWidget(
                onPressedCallback: () => {
                      alarmsProvider.createAlarmSample()
                      // alarmsProvider.createAlarm(newAlarm);
                    },
                onCancelCallback: () => {Navigator.pop(context)})
          ],
        ),
      ),
    );
  }
}
