import 'dart:convert';
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

requestCreateUser(BuildContext context, String password, String email, String ciudad){
  final url = "http://localhost:5000/CreateUser";
  int idLocalidad=0;

  switch (ciudad) {
    case "Guadalajara":
      idLocalidad=1;
      break;
      case "Morelia":
      idLocalidad=2;
      break;
      case "Monterrey":
      idLocalidad=3;
      break;
      case "Ciudad de Mexico":
      idLocalidad=4;
      break;
    default:
  }


  post(context,url, body: {
    "correo": email,
    "password": password,
    "idLocalidad":idLocalidad
  }).then((dynamic res) {
    print(res.toString());
    if (res["type"]== 1){
      Navigator.pushNamed(context, UIData.homeRoute);    
    return true;

   // return LoginModel.fromJson(responseJson);
  } else{
    showDialogSingleButton(context, "Error al crear usuario", "Es posible que haya proporcionado un Correo no válido. Por favor intente nuevamente o contacte a su representante de soporte.", "OK");
    return false;
  }
  }

  );
}