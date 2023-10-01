import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';
import '../../../../Api/repo/repository.dart';
import '../../../../Config/constant/app_constant.dart';
import '../../../../Model/PhotosT_Model.dart';
import '../../../../Widgets/AppBar.dart';
import '../../../Bloc/AbumBloc/album_screen_bloc.dart';


class PhotoScreen extends StatelessWidget {
  final List<PhotosT_Model> photosArray;
  final int id;

  const PhotoScreen({super.key, required this.photosArray, required this.id});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AlbumBloc>(
              create: (BuildContext context) =>
              AlbumBloc(repo: Repo())
                ..add(LoadPhotosEvent(id: id))),
        ],
        child: BlocListener<AlbumBloc, AlbumState>(
        listener: (context, state) {
      RequestStatus.failure;
      AlertDialog(
        title: Text("Faild"),
      );
    },
    child:
     Scaffold(
      appBar: appBar(),
      body: photosList(photosArray),
    )));
  }
}

Widget photosList(photosArray) {
  return BlocBuilder<AlbumBloc, AlbumState>(
      builder: (context, state)
  {
    photosArray = state.photos;

    return Column(
          children: [
            Expanded(
              child:
               ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                  color: Colors.white,
                ),
                itemCount: photosArray.length,
                itemBuilder: (BuildContext context, int index) {
                  return PhotoCard(
                    imagePath: "${photosArray[index].url}",
                  );
                },
              ),
            ),
          ],
        );});
}

class PhotoCard extends StatelessWidget {
  final String imagePath;

  const PhotoCard({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: imagePath,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.cover,
            height: 150,
          ),
        ),
        );
  }
}
