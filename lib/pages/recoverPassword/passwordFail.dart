
import 'package:beta_balmer/pages/createAccount/crearCuenta1.dart';
import 'package:beta_balmer/utils/uidata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordFail extends StatelessWidget {
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
                  "No se encontro el correo propocionado",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                new Container(
                  padding: new EdgeInsets.all(16.0),
                ),
                new Text("No se encontro la informacion en nuestra base, verifica que el correo este bien escrito o crea una cuenta nueva", 
                style: TextStyle(color: Colors.white),
                ),
                new Container(
                  padding: new EdgeInsets.all(16.0),
                ),
                new TextFormField(
                  style: new TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: "Correo",
                    labelStyle: new TextStyle(color: Colors.white),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                new Container(
                  padding: new EdgeInsets.all(16.0),
                ),
                new CupertinoButton(
                  child: new Text(
                    "Recupera tu contraseña",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                  minSize: 20.0,
                  onPressed: () {
                    
                    //Navigator.pushNamed(context, UIData.activityRoute2);
                  },
                ),
                new CupertinoButton(
                  child: new Text(
                    "Crear Cuenta",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.transparent,
                  minSize: 20.0,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CrearCuenta1(),
                  ));
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