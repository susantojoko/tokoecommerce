import 'package:flutter/material.dart';

void showAlertDialog111(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Peringatan'),
        content: Text('Ini adalah contoh alert dialog.'),
        actions: <Widget>[
          TextButton(
            child: Text('Tutup'),
            onPressed: () {
              Navigator.of(context).pop(); // Menutup dialog
            },
          ),
        ],
      );
    },
  );
}