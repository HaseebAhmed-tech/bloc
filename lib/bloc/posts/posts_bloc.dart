import 'package:bloc/bloc.dart';
import 'package:bloc_prac/data/response/status.dart';
import 'package:bloc_prac/models/post_model.dart';
import 'package:bloc_prac/repository/posts_repository.dart';
import 'package:equatable/equatable.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostRepository _postRepository;
  PostsBloc(this._postRepository) : super(const PostsState()) {
    on<FetchPosts>(fetchPosts);
  }

  void fetchPosts(PostsEvent event, Emitter<PostsState> emit) async {
    await _postRepository
        .fetchPosts('https://jsonplaceholder.typicode.com/comments')
        .then((value) {
      emit(state.copyWith(
          postStatus: Status.completed, postList: value, message: 'Success'));
    }).onError((error, stackTrace) {
      emit(state.copyWith(postStatus: Status.error, message: '$error'));
    });
  }
}
