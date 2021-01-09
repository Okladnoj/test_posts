import 'package:flutter/material.dart';

Widget gCardForm(String url) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: Image.network(
      url,
      fit: BoxFit.fitWidth,
    ),
  );
}
