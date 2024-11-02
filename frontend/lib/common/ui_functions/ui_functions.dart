import 'package:flutter/material.dart';

Future errorPopup({required BuildContext ctx, String? head, String? body}) {
  return showDialog(
    context: ctx,
    builder: (context) => AlertDialog(
      title: Text(
        head ?? "Something went wrong",
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        body ?? "Something went wrong",
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
