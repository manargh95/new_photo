import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'album_screen_event.dart';
part 'album_screen_state.dart';

class AlbumScreenBloc extends Bloc<AlbumScreenEvent, AlbumScreenState> {
  AlbumScreenBloc() : super(AlbumScreenInitial()) {
    on<AlbumScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
