import 'package:flutter/material.dart';

import '../View/LoginScreen/loginscreen.dart';

Future<void> showMyDialog(
  context,
  String title,
  String name,
) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color(0xffF9EED9),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(title),
              const SizedBox(
                height: 30,
              ),
              Text(name),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
              child: const Text('ok'),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                    (route) => false);
              }),
        ],
      );
    },
  );
}
