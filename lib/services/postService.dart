import 'dart:convert';
import 'package:beta_balmer/pages/createAccount/crearCuenta3.dart';
import 'package:beta_balmer/pages/createAccount/crearCuenta4.dart';
import 'package:beta_balmer/restFunctions/api_service.dart';
import 'package:beta_balmer/utils/localData.dart';
import 'package:beta_balmer/utils/showDialogSingleButton.dart';
import 'package:beta_balmer/utils/uidata.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';


requestLoginAPI(BuildContext context, String correo, String password) async {
  final url = "http://localhost:5000/login";
  post(context,url, body: {
    "correo": correo,
    "password": password
  }).then((dynamic res) {
    print(res.toString());
    if (res["type"]== 1){
      LocalData.setUser(res["id"], res["correo"],res["access_token"], res["nombre"]);
      Navigator.pushNamed(context, UIData.homeRoute);    
    return true;

   // return LoginModel.fromJson(responseJson);
  } else{
    showDialogSingleButton(context, "No se puede ingresar", "Es posible que haya proporcionado una combinación de 'Nombre de usuario' / 'Contraseña' no válida. Por favor intente nuevamente o contacte a su representante de soporte.", "OK");
    return false;
  }
  }

  );
}

requestCreateUser(BuildContext context, String email, String password, String ciudad){
  final url = "http://localhost:5000/CreateUser";
  int idLocalidad=0;
  switch (ciudad) {
    case "Guadalajara":
      idLocalidad=575;
      break;
      case "Morelia":
      idLocalidad=839;
      break;
      case "Monterrey":
      idLocalidad=991;
      break;
      case "Ciudad de Mexico":
      idLocalidad=285;
      break;
  }

  print(idLocalidad);
  post(context,url, body: {
    "correo": email,
    "password": password,
    "idLocalidad": idLocalidad.toString()
  }).then((dynamic res) {
    print(res.toString());

    if (res["type"]== 1){
     Navigator.of(context).push(MaterialPageRoute(
       builder: (context) => CrearCuenta3(idUser: res["idUser"])
     ));
     
    return true;

   // return LoginModel.fromJson(responseJson);
  } else{
    showDialogSingleButton(context, "Error al crear usuario", "Es posible que haya proporcionado un Correo no válido. Por favor intente nuevamente o contacte a su representante de soporte.", "OK");
    return false;
  }
  }

  );
}

requestCreateInteres(BuildContext context, int idUsuario, int idInteres) async {
  final url = "http://localhost:5000/UserInteres";
  post(context,url, body: {
    "idInteres": idInteres.toString(),
    "idUser": idUsuario.toString()
  }).then((dynamic res) {
    print(res.toString());
    if (res["type"]== 1){
      Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CrearCuenta4(),
                  ));
    return true;
    

   // return LoginModel.fromJson(responseJson);
  } else{
    showDialogSingleButton(context, "No se puede ingresar", "Es posible que haya proporcionado una combinación de 'Nombre de usuario' / 'Contraseña' no válida. Por favor intente nuevamente o contacte a su representante de soporte.", "OK");
    return false;
  }
  }

  );
}