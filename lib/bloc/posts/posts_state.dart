part of 'posts_bloc.dart';

class PostsState extends Equatable {
  final Status postStatus;
  final List<PostModel> postList;
  final String message;
  const PostsState(
      {this.postStatus = Status.loading,
      this.postList = const <PostModel>[],
      this.message = ''});
  PostsState copyWith(
      {Status? postStatus, List<PostModel>? postList, String? message}) {
    return PostsState(
      postStatus: postStatus ?? this.postStatus,
      postList: postList ?? this.postList,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [postStatus, postList, message];
}
