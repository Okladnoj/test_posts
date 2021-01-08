import 'package:flutter/material.dart';

import 'post_provider.dart';

class PostsApp extends MaterialApp {
  PostsApp({Key key})
      : super(
          key: key,
          home: const PostProvider(),
          theme: ThemeData(fontFamily: 'Montserrat'),
          debugShowCheckedModeBanner: false,
        );
}
