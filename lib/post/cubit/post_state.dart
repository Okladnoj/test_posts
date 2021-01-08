part of 'post_cubit.dart';

@immutable
abstract class PostState {
  final List<IPost> posts;

  PostState(this.posts);
}

class PostInitial extends PostState {
  PostInitial(List<IPost> posts) : super(posts);
}
