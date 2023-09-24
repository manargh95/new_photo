import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos_app/Module/Bloc/TappingBloc/Tabbing_bloc.dart';
import 'package:photos_app/Module/Screens/AlbumsScreen/AlbumsScreen.dart';
import 'package:photos_app/Module/Screens/PostScreen/PostScreen.dart';
import '../../Bloc/TappingBloc/Tabbing_event.dart';
import '../../Bloc/TappingBloc/Tabbing_state.dart';

// Import your AlbumScreen and PostScreen here

class MainScreen extends StatelessWidget {
   MainScreen({super.key});

  final List<String> tabNames = ["Posts", "Albums"];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TabbingBloc, TabbingState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: state.tabIndex,
              children: [
                PostScreen(),
                AlbumScreen(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.pink,
            selectedLabelStyle: TextStyle(color: Colors.pink),
            onTap: (index) {
              BlocProvider.of<TabbingBloc>(context)
                  .add(TabChange(tabIndex: index));
            },
            currentIndex: state.tabIndex,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            unselectedIconTheme: IconThemeData(color: Colors.grey),
            selectedIconTheme: IconThemeData(color: Colors.pinkAccent),
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
            items: tabNames.map((name) {
              return _bottomNavigationBarItem(
                icon: Icon(
                  name == "Posts" ? Icons.textsms_outlined : Icons.image_outlined,
                ),
                label: name,
              );
            }).toList(),
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem({
    required Icon icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: icon,
      label: label,
    );
  }
}
