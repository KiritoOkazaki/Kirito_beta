import 'package:beta_balmer/model/user.dart';
import 'package:beta_balmer/pages/firstLogin/page2.dart';
import 'package:beta_balmer/utils/localData.dart';
import 'package:beta_balmer/utils/showDialogSingleButton.dart';
import 'package:beta_balmer/utils/uidata.dart';
import 'package:flutter/material.dart';
import 'package:beta_balmer/restFunctions/api_service.dart';

Future<dynamic> requestUserUpdate(BuildContext context, String userName, String nombre, String apellidos, String descripcion, String foto) async {
  final url = "http://localhost:5000/UpdateUser";

  User usr =  await LocalData.getUser();

  int idUser = usr.id ;
  print(idUser);
  await post(context, url, body: {
    "idUser":"$idUser",
    "userName":userName,
    "nombre":nombre,
    "apellidos":apellidos,
    "descripcion":descripcion,
    "foto":"foto",
    "activo":"1"

  }).then((dynamic res){
    if (res["type"]== 1){
     Navigator.of(context).push(MaterialPageRoute(
       builder: (context) => Page2()
     ));
     
    return true;

   // return LoginModel.fromJson(responseJson);
  } else{
    showDialogSingleButton(context, "Error al actualizar al usuario", "Por favor intente nuevamente o contacte a su representante de soporte.", "OK");
    Navigator.of(context).pushNamedAndRemoveUntil(UIData.loginRoute, (Route <dynamic> route)=> false);
    return false;
  }

  });

}