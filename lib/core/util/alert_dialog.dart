import 'package:flutter/material.dart';
import 'package:izam_sherif_flutter_task/features/auth/presentation/views/sign_in_view/sign_in_imports.dart';


void showAlertDialog({required BuildContext context , required  String title , required String content}) {
  AlertDialog dialog = AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: [
      ElevatedButton(
        child: const Text('OK'),
        onPressed: () {
          // Close the dialog
          Navigator.of(context).pop();
        },
      ),
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return dialog;
    },
    barrierDismissible: true,

  );
}
