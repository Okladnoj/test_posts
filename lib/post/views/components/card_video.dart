import 'package:flutter/material.dart';

import 'actions/open_file.dart';
import 'form._card.dart';

import '../../cubit/models/model_post.dart';

class CardVideo extends StatelessWidget {
  final ModelVideo _modelVideo;

  const CardVideo({Key key, ModelVideo modelVideo})
      : _modelVideo = modelVideo,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return ActionFileOpen(
      post: _modelVideo,
      child: gCardForm(_modelVideo.urlPreview),
    );
  }
}
