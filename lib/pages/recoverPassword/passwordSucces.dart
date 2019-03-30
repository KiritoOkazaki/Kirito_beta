
import 'package:beta_balmer/utils/uidata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordSucces extends StatelessWidget {
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
                  const Color(0xFF94348C),
                  const Color(0xFF2E7DE1),
                  const Color(0xFF46A040),
                  const Color(0xFF00827D),
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
                padding: EdgeInsets.only(top: 40.0),
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
          new Container(
            padding: new EdgeInsets.all(50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Solicitud enviada",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                new Container(
                  padding: new EdgeInsets.all(16.0),
                ),
                new Text("Por favor abre tu correo, sigue los pasos indicados y comienza ahora", 
                style: TextStyle(color: Colors.white),
                ),
                new Container(
                  padding: new EdgeInsets.all(16.0),
                ),
                new CupertinoButton(
                  child: new Text(
                    "Iniciar Sesion",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.transparent,
                  minSize: 20.0,
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      UIData.loginRoute, (Route<dynamic> route) => false);
                    //Navigator.pushNamed(context, UIData.activityRoute2);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}