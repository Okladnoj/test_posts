import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/model_post.dart';
import '../../../settings/settings.dart';

Future<List<IPost>> gFunctionGetDataNet() async {
  List<IPost> _listPosts = [];

  http.Response _response = await http.get(kUrlPosts);
  if (_response.statusCode == 200) {
    Map<String, dynamic> _json = json.decode(_response.body);
    _listPosts = _parsJson(_json['posts']);
  } else {
    print('statusCode: ${_response.statusCode} is not "200"');
  }
  return _listPosts;
}

List<IPost> _parsJson(List<dynamic> listMap) {
  List<IPost> _listPosts = [];
  for (final post in listMap) {
    if (post['is_video'] != null) {
      if (post['is_video']) {
        _listPosts.add(ModelVideo.fromJson(post));
      } else {
        _listPosts.add(ModelImages.fromJson(post));
      }
    } else {
      print('unrecognized model');
    }
  }
  return _listPosts;
}
