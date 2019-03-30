import 'dart:io';
import 'package:beta_balmer/utils/showDialogSingleButton.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/io_client.dart';
import 'package:beta_balmer/utils/localdata.dart';
import 'package:beta_balmer/utils/uidata.dart';

Future<dynamic> post(BuildContext context, String url, {Map headers, body, encoding}) {
  bool trustSelfSigned = true;
   HttpClient httpClient = new HttpClient()..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);
    
    return ioClient
        .post(url, body: body, headers: headers, encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      print(statusCode);

      if (statusCode < 200 || statusCode > 400 || json == null) {
        showDialogSingleButton(context, "No se puede ingresar", "Es posible que haya proporcionado una combinación de 'Nombre de usuario' / 'Contraseña' no válida. Por favor intente nuevamente o contacte a su representante de soporte.", "OK");
        throw new Exception("Error while fetching data");
      }
      return JsonDecoder().convert(res);
    });
  }

Future<dynamic> get(String url) {
  bool trustSelfSigned = true;
   HttpClient httpClient = new HttpClient()..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);
    
    /*return ioClient
        .post(url, body: body, headers: headers, encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      print(statusCode);*/

    return ioClient.get(url).then((http.Response response){
      final String res = response.body;
      final int statusCode = response.statusCode;
      print(statusCode);
      print(res);
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return JsonDecoder().convert(res);
    });
  }


