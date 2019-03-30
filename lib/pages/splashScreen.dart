import 'package:beta_balmer/utils/uidata.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:beta_balmer/pages/login_page.dart';

class SplashBalmerScreen extends StatelessWidget{
  Widget build(BuildContext context){
    return new SplashScreen(
      seconds: 2,
      navigateAfterSeconds: LoginPage(),
      image: Image.asset(UIData.nuevoBalmerLogoNegativi, height: 200,width: 200, alignment: Alignment.center,),
      photoSize: 100.0,
      gradientBackground: LinearGradient(
        colors: [const Color(0xFF00827D), const Color(0xFF46A040),const Color(0xFF2E7DE1), const Color(0xFF94348C)],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      ) ,

    );
  }
  
}

