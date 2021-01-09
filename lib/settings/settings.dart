import 'package:flutter/material.dart';

const kBoxDecorationMainScreen = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment(-1, -1),
    end: Alignment(1, 1),
    colors: [
      Color(0xFF667EEA),
      Color(0xFF764BA2),
    ],
    stops: [
      0.0,
      0.7,
    ],
  ),
);

const kTextStyleTitleMainScreen = TextStyle(
  color: Color(0xFFFFFFFF),
  fontSize: 24,
  fontWeight: FontWeight.w600,
);

BoxDecoration gBoxDecorationCreateRecord = BoxDecoration(
  borderRadius: BorderRadius.circular(12),
  color: Color(0xFF30CFD0),
);

const kTextStyleCreateRecord = TextStyle(
  color: Color(0xFFFFFFFF),
  fontSize: 16,
  fontWeight: FontWeight.w700,
);

const kUrlPosts = 'http://116.202.241.23:3333/api/posts';
