import 'package:beta_balmer/pages/createAccount/crearCuenat2.dart';
import 'package:beta_balmer/utils/uidata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrearCuenta1 extends StatefulWidget {
  @override
  _CrearCuenta1State createState() => _CrearCuenta1State();
}

class _CrearCuenta1State extends State<CrearCuenta1> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _password1Controller = new TextEditingController();
  bool _value = false;

  void _valueChange(bool value) => setState(() => _value = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
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
                    color: Colors.black,
                  )
                ],
              ),
            ],
          ),
          Container(
            padding: new EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Crear Cuenta",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                new Container(
                  padding: new EdgeInsets.all(16.0),
                ),
                new TextFormField(
                  controller: _emailController,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: "Ingresa un correo",
                    labelText: "Correo",
                  ),
                ),
                new Container(
                  padding: new EdgeInsets.all(16.0),
                ),
                TextFormField(
                  controller: _passwordController,
                  maxLines: 1,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Maximo 8 caracteres",
                    labelText: "Contraseña",
                  ),
                ),
                new Container(
                  padding: new EdgeInsets.all(16.0),
                ),
                TextFormField(
                  controller: _password1Controller,
                  maxLines: 1,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Maximo 8 caracteres",
                    labelText: "Repite tu contraseña",
                  ),
                ),
                new Container(
                  padding: new EdgeInsets.all(16.0),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Checkbox(
                      value: _value,
                      onChanged: _valueChange,
                      activeColor: Colors.green,
                    ),
                    new CupertinoButton(
                      child: new Text(
                        "Crear Cuenta",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.green,
                      minSize: 20.0,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            // return object of type Dialog
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
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => CrearCuenta2(correo:_emailController.text, password:_passwordController.text)
                                    ));
                                    //Navigator.pop(context);
                                  },
                                ),
                                new FlatButton(
                                  color: Colors.red,
                                  textColor: Colors.white,
                                  child: new Text("Rechazar Terminos"),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            UIData.loginRoute,
                                            (Route<dynamic> route) => false);
                                    //Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
                new SizedBox(
                  height: 15.0,
                ),
                new CupertinoButton(
                  child: new Text(
                    "Crear cuenta con Facebook",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.blueAccent,
                  minSize: 20.0,
                  onPressed: () {
                    Navigator.of(context).pushNamed("/CrearCuentaFacebokk");
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
