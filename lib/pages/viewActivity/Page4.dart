import 'package:beta_balmer/utils/uidata.dart';
import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF00827D),
                  const Color(0xFF46A040),
                  const Color(0xFF2E7DE1),
                  const Color(0xFF94348C)
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 60.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BackButton(
                    color: Colors.white,
                  )
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "¡ Actividad \nConfirmada !",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              new Container(
                padding: new EdgeInsets.all(16.0),
              ),
              Text(
                "Tu pago fue aprobado",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    ),
                textAlign: TextAlign.center,
              ),
              new Container(
                padding: new EdgeInsets.all(16.0),
              ),
              new FlatButton(
                child: new Text(
                  "Ver Actividad",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                color: Colors.white,
                textColor: Colors.green,
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil("/homePage", (Route <dynamic> route)=> false);
                },
              ),
               new Container(
                padding: new EdgeInsets.all(5.0),
              ),
              new FlatButton(
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.home, color: Colors.white,),
                    new Text(
                  "Inicio",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                  ],
                ),
                color: Colors.white.withOpacity(0),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil("/homePage", (Route <dynamic> route)=> false);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}