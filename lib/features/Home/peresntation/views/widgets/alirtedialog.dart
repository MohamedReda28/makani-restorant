import 'package:flutter/material.dart';

Future<void> showLogoutDialog({required BuildContext context, required VoidCallback onConfirm}) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('تأكيد تسجيل الخروج'),
        content: const Text('هل أنت متأكد أنك تريد تسجيل الخروج؟'),
        actions: <Widget>[
          TextButton(
            child: const Text('إلغاء'),
            onPressed: () {
              Navigator.of(context).pop(); // يقفل الـ Dialog
            },
          ),
          ElevatedButton(
            child: const Text('نعم'),
            onPressed: () {
              Navigator.of(context).pop(); // يقفل الـ Dialog
              onConfirm(); // ينفذ تسجيل الخروج
            },
          ),
        ],
      );
    },
  );
}
