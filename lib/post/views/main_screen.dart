import 'package:flutter/material.dart';

import '../../settings/settings.dart';
import 'components/create_record.dart';
import 'components/title.dart';
import 'list_posts.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kBoxDecorationMainScreen,
        child: SafeArea(
          child: ListView(
            children: [
              TitleMainScreen(),
              CreateRecord(),
              ListPosts(),
            ],
          ),
        ),
      ),
    );
  }
}
