import 'package:flutter/material.dart';
import 'package:beta_balmer/restFunctions/api_service.dart';

requestGetAllActivity(BuildContext context) async{
  final url="http://localhost:5000/GetAllActivity";
 getAll(url).then((dynamic res){
   print(res);
   return res;
 });

}