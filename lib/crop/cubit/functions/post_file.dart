import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:tape_posts/crop/cubit/model/model_crop.dart';
import 'package:tape_posts/post/settings.dart';

gPostCropFile(ICrop crop) async {
  File cropFile;
  cropFile = await cropImage(crop);
  final http.Response response = await http.post(
    'http://116.202.241.23:3333/api/media/',
    headers: {"form-data": 'image/video/gallery'},
  );
  var respons1 = response;
}

Future<File> cropImage(ICrop _cropImage) async {
  File croppedFile = await FlutterNativeImage.cropImage(
    _cropImage.file.path,
    _cropImage.originX,
    _cropImage.originY,
    _cropImage.width,
    _cropImage.height,
  );
  return croppedFile;
}
