import 'package:flutter/material.dart';

import '../../cubit/model/model_crop.dart';

import 'form_card.dart';
import 'open_file.dart';

class CardImage extends StatelessWidget {
  final ICrop _modelICrop;

  const CardImage({Key key, ICrop modelICrop})
      : _modelICrop = modelICrop,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return ActionFileOpen(
      post: _modelICrop,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: gCardForm(_modelICrop.file),
      ),
    );
  }
}
