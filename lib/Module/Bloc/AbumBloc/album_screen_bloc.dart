import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:photos_app/Model/AlbumsT_Model.dart';
import 'package:photos_app/Model/PhotosT_Model.dart';

import '../../../Api/repo/repository.dart';
import '../../../Config/constant/app_constant.dart';

part 'album_screen_event.dart';
part 'album_screen_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final Repo _repo;

  AlbumBloc({required Repo repo})
      : _repo = repo,
        super(const AlbumState()) {
    on<LoadAlbumEvent>(_LoadAlbumEvent);
    on<LoadPhotosEvent>(_LoadPhotosEvent);
  }

  FutureOr<void> _LoadAlbumEvent(
      LoadAlbumEvent event, Emitter<AlbumState> emit) async {
    emit(state.copyWith(
      status: RequestStatus.inProgress,
    ));
    try {
      List<AlbumsT_Model> albums = await _repo.fetchAlbumData();
      print("size ${albums.length}");
      emit(state.copyWith(status: RequestStatus.success, albums: albums));
    } catch (errorMsg) {
      emit(state.copyWith(
          status: RequestStatus.failure, message: errorMsg.toString()));
    }
  }



  FutureOr<void> _LoadPhotosEvent(
      LoadPhotosEvent event, Emitter<AlbumState> emit) async {
    emit(state.copyWith(
      status: RequestStatus.inProgress,
    ));
    try {
      List<PhotosT_Model> photos = await _repo.fetchPhotoData(event.id);
      print("size ${photos.length}");
      emit(state.copyWith(status: RequestStatus.success, photos: photos));
    } catch (errorMsg) {
      emit(state.copyWith(
          status: RequestStatus.failure, message: errorMsg.toString()));
    }
  }
}
