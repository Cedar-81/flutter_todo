import 'package:flutter/material.dart';

Future<void> showPopup(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Popup Title'),
        content: Text('This is a simple popup content.'),
        actions: [
          TextButton(
            onPressed: () {
              // Close the popup when the button is pressed
              Navigator.of(context).pop();
            },
            child: Text('Close'),
          ),
        ],
      );
    },
  );
}
