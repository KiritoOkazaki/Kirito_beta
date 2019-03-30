import 'package:beta_balmer/pages/recoverPassword/passwordSucces.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecoverPassword1 extends StatelessWidget {
  String email;

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
                  "Introduce tu correo",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
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
                  validator: validateEmail,
                  onSaved: (String val) {
                    email = val;
                  },
                ),
                new Container(
                  padding: new EdgeInsets.all(16.0),
                ),
                new Text(
                  "Al dar clic en recuperar contraseña, recibirás un correo electrónico de nuestro soporte, con los pasos para restablecer la contraseña",
                  style: new TextStyle(color: Colors.white),
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
                    print("El correo es $email");
                    Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PasswordSucces(),
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

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "el Correo es requerido";
    } else if (!regExp.hasMatch(value)) {
      return "Correo invalido";
    } else {
      return null;
    }
  }
}
