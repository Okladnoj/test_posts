import 'package:flutter/material.dart';

import '../../../settings/settings.dart';

class TitleMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 103),
      child: Text(
        'This is test task',
        textAlign: TextAlign.center,
        style: kTextStyleTitleMainScreen,
      ),
    );
  }
}
