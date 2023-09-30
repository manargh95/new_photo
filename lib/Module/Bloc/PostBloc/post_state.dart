part of 'post_bloc.dart';

class PostState extends Equatable {
  final RequestStatus status;
  final List<PostT_Model> posts;
  final List<CommentsT_Model> comments;
  final String message;

  const PostState({
    this.status = RequestStatus.initial,
    this.posts = const <PostT_Model>[],
    this.comments = const <CommentsT_Model>[],
    this.message = '',
  });

  @override
  List<Object> get props => [status, posts, message];

  PostState copyWith({
    RequestStatus? status,
    List<PostT_Model>? posts,
    List<CommentsT_Model>? comments,
    String? message,
  }) {
    return PostState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      comments: comments ?? this.comments,
      message: message ?? this.message,
    );
  }
}
