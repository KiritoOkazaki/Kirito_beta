import 'package:beta_balmer/pages/createAccount/crearCuenat2.dart';
import 'package:beta_balmer/utils/uidata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrearCuenta1 extends StatefulWidget {
  @override
  _CrearCuenta1State createState() => _CrearCuenta1State();
}

class _CrearCuenta1State extends State<CrearCuenta1> {
  TextEditingController _controller = new TextEditingController();
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String email, password1, password;
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
                new Form(
                  key: _key,
                  autovalidate: _validate,
                  child: FormUI(),
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
                        onPressed: _sendToServer),
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

  Widget FormUI() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new TextFormField(
            //controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            maxLines: 1,
            decoration: InputDecoration(
              hintText: "Ingresa un correo",
              labelText: "Correo",
            ),
            validator: validateEmail,
            onSaved: (String val) {
              email = val;
            },
          ),
          new Container(
            padding: new EdgeInsets.all(16.0),
          ),
          TextFormField(
            controller: _controller,
            keyboardType: TextInputType.text,
            maxLines: 1,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Minimo 8 caracteres",
              labelText: "Contraseña",
            ),
            validator: (String arg) {
              if (arg.length < 9)
                return 'La contraseña debe ser de almenos 8 caracteres';
              else
                return null;
            },
            onSaved: (String val) {
              password = val;
            },
          ),
          new Container(
            padding: new EdgeInsets.all(16.0),
          ),
          TextFormField(
            //controller: _password1Controller,
            keyboardType: TextInputType.text,
            maxLines: 1,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Maximo 8 caracteres",
              labelText: "Repite tu contraseña",
            ),
            validator: (confirmation) {
              if (confirmation !=_controller.text)
                return 'La contraseña debe ser la misma';
               
            },
          
          ),
        ],
      );

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

  _sendToServer() {
    if (_key.currentState.validate()) {
      // No any error in validation
      _key.currentState.save();
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            CrearCuenta2(correo: email, password: password)));
                  }),
              new FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: new Text("Rechazar Terminos"),
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      UIData.loginRoute, (Route<dynamic> route) => false);
                  //Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }
}
