import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:tape_posts/post/cubit/models/model_post.dart';

class ActionFileOpen extends StatelessWidget {
  final Widget child;
  final IPost post;

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
          OpenFile.open(post.postSave.directory);
        } catch (e) {
          print('Don\'t open file');
          print(e);
        }
      },
    );
  }
}
