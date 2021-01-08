import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'functions/get_data_net.dart';
import 'functions/save_file.dart';
import 'models/model_post.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  bool isPostArlet = false;
  PostCubit() : super(PostInitial([])) {
    loadPosts();
  }
  Future<void> loadPosts() async {
    List<IPost> _posts = await gFunctionGetDataNet();
    loadFiles(_posts);
    emit(PostInitial(_posts));
  }

  Future<void> loadFiles(List<IPost> posts) async {
    List<IPost> _posts = await downloadListFiles(posts);

    emit(PostInitial(_posts));
  }

  sowPostArlet() {
    isPostArlet = false;
    emit(state);
  }
}
