import 'dart:async';
import 'dart:io';

import 'package:ext_storage/ext_storage.dart';
import 'package:path_provider/path_provider.dart' as pathP;
import 'package:permission_handler/permission_handler.dart';
import 'package:tape_posts/post/cubit/models/model_post.dart';
import 'package:tape_posts/post/cubit/models/model_post_save.dart';

/// Load Any Files for Net to Storage
///
/// [isVideo] work only Android
Future<String> downloadFile(String url, {String filename, bool isVideo}) async {
  File _file;
  String dir;
  dir = await gGetDefultDirectory(isVideo);

  _file = new File('$dir/$filename');
  HttpClient()
      .getUrl(Uri.parse(url))
      .then((HttpClientRequest request) => request.close())
      .then((HttpClientResponse response) => response.pipe(_file.openWrite()));
  return '$dir/$filename';
}

Future<String> gGetDefultDirectory([bool isVideo = false]) async {
  String dir;
  if (Platform.isAndroid) {
    String typeFile = isVideo == null
        ? ExtStorage.DIRECTORY_DOWNLOADS
        : isVideo
            ? ExtStorage.DIRECTORY_MOVIES
            : ExtStorage.DIRECTORY_PICTURES;
    dir = await ExtStorage.getExternalStoragePublicDirectory(typeFile);
  } else {
    dir = (await pathP.getApplicationDocumentsDirectory()).path;
  }

  if (await Permission.storage.request().isGranted) {
    await Directory(dir).create(recursive: true);
  } else {
    print('await Permission.storage.isGranted');
    print(await Permission.storage.isGranted);
  }
  return dir;
}

Future<List<IPost>> downloadListFiles(List<IPost> posts) async {
  for (IPost post in posts) {
    await _saveFile(post);
  }
  return posts;
}

Future _saveFile(IPost post) async {
  final directory = await downloadFile(post.urlFile, filename: post.file, isVideo: post.isVideo);
  post.postSave = ModelPostSave(name: post.file, directory: directory);
}
