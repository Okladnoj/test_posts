import 'package:flutter/material.dart';

GestureDetector actionAfterCrop({Function onTap, String lable}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      alignment: Alignment(0, 0),
      color: Color(0xFF212528),
      width: 124,
      height: 42,
      child: Text(
        lable,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: Color(0xFFFFFFFF),
        ),
      ),
    ),
  );
}
