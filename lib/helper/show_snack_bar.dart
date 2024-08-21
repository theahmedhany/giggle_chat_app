import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Color(0xff96B8DB),
      content: Text(
        message,
        style: const TextStyle(
          color: Color(0xff230462),
          fontSize: 17,
        ),
      ),
    ),
  );
}
