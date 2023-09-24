import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../Api/repo/repository.dart';
import '../../../Model/PostT_Model.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final Repo repo;

  PostBloc(this.repo) : super(PostLoadingStat()) {
    on<PostEvent>((event, emit) async{
      emit(PostLoadingStat());
      print('PostLoadingStat');


try{
  final posts = await repo.fetchData();
  emit(PostLoadedStat(posts));
}
catch(e){
  emit(PostErrorStat(e.toString()));

}
    });
  }
}
