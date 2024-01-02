import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () => Navigator.pushNamed(context, 'new-record',
            arguments: 'data-instance'));
  }
}
