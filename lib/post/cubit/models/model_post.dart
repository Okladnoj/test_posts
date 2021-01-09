import 'package:tape_posts/crop/cubit/model/model_crop.dart';

import 'model_post_save.dart';

abstract class IPost {
  final int id;
  final String title;
  final String content;
  final String takenAt;
  final bool isVideo;
  final String base;
  final String file;
  final String preview;
  final String poster;
  final int postId;
  ModelPostSave postSave;

  IPost(
    this.id,
    this.title,
    this.content,
    this.takenAt,
    this.isVideo,
    this.base,
    this.file,
    this.preview,
    this.poster,
    this.postId,
  );

  String get urlFile;
  String get urlPreview;
  String get urlPreviewFix;
}

class ModelVideo implements IPost {
  final int id;
  final String title;
  final String content;
  final String takenAt;
  final bool isVideo;
  final String base;
  final String file;
  final String preview;
  final String poster;
  final int postId;
  ModelPostSave postSave;

  ModelVideo(
    this.id,
    this.title,
    this.content,
    this.takenAt,
    this.isVideo,
    this.base,
    this.file,
    this.preview,
    this.poster,
    this.postId,
  );
  ModelVideo.fromJson(Map<String, dynamic> json)
      : id = json['json'],
        title = json['title'],
        content = json['content'],
        takenAt = json['taken_at'],
        isVideo = json['is_video'],
        base = json['base'],
        file = json['file'],
        preview = json['preview'],
        poster = json['poster'],
        postId = json['post_id'];

  ModelVideo.fromCrop(ICrop crop)
      : id = null,
        title = crop.title,
        content = crop.content,
        takenAt = null,
        isVideo = null,
        base = null,
        file = crop.file.path,
        preview = crop.file.path,
        poster = null,
        postId = null;

  @override
  String get urlFile => '$base$file';

  @override
  String get urlPreview => '$base$poster';

  @override
  String get urlPreviewFix => 'http://116.202.241.23:3333/video/$poster';
}

class ModelImages implements IPost {
  final int id;
  final String title;
  final String content;
  final String takenAt;
  final bool isVideo;
  final String base;
  final String file;
  final String preview;
  final String poster;
  final int postId;
  ModelPostSave postSave;

  ModelImages(
    this.id,
    this.title,
    this.content,
    this.takenAt,
    this.isVideo,
    this.base,
    this.file,
    this.preview,
    this.poster,
    this.postId,
  );
  ModelImages.fromJson(Map<String, dynamic> json)
      : id = json['json'],
        title = json['title'],
        content = json['content'],
        takenAt = json['taken_at'],
        isVideo = json['is_video'],
        base = json['base'],
        file = json['file'],
        preview = json['preview'],
        poster = json['poster'],
        postId = json['post_id'];
  ModelImages.fromCrop(ICrop crop)
      : id = null,
        title = crop.title,
        content = crop.content,
        takenAt = null,
        isVideo = null,
        base = null,
        file = crop.file.path,
        preview = crop.file.path,
        poster = null,
        postId = null;
  @override
  String get urlFile => '$base$file';

  @override
  String get urlPreview => '$base$preview';

  @override
  String get urlPreviewFix => 'http://116.202.241.23:3333/image/$preview';
}
