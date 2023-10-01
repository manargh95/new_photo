part of 'album_screen_bloc.dart';

@immutable

class AlbumState extends Equatable {
  final RequestStatus status;
  final List<AlbumsT_Model> albums;
  final List<PhotosT_Model> photos;
  final String message;

  const AlbumState({
    this.status = RequestStatus.initial,
    this.albums = const <AlbumsT_Model>[],
    this.photos = const <PhotosT_Model>[],
    this.message = '',
  });

  @override
  List<Object> get props => [status, albums, message];

  AlbumState copyWith({
    RequestStatus? status,
    List<AlbumsT_Model>? albums,
    List<PhotosT_Model>? photos,
    String? message,
  }) {
    return AlbumState(
      status: status ?? this.status,
      albums: albums ?? this.albums,
      photos: photos ?? this.photos,
      message: message ?? this.message,
    );
  }
}
