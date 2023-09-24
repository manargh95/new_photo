import 'package:flutter/material.dart';
import 'package:photos_app/Module/Screens/MainScreen/MainScreen.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MainScreen()));
    });
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
        "assets/images/splash.png",fit: BoxFit.fill,height: double.infinity,
      ),
          Positioned.fill(
            child: Center(child: Text("Pixl",style: TextStyle(color: Colors.grey,fontSize: 50),)),
            top: 60,
          ),
         
        ],
      ),
    );
  }
}
