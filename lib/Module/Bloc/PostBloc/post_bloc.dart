import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:photos_app/Model/CommentsT_Model.dart';

import '../../../Api/repo/repository.dart';
import '../../../Config/constant/app_constant.dart';
import '../../../Model/PostT_Model.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final Repo _repo;

  PostBloc({required Repo repo})
      : _repo = repo,
        super(const PostState()) {
    on<LoadPostEvent>(_onLoadPostEvent);
    on<LoadCommentEvent>(_onLoadCommentEvent);
  }

  FutureOr<void> _onLoadPostEvent(
      LoadPostEvent event, Emitter<PostState> emit) async {
    emit(state.copyWith(
      status: RequestStatus.inProgress,
    ));
    try {
      List<PostT_Model> posts = await _repo.fetchData();
      print("size ${posts.length}");
      emit(state.copyWith(status: RequestStatus.success, posts: posts));
    } catch (errorMsg) {
      emit(state.copyWith(
          status: RequestStatus.failure, message: errorMsg.toString()));
    }
  }



  FutureOr<void> _onLoadCommentEvent(
      LoadCommentEvent event, Emitter<PostState> emit) async {
    emit(state.copyWith(
      status: RequestStatus.inProgress,
    ));
    try {
      List<CommentsT_Model> comments = await _repo.fetchComments(event.postId);
      print("size ${comments.length}");
      emit(state.copyWith(status: RequestStatus.success, comments: comments));
    } catch (errorMsg) {
      emit(state.copyWith(
          status: RequestStatus.failure, message: errorMsg.toString()));
    }
  }
}




