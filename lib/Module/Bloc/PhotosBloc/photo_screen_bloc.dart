import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'photo_screen_event.dart';
part 'photo_screen_state.dart';

class PhotoScreenBloc extends Bloc<PhotoScreenEvent, PhotoScreenState> {
  PhotoScreenBloc() : super(PhotoScreenInitial()) {
    on<PhotoScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
