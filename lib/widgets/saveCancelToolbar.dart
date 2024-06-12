import 'package:flutter/material.dart';

class SaveCanceltToolbarWidget extends StatelessWidget {
  final VoidCallback onPressedCallback;
  final VoidCallback onCancelCallback;
  const SaveCanceltToolbarWidget(
      {super.key,
      required this.onPressedCallback,
      required this.onCancelCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: onCancelCallback,
              child: Text('Cancelar'),
            ),
          ),
          Expanded(
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black26)),
              onPressed: onPressedCallback,
              child: Text(
                'Guardar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
