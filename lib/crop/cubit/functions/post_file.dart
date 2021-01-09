import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:tape_posts/crop/cubit/model/model_crop.dart';

gPostCropFile(ICrop crop) async {
  File cropFile = crop.file;

  String type = cropFile.uri.data == null ? 'image' : 'video';
  final requestLoadFile = http.MultipartRequest('POST', Uri.parse('http://116.202.241.23:3333/api/media/$type'));
  requestLoadFile.files.add(await http.MultipartFile.fromPath('$type', cropFile.path));
  String encryptedMediaId;
  http.StreamedResponse response = await requestLoadFile.send();
  try {
    encryptedMediaId =
        requestLoadFile.headers.values?.elementAt(0)?.replaceAll(RegExp('multipart/form-data; boundary='), '') ?? '';
    print(encryptedMediaId);
  } catch (e) {
    encryptedMediaId = '';
    print(e);
  }

  var requestPostFile = http.MultipartRequest('POST', Uri.parse('http://116.202.241.23:3333/api/posts'));

  requestPostFile.fields.addAll({
    'encryptedMediaId': encryptedMediaId,
    'title': crop?.title ?? '',
    'content': crop?.content ?? '',
  });

  response = await requestPostFile.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
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
