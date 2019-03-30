import 'package:beta_balmer/utils/uidata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrearCuenta4 extends StatefulWidget {
  @override
  _CrearCuenta4State createState() => _CrearCuenta4State();
}

class _CrearCuenta4State extends State<CrearCuenta4> {
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
                children: <Widget>[
                
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Confirma y Comienza",
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
                "Porfavor, confirma tu correo, sigue los pasos indicados \ny comienza ahora",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    ),
                textAlign: TextAlign.center,
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
                onPressed: (){
                  Navigator.pushNamed(context, UIData.loginRoute);
                },
              ),

              
            ],
          ),
        ],
      ),
    );
  }


}