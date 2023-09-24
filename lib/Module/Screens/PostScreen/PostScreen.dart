
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos_app/Api/repo/repository.dart';
import 'package:photos_app/Model/PostT_Model.dart';
import 'package:photos_app/Module/Bloc/PostBloc/post_bloc.dart';


class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<PostBloc>(
              create: (BuildContext context) => PostBloc(Repo()))
        ],
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.all(20),
            child: CardList(),
          ),
        ));
  }
}

Widget CardList() {
  return BlocProvider<PostBloc>(
    create: (context) => PostBloc(Repo())..add(LoadPostEvent()),
    child: BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state is PostLoadingStat) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is PostLoadedStat) {
          List<PostT_Model> postsList = state.posts;
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                    color: Colors.white,
                  ),
                  itemCount: postsList.length,
                  itemBuilder: (_,index) {
                    return PostCard(
                      userId: "${postsList[index].userId}",
                      title: "${postsList[index].title}",
                      description: "${postsList[index].body}",
                    );
                  },
                ),
              ),
            ],
          );
        }
        if(state is PostErrorStat){
        }          return Text('error');

      },
    ),
  );
}

class PostCard extends StatelessWidget {
  final String userId;
  final String title;
  final String description;

  PostCard({
    required this.userId,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 120,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          // showBottomSheet(context);
        },
        child: Container(
          width: 70,
          // Specify the desired width
          height: 120,
          // Specify the desired height
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CircleAvatar(
                      backgroundColor: Colors.primaries[
                              Random().nextInt(Colors.primaries.length)]
                          [Random().nextInt(9) * 100],
                      child: Center(
                        child: Text(
                          "$userId",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          title,
                          style: TextStyle(fontSize: 15),
                          maxLines: 3,
                        ),
                        Spacer(),
                        Text(
                          description,
                          style: TextStyle(fontSize: 10),
                          maxLines: 3,
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

// void showBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//       backgroundColor: Colors.white54,
//       context: context,
//       builder: (BuildContext context) {
//         return Obx(
//           () => controller.isLoading.value
//               ? Center(child: CircularProgressIndicator())
//               : Column(
//                   children: [
//                     Expanded(
//                       child: ListView.separated(
//                         controller: controller.scrollController,
//                         separatorBuilder: (BuildContext context, int index) =>
//                             Divider(
//                           color: Colors.white,
//                         ),
//                         itemCount: controller.commentsList.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return Card(
//                             child: ListTile(
//                               title: Text(
//                                   "${controller.commentsList[index].name}"),
//                               subtitle: Text(
//                                   "${controller.commentsList[index].body}"),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//         );
//       });
// }
