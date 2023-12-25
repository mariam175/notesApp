import 'package:flutter/material.dart';

void showSnakBar(BuildContext context, String mesg, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Center(child: Text(mesg),),
      ),
    );
  }