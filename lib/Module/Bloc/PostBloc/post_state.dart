part of 'post_bloc.dart';

@immutable
  abstract class PostState extends Equatable{}

class PostLoadingStat extends PostState {
  @override
  List<Object?> get props => [];
}
class PostLoadedStat extends PostState {
  final List<PostT_Model> posts;

  PostLoadedStat(this.posts);
  @override
  List<Object?> get props => [posts];
}

class PostErrorStat extends PostState {
final String error;

  PostErrorStat(this.error);
  @override
  List<Object?> get props => [error];
}
