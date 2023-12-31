import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos_app/Module/Screens/SplashScreen/SplashScreen.dart';
import 'Config/themes/AppColor.dart';
import 'Module/Bloc/TappingBloc/Tabbing_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => TabbingBloc(),
            ),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appColor(),
        home: SplashScreen(),
      ),
    );
  }
}
