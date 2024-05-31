import 'package:flutter/material.dart';
import 'package:heart/theme/app_theme.dart';

class TextFieldWidget extends StatefulWidget {
  final ValueChanged<String>? onChanged;

  TextFieldWidget({this.onChanged});

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: TextField(
        // style: TextStyle(color: AppTheme.normal, fontSize: AppTheme.h1),
        controller: _controller,
        onChanged: widget.onChanged,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: '0',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
