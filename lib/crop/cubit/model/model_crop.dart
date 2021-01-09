import 'dart:io';

import 'package:flutter_native_image/flutter_native_image.dart';

abstract class ICrop {
  int originX = 0;
  int originY = 0;
  int width = 20;
  int height = 20;
  File file;
  String title = '';
  String content = '';
}

class CropImage implements ICrop {
  @override
  int height;

  @override
  int originX;

  @override
  int originY;

  @override
  int width;

  @override
  File file;

  @override
  String content;

  @override
  String title;

  CropImage(this.file) {
    originX = 0;
    originY = 0;
    _fillPropertis(file);
  }
  CropImage.withPropertis(this.file, ImageProperties properties) {
    originX = 0;
    originY = 0;
    height = properties.height;
    width = properties.width;
  }
  _fillPropertis(File file) async {
    ImageProperties properties = await FlutterNativeImage.getImageProperties(file.path);
    height = properties.height;
    width = properties.width;
  }
}
