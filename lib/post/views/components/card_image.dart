import 'package:flutter/material.dart';

import 'actions/open_file.dart';
import 'form_card.dart';

import '../../cubit/models/model_post.dart';

class CardImage extends StatelessWidget {
  final ModelImages _modelImage;

  const CardImage({Key key, ModelImages modelImage})
      : _modelImage = modelImage,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return ActionFileOpen(
      post: _modelImage,
      child: gCardForm(_modelImage.urlPreview),
    );
  }
}
