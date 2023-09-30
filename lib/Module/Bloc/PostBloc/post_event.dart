part of 'post_bloc.dart';

@immutable
abstract class PostEvent  extends Equatable{
  const PostEvent();
}

class LoadPostEvent extends PostEvent{
  @override
  List<Object?> get props => [];

}class LoadCommentEvent extends PostEvent {
  final int postId;

  LoadCommentEvent({
    required this.postId,
  });

  @override
  List<Object?> get props => [postId];
}