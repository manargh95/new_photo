import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos_app/Model/AlbumsT_Model.dart';
import 'package:photos_app/Model/PhotosT_Model.dart';
import 'package:photos_app/Module/Bloc/AbumBloc/album_screen_bloc.dart';
import 'package:photos_app/Module/Screens/AlbumsScreen/PhotosScreen/PhotosScreen.dart';
import '../../../../Widgets/AppBar.dart';
import 'dart:math';
import '../../../Api/repo/repository.dart';
import '../../../Config/constant/app_constant.dart';

class AlbumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AlbumBloc>(
              create: (BuildContext context) =>
                  AlbumBloc(repo: Repo())..add(LoadAlbumEvent())),
        ],
        child: BlocListener<AlbumBloc, AlbumState>(
            listener: (context, state) {
              RequestStatus.failure;
              AlertDialog(
                title: Text("Faild"),
              );
            },
            child: Scaffold(
              appBar: appBar(),
              body: albumsList(),
            )));
  }
}

Widget albumsList() {
  return BlocBuilder<AlbumBloc, AlbumState>(builder: (context, state) {
    List<AlbumsT_Model> albumList = state.albums;
    List<PhotosT_Model> photoList = state.photos;
    if (state.status == RequestStatus.inProgress)
      return Center(
        child: CircularProgressIndicator(),
      );
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              color: Colors.white,
            ),
            itemCount: albumList.length,
            itemBuilder: (_, int index) {
              return InkWell(
                onTap: () {
                  Repo().fetchPhotoData(albumList[index].id!);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => PhotoScreen(
                              photosArray: photoList,
                              id: albumList[index].id!,
                            )),
                  );
                },
                child: AlbumCard(
                  albumTitle: "${albumList[index].title}",
                ),
              );
            },
          ),
        ),
      ],
    );
  });
}

class AlbumCard extends StatelessWidget {
  final String albumTitle;

  const AlbumCard({
    Key? key,
    required this.albumTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      width: 70,
      height: 120,
      // Specify the desired height
      decoration: BoxDecoration(
        color: Colors.pink,
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Center(
            child: Text(
          "$albumTitle",
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
