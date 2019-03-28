import 'package:beta_balmer/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  
  static Future<User> getUser() async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      int id =preferences.getInt('id');
      String token =  preferences.getString('token');
      String nombre =  preferences.getString('nombre');
      String email =preferences.getString('email');
      return new User(id,email, "", token, nombre);
  }

  static setUser(int idUser, String email, String tokenAccess, String nombre)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if(tokenAccess.length>0 && nombre.length>0){
      await preferences.setInt("id", idUser);
      await preferences.setString("email", email);
      await preferences.setString("nombre", (nombre!=null)?nombre:"");
      await preferences.setString("token", (tokenAccess!=null)?tokenAccess:"");
    }


  }

  static cleanData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('nombre', "");
    await preferences.setString('token', "");
  }
  
}
