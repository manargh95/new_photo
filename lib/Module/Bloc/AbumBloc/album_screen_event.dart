part of 'album_screen_bloc.dart';

@immutable

abstract class AlbumEvent  extends Equatable{
  const AlbumEvent();
}

class LoadAlbumEvent extends AlbumEvent{
  @override
  List<Object?> get props => [];

}class LoadPhotosEvent extends AlbumEvent {
  final int id;

  LoadPhotosEvent({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
