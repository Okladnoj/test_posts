import 'package:flutter/material.dart';

import '../../../settings/settings.dart';
import '../../../crop/views/open_directory.dart';

class CreateRecord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      child: ActionOpenDerictory(
        child: Container(
          decoration: gBoxDecorationCreateRecord,
          height: 48,
          child: Stack(
            alignment: Alignment(-1, 0),
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 19),
                child: Icon(
                  Icons.add_circle_outline,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              Center(
                  child: Text(
                'Сделать запись',
                textAlign: TextAlign.center,
                style: kTextStyleCreateRecord,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
