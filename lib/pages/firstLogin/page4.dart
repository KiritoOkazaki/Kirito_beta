import 'package:beta_balmer/utils/uidata.dart';
import 'package:flutter/cupertino.dart';
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
                padding: EdgeInsets.only(top: 40.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Registro \nTerminado",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              new Container(
                padding: new EdgeInsets.all(16.0),
              ),
              new Text(
                "Toda la informacion ingresada es privada para tu uso y fines estadisticos de la plataforma, al dar continucar aceptas los terminos y condiciones de uso de la aplicacion de Balmer",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              new Container(
                padding: new EdgeInsets.all(16.0),
              ),
              GestureDetector(
                child: new Text("Ver Terminos y Condiciones",
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  return AlertDialog(
                    title: new Text("Terminos y condiciones de uso"),
                    content: new Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                    actions: <Widget>[
                      // usually buttons at the bottom of the dialog
                      new FlatButton(
                          color: Colors.green,
                          textColor: Colors.white,
                          child: new Text("Aceptar"),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ],
                  );
                },
              ),
              new Container(
                padding: new EdgeInsets.all(16.0),
              ),
              new CupertinoButton(
                child: new Text(
                  "Iniciar Sesion",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.transparent,
                minSize: 20.0,
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      UIData.loginRoute, (Route<dynamic> route) => false);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
