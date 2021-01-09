import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:tape_posts/crop/cubit/model/model_crop.dart';

class ActionFileOpen extends StatelessWidget {
  final Widget child;
  final ICrop post;

  const ActionFileOpen({
    Key key,
    @required this.child,
    @required this.post,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: child,
      onTap: () {
        try {
          OpenFile.open(post.file.path);
        } catch (e) {
          print('Don\'t open file');
          print(e);
        }
      },
    );
  }
}
