import 'package:flutter/material.dart';

void buildErrorSnackBar(context, {required String message}) {
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(12),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

        content: Text(message),
      ),
    );
}

void buildSuccessSnackBar(context, {required String message}) {
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        backgroundColor: Colors.blue,
        margin: EdgeInsets.all(12),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

        content: Text(message),
      ),
    );
}
