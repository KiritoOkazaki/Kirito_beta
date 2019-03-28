import 'dart:convert';
import 'package:beta_balmer/restFunctions/api_service.dart';
import 'package:beta_balmer/utils/localData.dart';
import 'package:beta_balmer/utils/showDialogSingleButton.dart';
import 'package:beta_balmer/utils/uidata.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

final url = "http://localhost:5000/login";
requestLoginAPI(BuildContext context, String correo, String password) async {
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