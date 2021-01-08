import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tape_posts/post/cubit/models/model_post.dart';
import 'package:tape_posts/post/views/components/card_video.dart';

import '../posts.dart';
import 'components/card_image.dart';

class ListPosts extends StatelessWidget {
  const ListPosts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
      builder: (context, snapshot) {
        final posts = snapshot.posts;
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: posts.length,
          itemBuilder: (BuildContext context, int index) {
            IPost post = posts[index];
            print(post.urlPreview);
            return _addPaddings(
              (post is ModelVideo) //
                  ? CardVideo(modelVideo: post)
                  : CardImage(modelImage: post),
            );
          },
        );
      },
    );
  }

  Widget _addPaddings(Widget _) => Padding(
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
          bottom: 32,
        ),
        child: _,
      );
}
