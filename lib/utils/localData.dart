import 'package:beta_balmer/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  
  static Future<User> getUser() async {
      final preferences = await SharedPreferences.getInstance();
      int id = preferences.getInt('id');
      String token =  preferences.getString('token');
      String nombre =  preferences.getString('nombre');
      String email =preferences.getString('email');
      String foto =preferences.getString('foto');
      int activo =preferences.getInt('activo');
      print(id);
      print(email);
      print(token);
      return new User(id,email, "", token, nombre,foto,activo);
  }

  static setUser(int idUser, String email, String tokenAccess, String nombre, String foto, int activo)async{
    final preferences = await SharedPreferences.getInstance();
      await preferences.setInt("id", idUser);
      await preferences.setString("email", email);
      await preferences.setString("nombre", (nombre!=null)?nombre:"");
      await preferences.setString("token", (tokenAccess!=null)?tokenAccess:"");
      await preferences.setString("foto",(foto!=null)?foto:"");
      await preferences.setInt("activo", activo);
  }

  static cleanData() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('nombre', "");
    await preferences.setString('token', "");
  }
  
}
