import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'post/posts.dart';
import 'crop/posts.dart';

class PostProvider extends StatelessWidget {
  const PostProvider();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostCubit>(create: (BuildContext context) => PostCubit()),
        BlocProvider<CropCubit>(create: (BuildContext context) => CropCubit()),
      ],
      child: BlocBuilder<CropCubit, CropedState>(builder: (context, snapshot) {
        return snapshot.isPostArlet
            ? CorpScreen(
                crop: snapshot.crop,
              )
            : MainScreen();
      }),
    );
  }
}
