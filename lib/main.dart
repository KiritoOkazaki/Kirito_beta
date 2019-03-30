import 'package:beta_balmer/pages/login_page.dart';
import 'package:beta_balmer/pages/homePage.dart';
import 'package:beta_balmer/pages/notfound_page.dart';
import 'package:beta_balmer/pages/splashScreen.dart';
import 'package:beta_balmer/pages/createActivity/page1.dart';
import 'package:beta_balmer/pages/createActivity/page2.dart';
import 'package:beta_balmer/pages/createActivity/page3.dart';
import 'package:beta_balmer/pages/createActivity/page4.dart';
import 'package:beta_balmer/pages/createActivity/page5.dart';
import 'package:beta_balmer/pages/createActivity/page6.dart';
import 'package:beta_balmer/pages/createActivity/page7.dart';
import 'package:beta_balmer/pages/createAccount/crearCuenta1.dart';
import 'package:beta_balmer/pages/recoverPassword/passwordPage1.dart';
import 'package:beta_balmer/utils/uidata.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final materialApp = MaterialApp(
      title: UIData.appName,
      theme: ThemeData(
          primaryColor: Colors.black,
          fontFamily: UIData.quickFont,
          primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      home: SplashBalmerScreen(),
      supportedLocales: [
        const Locale("en", "US"),
        const Locale("hi", "IN"),
      ],
      // initialRoute: UIData.notFoundRoute,

      //routes
      routes: <String, WidgetBuilder>{
        UIData.loginRoute: (BuildContext context) => LoginPage(),
        UIData.homeRoute: (BuildContext context) => HomePage(),
        UIData.activityRoute1: (BuildContext context) => ActivityPage(),
        UIData.activityRoute2: (BuildContext context) => Page2Act(),
        UIData.activityRoute3: (BuildContext context) => Page3Act(),
        UIData.activityRoute4: (BuildContext context) => Pag4Act(),
        UIData.activityRoute5: (BuildContext context) => Page5Act(),
        UIData.activityRoute6: (BuildContext context) => Page6Act(),
        UIData.activityRoute7: (BuildContext context) => Page7Act(),
        UIData.createAccount: (BuildContext context) => CrearCuenta1(),
        UIData.recoverPass: (BuildContext context) => RecoverPassword1(),
        

      
      },
      onUnknownRoute: (RouteSettings rs) => new MaterialPageRoute(
          builder: (context) => new NotFoundPage(
                appTitle: UIData.coming_soon,
                icon: FontAwesomeIcons.solidSmile,
                title: UIData.coming_soon,
                message: "Under Development",
                iconColor: Colors.green,
              )));
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {

      return materialApp;

  }
}
