import 'dart:io';

import 'package:flutter/material.dart';

Widget gCardForm(File file) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: Image.file(
      file,
      fit: BoxFit.fitWidth,
    ),
  );
}
