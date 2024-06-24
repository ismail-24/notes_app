import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/post_model.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitial());
  List<PostModel>? posts;
  fetchAllNotes() async {
    var postsBox = Hive.box<PostModel>(kPostsBox);
    posts = postsBox.values.toList();

    emit(PostsSuccess());
  }
}
